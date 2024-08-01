#set heading(offset: 1)
#import "/src/additional.typ": todo

The model, which employs differential equations solved by the Runge-Kutta method, has proven effective in predicting key parameters such as cell density, nutrient consumption, and product concentration over time. The use of the Nelder-Mead algorithm for parameter optimization has further enhanced the model's accuracy by aligning simulations with empirical data.

The simulation provided several important insights. Currently, the model assumes 100% cell viability, representing an idealized scenario. Future iterations could benefit from integrating cell death rates to present a more realistic depiction of bioreactor conditions.
Additionally, the simulation of product formation based solely on cell density could be improved by considering additional factors such as nutrient concentrations, temperature variations, and the different stages of the cell life cycle.

The importance of precise oxygen dynamics modeling was also brought into the foreground.
While the current model uses Henry's law and a simple P controller, incorporating temperature-dependent constants and a full PID controller could enhance oxygen management accuracy.


Several recommendations for future work are proposed. Enhancing the viability model by incorporating mechanisms for apoptosis and necrosis would reflect non-ideal survival conditions and provide a more accurate model of cell viability. 
Refining product formation models by including secondary metabolites and product degradation processes could simulate biopharmaceutical production more realistically. 
Developing a detailed volumetric dissolution model and refining the PID control approach would optimize oxygen supply within the bioreactor.
These improvements will further increase the model's precision and practical applicability in real-world bioreactor operations.

In conclusion, this thesis provides a robust and adaptable framework for simulating and optimizing fed-batch bioreactors with CHO cells. 
The proposed future improvements, such as incorporating more realistic viability models, refined product simulations, and advanced oxygen control, promise to further increase the model's accuracy and practical applicability in real-world bioreactor operations.
The findings and methodologies developed here contribute significantly to the field of bioprocess engineering, offering valuable tools for enhancing the efficiency and reliability of biopharmaceutical production. 

