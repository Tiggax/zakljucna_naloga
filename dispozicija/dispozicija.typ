#import "additional.typ": todo

#let naslov = [
  Matematični model bioreaktorja CHO celic z dovajanjem 
]


#let structure = [
  The first chapter is devoted to the introduction, where we will present the basic assumptions and methods we will use.
  
  In the second chapter we will cover information about bioreactors, their types and their classifications. The chapter will also cover types of cells used in the bioreactors.
  
  Third chapter focuses on the modeling of bioreactors. It will cover Mass balance, cell metabolism in the bioractor, monod kinetics and different process controls.
  
  The fourth chapter will talk about Numerical methods, their function, use and will go into depth about Euler and Runge-Kutta methods.
  
  In the Fifth chapter, we will describe the mathematical bioreactor model, operational parameters of the model, and regression analysis of the model.
  
  Sixth chapter talks about the objectives of the work.
  
  Seventh chapter will describe the methods used to construct the system, and each of the variables in the model. In this chapter we will also talk about total balance of the system.
  
  In the eight chapter and ninth chapter will be intended for Results and the Conclusion of the work.

  The tenth chapter will be a summary of the work in slovene language as per rulebook guidelines for english work.
  
  Content:
  + Introduction
  + Bioreactors
    + Types
      + Batch
      + Fed-batch
    + Bioreactors with CHO cells
      + CHO cells
  + Bioreactor Modeling
      + Mass balance
      + Cell metabolism
      + Monod kinetics
      + Process control
  + Numerical methods
    + Euler's method
    + Runge-Kutta method
  + Model
    + Mathematical model Development
    + Operational parameters
    + Regression analysis
  + Objectives
  + Methods
    + System
      + Viable Cell Density
      + Glucose
      + Glutamine
      + Oxygen
    + Total balance
  + Results
  + Conclusion
  + Summary (in Slovene)

]


#align(center, text(upper(naslov), size: 1.5em))
#align(center)[Tilen Gimpelj]





Bioreactors with CHO (Chinese Hamster Ovary) cell cultures are used in the pharmaceutical industry to produce various metabolic products. Research and development of these cell cultures represent a significant cost for studying the operation of bioreactors under different parameters. The use of mathematical models can reduce costs and save time required for industrial production. The task involves using systems of ordinary differential equations to simulate the process within the bioreactor. The created model would then be calibrated using hypothetical data from a smaller research reactor and subsequently simulate the process of a larger, industrial reactor.

The work has been carried out since mid-March at Novartis Mengeš, under the supervision of mentor Andrej Pohar. The planned completion of the project is in mid-August.

#structure


#bibliography("dispo.bib", full: true, title: [Sources])


#pagebreak()

Andrej Pohar je zaposleni Kemični inžinir v Novartis d.o.o.. Deluje v poddružnici Novartis - Mengeš. 
deluje na oddelku za biološke procese, kjer vodi oddelek za simulacije bioprocesov. 
Doktoriral je na Univerzi v ljubljani, na fakulteti za Kemijo in kemijsko tehnologijo. Kot raziskovalec je sodeloval v Kemijskem inštitutu.
