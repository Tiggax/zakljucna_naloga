import json
import os
from pathlib import Path
from scipy.integrate import solve_ivp 
import numpy as np
import matplotlib.pyplot as plt


bioreactor = {}
metoda = "RK23"
bioreactor["volume"] = 100 # L
bioreactor["temperature"] = {"shift": 37, "post": 34} # °C
bioreactor["medium"] = 45 # L
bioreactor["seeding_VCD"] = 0.5 # MVC/ml
bioreactor["feed"] = {
    "start": 2, # days 
    "rate": 0.03, 
    "feeds": {
        "glucose": 12, # g/L
        "glutamin": 7, # g/L
    }
}
bioreactor["flow"] = 0.3 # vvh
bioreactor["DO"] = {"set_point": 0.4, "start": 90}


time = 14 # dni
FEED_MIN = 2 * 24 * 60 # DAYs * 24h * 60 => min


MU = 0.0004 # Fit glede na podatke
N_VCD = 0.7
K_PRODUCT = 0.001

K_GLUC = 1e-5
K_GLUT = 1e-5

KS_GLUC = 5e-3
KS_GLUT = 5e-3

# feed input c
GLUC_FEED = 12
GLUT_FEED = 7

HENRY = 1.6e-3
K_C_O2 = 1
C_O2_SAT = HENRY * 0.21
DO_SETPOINT =  30 # % level DO
O2_FLOW_MAX = 5

FI_O2_MAX = 10
AIR_FLOW = 0.5 # VVh
PZV = 13
Kc = 20
FI_V = bioreactor["volume"] * bioreactor["feed"]["rate"] / ( 24 * 60)

bioreactor["c_O2"] = {"Start": 0.21 * HENRY}


O2_flow_list = {}

def fn(t,x):
    V, vcd, gluc, glut, c_O2, O2_flow, product = x
    
    # VCD
    c_mu = MU * ( gluc / (KS_GLUC + gluc)) * ( glut / ( KS_GLUT + glut ) ) #* (c_O2 / (K_C_O2 + c_O2))
    d_vcd = c_mu * vcd**(N_VCD) 
    
    # gluc
    d_gluc = - K_GLUC * vcd * (gluc / (KS_GLUC + gluc))
    
    # glut
    d_glut = - K_GLUT * vcd * (glut / (KS_GLUT + glut)) 
    
    # c_O2
    DO = ( c_O2 / C_O2_SAT) * 100
    DO_ERROR = DO_SETPOINT - DO
    mv = Kc * DO_ERROR
    
    # PRODUCT
    d_product = K_PRODUCT * vcd
    
    if DO_ERROR > 0:
        O2_flow = ( mv * FI_O2_MAX ) / 1000
        if O2_flow > O2_FLOW_MAX:
            O2_flow = O2_FLOW_MAX
    else:
        O2_flow = 0
    O2_flow_list[t] = O2_flow

    
    flow_total = AIR_FLOW + O2_flow
    kLa = ( 1.3e-3 * PZV**1.1 * flow_total**0.9 ) / 60
    
    fiv_O2_c = AIR_FLOW * 0.21 + O2_flow
    
    x_O2 = fiv_O2_c / flow_total
    p_O2 = x_O2 # * 1 bar
    
    c_O2_s = HENRY * p_O2
    
    out = vcd * 1.9444e-10 * 60
    otr = kLa * ( c_O2_s - c_O2 )
    
    d_c_O2 = -out + otr if c_O2 > 0 else otr
    
    # Totalna bilanca
    if t < FEED_MIN:
        d_V = 0
    else:
        d_V = FI_V
        d_vcd -= vcd * ( FI_V / V )
        d_gluc += ( GLUC_FEED - gluc ) * ( FI_V / V )
        d_glut += ( GLUT_FEED - glut ) * ( FI_V / V )
    
    return [d_V, d_vcd, d_gluc, d_glut, d_c_O2,0, d_product]


start = [
            bioreactor["medium"],
            bioreactor["seeding_VCD"],
            bioreactor["feed"]["feeds"]["glucose"],
            bioreactor["feed"]["feeds"]["glutamin"],
            bioreactor["c_O2"]["Start"],
            0,
            0,
        ]

time_min = time * 24 * 60
Nt = int(1e5)


evall = np.linspace(0, time_min, Nt)
print("solving...")
sol = solve_ivp(fn, t_span=[0, time_min], y0 = start, method=metoda, t_eval = evall, max_step = 1e-1)

print("found solution")
sol_time = sol.t / 60 / 24

names = [("V", "Volume"), ("VCD", "Viable cells"), ("gluc", "Glucose"), ("glut", "Glutamin"), ("DO", "Dissolved Oxygen"),("flow", "flow"), ("Product", "Product")]

sol.y[4] = (sol.y[4] / C_O2_SAT) * 100 # change c_O2 to DO


input = [(x, sol.y[i])  for i,x in enumerate(names)]

plt.close()
for labels, data in input:
    plt.plot(sol_time, data, label=labels[1])
    

flow_o = []
flow_t = []
inner = []
for t,x in O2_flow_list.items():
    inner.append((t,x))
def p(x):
    t,y = x
    return t

inner.sort(key=p)
for t,x in inner:
    flow_t.append(t/60/24)
    flow_o.append(x * (100/ O2_FLOW_MAX))
    
# for t, x in O2_flow_list.items():
#     flow_t.append(t/ 60 / 24)
#     flow_o.append(x * (100 / O2_FLOW_MAX))
    
# devide into chunks
print(len(flow_o))

plt.plot(flow_t,flow_o, label="O2 FLOW")



plt.xlabel('Time [Days]')
plt.ylabel('Y-values')
plt.axhline(y=DO_SETPOINT, color='r', linestyle='--')
plt.legend()
# plt.show()
print("plotted")
plt.show()