#let zahvala = [
  I would like to thank my work mentor Andrej Pohar, PhD, for offering me the opportunity to delve into the field of mathematical modeling of bioreactors.
  His guidance, insights, and encouragement have been instrumental in shaping the direction and quality of this research.

  I am also grateful to Assoc. Prof. Aleksander Tošić, PhD, who stepped in last minute and ensured that everything was prepared for my thesis.
  His dedication and support was crucial in bringing this project to fruition in such a short timeframe.
]

#let izvleček = [
  #text(fill: red, [
    


    
  ])
]

#let abstract = [
  Bioreactors are widely used in 

]

#let git = [
  Link to the Github repository of the app: 
  
  https://github.com/tiggax/bion
  
  Key contents:
   - *`src/model.rs`* - implementation of the bioreactor model
   - *`src/regressor.rs`* - implementation of a reggresion cost function for the model

   Link to the Github repository of the data:

   https://github.com/tiggax/zakljucna_naloga

   Key contents:
  - *`podatki`* folder with the test data used for fitting in the thesis
  - *`data`* folder with all of the generated data for the figures. This folder contains all of the data outputs of the results of the different system fits. It also contains `json` files needed to reload the state into the app.
  - *`R-Scripts`* folder with scripts for result generation figures
]


#let todo(body) = text(
    fill: navy, 
    weight: "black", 
   //lang: "sl",
    body
)

#import "@preview/sourcerer:0.2.1": code

#let source = figure(
  caption: [Trait implementation],
  kind: image,
  code(raw(read("/data/model.rs"), lang: "Rust"), lines: (236,300), )
)