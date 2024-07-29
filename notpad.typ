#import "@preview/cheq:0.1.0": checklist

#set text(lang: "sl")

*Pomembni roki*
- 30 junij - prijava teme
- 15.julij zaključek in oddaja v vpogled NVS
- 10. avgust - oddaja končne naloge v referat (potrjeno s strani mentorja)





= useful links:

- https://www.sciencedirect.com/topics/engineering/stirred-tank-bioreactors#chapters-articles

- https://www2.it.uu.se/edu/course/homepage/modynsyst/vt12/Lecture/DynSystBior2012.pdf



= updates

umaknl $"cells"^"n_vcd"$
zdej je `n_vcd` za temeprature shift

day of the shift je konstanten, lahko ga spreminja user -.-
n_vcd ima zdej pre pa post.

- todo spisat o temperature shiftu


Regresija

1. fitanje 
  - `mu_max` in 
  - `n_vcd`(post temp shift)
  - `feed_rate`


Dodam pod result and disscusions

- reggresion analyiss
  - pofitan primer : pada ,rastejo celice itd
  - effect of seeding vcd, če seeding vcd 0.8 dodam 30% več pa komenitru kok vpliva seeding vcd na produkt
  - effect of air flow: 
    - pri razlicnih konstantah DO, airflow pa tezadeve kok pol kisik dela
    - vpilva na kok hit se vklop regulacija
    - effect of 




Limitni primeri
- Seeding vcd +- 0.1/0.2 količine
- 

#pagebreak()
= TODO

#show: checklist

- [x] Zahvala
- [ ] KDI
  - [ ] imena
  - [ ] ključne besede
  - [ ] Izvleček
- [ ] KDI (eng)
  - [ ] imena
  - [ ] ključne besede
  - [ ] Izvleček(abstract)
- [ ] Uvod
- [ ] Bioreaktor
  - [ ] tipi
  - [ ] batch
  - [ ] fed-batch
- [x] Nelder-mead
  - [x] delovanje
- [ ] masna bilanca
- [ ] Monod kinetika
- [x] Process control
- [ ] Model
  - [ ] developent
  - [ ]  parameters
  - [ ] regression analysis
- [ ] Methods
  - [ ] mass balance
  - [ ] oxigen
    - [ ] PID
    - [ ] mehurčki
  - [ ] total balance
  - [ ] product
- [ ] Results
- [ ] summary
- [ ] povzetek



== Z andrejem za čez it 

- PID Control
  - integral del kako
- Volumni
  - če večji feed rate potem PID več delat? ali manj? lahko da raztaplja lažje v več volumna
  - produkt `c` bi mogla bit manjša če 


idealni model



temp shift vpliva na producijo produta, naredij ga več