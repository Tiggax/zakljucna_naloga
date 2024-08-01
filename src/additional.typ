#let todo(body) = text(
    fill: navy, 
    weight: "black", 
   //lang: "sl",
    body
)


#let zahvala = [
  I would like to thank my work mentor Andrej Pohar, PhD, for offering me the opportunity to delve into the field of mathematical modeling of bioreactors.
  His guidance, insights, and encouragement have been instrumental in shaping the direction and quality of this research.

  I am also grateful to Assoc. Prof. Aleksander Tošić, PhD, who stepped in last minute and ensured that everything was prepared for my thesis.
  His dedication and support was crucial in bringing this project to fruition in such a short timeframe.
]

#let izvleček = [
  #set text(lang: "sl")
  Zaključna naloga predstavlja podroben matematični model bioreaktorja z dovajanjem in uporabo celic kitajskega hrčka (CHO), ki so ključne za proizvodnjo biofarmacevtskih izdelkov. 
  Glavni cilj je optimizirati delovanje bioreaktorja s simulacijami, ki analizirajo vpliv različnih pogojev na rast celic in tvorbo produktov. 
  Diferencialne enačbe razmerji, rešene z metodo Runge-Kutta, natančno napovedujejo gostoto celic, porabo hranil in koncentracijo produktov skozi čas.
  Optimizacija parametrov je dosežena z algoritmom Nelder-Mead, kar zagotavlja zanesljivost modela s prilagajanjem eksperimentalnim podatkom.
  Naloga predstavi kompleksnost prileganja dinamike delovanja snovi v bioreaktorju z realnimi podatki v bioreaktorjih, in predstavi enostavni model za prihodnje delo modeliranja bioreaktorjev.
]

#let abstract = [

  The final thesis presents a detailed mathematical model of a fed-batch bioreactor with use of Chinese Hamster (CHO) cells, which are crucial for the production of biopharmaceutical products.
  The main goal is to optimize the operation of the bioreactor through simulations that analyze the influence of different conditions on cell growth and product formation.
  The proportional differential equations solved by the Runge-Kutta method accurately predict cell density, nutrient consumption, and product concentration over time.
  Parameter optimization is achieved using the Nelder-Mead algorithm, which ensures the reliability of the model by fitting experimental data.
  The task presents the complexity of fitting the dynamics of substance action in a bioreactor with real data in bioreactors, and presents a simple model for future bioreactor modeling work.

]

#let git = [
  Link to the Github repository of the app: 
  
  https://github.com/tiggax/bion
  
  Key contents:
  - *`src/model.rs`* - implementation of the bioreactor model
  - *`src/regressor.rs`* - implementation of a regression cost function for the model

  Link to the Github repository of the data:

  https://github.com/tiggax/zakljucna_naloga

  Key contents:
  - *`podatki`* folder with the test data used for fitting in the thesis
  - *`data`* folder with all of the generated data for the figures. This folder contains all of the data outputs of the results of the different system fits. It also contains `json` files needed to reload the state into the app.
  - *`R-Scripts`* folder with scripts for result generation figures

  Link to the Github repository of the `ode-solvers` library:

  https://github.com/tiggax/ode-solvers

  The branched use was `thesis_fix`
  
  Key contents:
  - *`src/dop_shared.rs`* contains the System trait, needed to be modified for mutable values to work
  - *`src/rk4.rs`* contains the Runge-Kutta implementation, with two additional function with `mut_` prepend that were modified for system to work.
]


#import "@preview/sourcerer:0.2.1": code

#let source = figure(
  caption: [Trait implementation],
  kind: image,
  code(raw(read("/data/model.rs"), lang: "Rust"), lines: (236,300), )
)