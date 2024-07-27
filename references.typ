#set heading(numbering: "1.1")

#let done(body) = text(fill: green, body)


= Reference summary key sections

== Kim 2007

/ q: specific productivity

#done[
  Recent advances in cell culture technology for rCHO cells
  have achieved significant improvement in protein production
  leading to titer of more than 10 g/L to meet the huge demand
  from market needs @Kim_2012[p. 917].
]


#done[
  The popularity of CHO cells can be attributed to the
  following reasons. Firstly, since CHO cells have been dem
  onstrated
  as safe hosts for the past two decades, it may be
  easier to obtain approval to market the therapeutic proteins
  from regulatory agencies like the FDA. Secondly, low specific productivity (q), which is one of the disadvantages of
  using mammalian cells for protein production, can be over
  come
  by gene amplification in CHO cells. For CHO cells,
  powerful gene amplification systems, such as dihydrofolate
  reductase (DHFR)-mediated or glutamine synthetase (GS)-
  mediated gene amplification, are available. Thirdly, CHO
  cells have the capacity for efficient post-translational mod
  ification,
  and they produce recombinant proteins with glyco
  forms
  that are both compatible with and bioactive in
  humans. Finally, CHO cells can be easily adapted to growth
  in the regulatory-friendly serum-free (SF) suspension conditions, a characteristic preferred for large-scale culture
  in bioreactors.
] 
#done[
  Currently, stirred tank bioreactors over
  10,000 L scale are readily used for SF suspension cultures
  of recombinant CHO (rCHO) cells producing therapeutic
  antibody @Kim_2012[p. 917-918].
]


Over the past two decades, a more than 100-fold yield
improvement of titers in rCHO cell culture has been ob
served,
and this improved product yield has been largely
attributed to the development of serum-free medium as well
as the optimization of feeding strategies (Hacker et al.
2009) @Kim_2012[p. 918].

For example, clones suitable for SF
suspension fed-batch culture are selected for large-scale
commercial production of therapeutic antibody. In the same
context, many biotech companies have their own therapeutic
protein production platform, and clones suitable for that
platform are selected to facilitate and speed up the process
development of new therapeutic proteins @Kim_2012[p. 918].

Once the DNA enters the host cell nucleus, it integrates
into the chromosome at a random location. If necessary,
high producing parental clones are subjected to gene ampli
fication
for further enhancement of q @Kim_2012[p. 918].

Clones are selected on the basis of their high expression
levels, and their performance is further tested in SF suspension
fed-batch culture, which is most widely used for large-scale
commercial production of therapeutic antibody. Clones show
ing
the best performance in SF suspension fed-batch culture in
lab-scale bioreactors with pre-developed feeding cocktails are
usually selected as production cell lines @Kim_2012[p. 918].

As described earlier, the establishment of a high-producing,
stable rCHO cell line by gene amplification followed by an
extensive screening is time-consuming and labor-intensive.
Vector engineering which modulates transcriptional activity
facilitates rCHO cell line development @Kim_2012[p. 918].


Cell death occurs in two forms—necrosis or two types of
programmed cell death (PCD), namely, apoptosis and
autophagy. While necrosis is a sudden and passive form,
PCD is an active, genetically controlled process. Many
researchers have recognized PCD as a target to overcome
the problem mentioned above. Apoptosis has gained impor
tance
in mammalian cell culture, including that of rCHO
cells for therapeutic protein production over the last two
decades. The prevention of apoptosis by establishing
apoptosis-resistant rCHO cells appears to be beneficial @Kim_2012[p. 920].


== Ritacco 2018

F128 Ham’s nutrient mixture was an early successful example of a fully synthetic, chemically defined, and serum-free medium which could support clonal growth of Chinese hamster ovary (CHO) cells. This medium was designed for single cell cultivation and expansion, but was not well suited to sup 105 port growth to high cell densities (greater than cells per ml). Sato and colleagues later determined that this deficiency could be remedied by mixture of Ham’s F12 with Dulbecco’s medium, plus supplementation with hormones, growth factors, and transferrin, creating a new formulation called DMEM/F12.9
Building upon this work, Hiroki Murakami and colleagues identified four critical additives necessary for the replacement of serum in chemically defined media: insulin, transferrin, ethanolamine, and selenium. Combined together, these four additives formed a supplement (ITES), which was used in place of serum in early serum-free media @Ritacco_2018[p. 1-2].

== Cui 2023

Quantitative modeling integrates both kinetics for some key reaction steps and optimization-driven metabolic flux allocation, using flux balance analysis; this is known to lead to certain mathematical inconsistencies. Here, we propose a physically-informed data-driven hybrid model (a “gray box”) to learn models of the dynamical evolution of Chinese Hamster Ovary (CHO) cell bioreactors from process data. The approach incorporates physical laws (e.g. mass balances) as well as kinetic expressions for metabolic fluxes
@Cui_2023[p.1]

#done[The advantage of using CHO cells is that the correct (i.e., mammalian-specific) glycosylation patterns are achieved for the protein therapeutics (e.g., therapeutic antibodies) @Cui_2023[p.1].]

== Butler 2005

#done[
  There has been a rapid increase in the number and demand for approved biopharmaceuticals produced from animal cell culture processes over the last few years. 
  In part, this has been due to the efficacy of several hu manized monoclonal antibodies that are required at large doses for therapeutic use.
]

Characterization of cellular metabolism and physiology has enabled the design of fed-batch and perfusion bioreactor processes that has allowed a significant improvement in product yield, some of which are now approaching 5 g/L. 
Many of these pro cesses are now being designed in serum-free and animal component-free media to ensure that products are not contaminated with the adventitious agents found in bovine serum.

The first human therapeutic protein to be licensed from this technology in 1982 was recombinant insulin (Humulin from Genentech) but the relative structural simplicity of this molecule allowed its large-scale production to be developed in Escherichia coli, which is fast growing and robust compared to mammalian cells. 
It was soon realised that the subsequent targets for recombinant therapeutics were more complex and required the post-translational metabolic machinery only available in eukaryotic cells.

@Butler_2005[p. 283]

  
#done[
  Chinese hamster ovary (CHO) cells have become the standard mammalian host cells used in the production of recombinant proteins, although the mouse myeloma (NS0), baby hamster kidney (BHK), human em bryonic kidney (HEK-293) or human-retina-derived (PER C6) cells are alternatives. 
  All these cell lines have been adapted to grow in suspension culture and are well suited for scale-up in stirred tank bioreactors.
]

The advantage of CHO and NSO cells is that there are well-characterised platform technologies that allow for transfection, amplifi cation and selection of high-producer clones.

@Butler_2005[p. 284]


The most successful strategies involve feeding concentrates of nutrients based upon the predicted requirements of the cells for growth and production. 
This can involve slow feeding of low concentrations of key nutrients. The maintenance of low concentration set points of the major carbon substrates enables a more efficient primary metabolism with leads to lower rates of production of metabolic by-products, such as ammonia and lactate.

As a result the cells remain in a productive state over extended time frames. 
The strategic use of fed-batch cultures has enabled considerable enhancement of yields from these processes. 
This is often combined with a biphasic strategy of production in which cell proliferation is allowed in the first phase so that high cell densities accumulate, followed by a phase in which cell division is arrested to allow cells to attain a high specific productivity.


By directly supplying cells with a balanced nutrient feed, a fed-batch culture can now be expected to yield upwards of 2 g/L of recombinant protein, which is probably at least tenfold higher than the maximum that could be expected by a simple batch culture in standard culture medium.


Producer cells can be made to be sufficiently robust in this environment if they are provided with suitable growth media and gas sparging is carefully controlled. 
The capacity of commercial bioreactors for animal cells has gradually increased over the past two decades, with capacities now reported up to 20,000 L from some of the larger biopharmaceutical companies. 
Airlift bioreactors have also been applied to large-scale animal cells and these have been shown to be efficient for protein production.

@Butler_2005[p. 285]

#done[Bovine serum was used as a supplement of cell culture media for several decades. 
It is a rich source of hormones, growth factors and trace elements that promote rapid cell growth and also its high albumin content ensures that the cells are well protected from potentially adverse conditions such as pH fluctuations or shear forces. 
However, the composition of serum is variable and undefined, which leads to inconsistent growth and productivity.]

#done[However, the mad cow crisis in the beef industry alerted a concern for the use of animal serum and any other animal derived components in the production of biotherapeutics. 
This has now led to a strong demand for cell culture for mulations that are free of all animal components.]

It turns out that producer cell lines are quite fastidious in their growth requirements and that such requirements vary considerably from one cell line to another. 
Therefore, it has not been possible to design a single serum free formulation to act as a serum substitute suitable for the growth of all cell lines. 
In fact even different clones of CHO cells may require different formulations for optimal growth.

It is of considerable value to be able to prevent or inhibit apoptosis in culture in order to extend the time of high cell viability and prolong protein production. 
There are two strategies that can be used for this. 
The cellular environment can be manipulated through media supplementation or the intracellular environment can be modified by genetic engineering.
@Butler_2005[p. 286]

With an increase in the number and demand for recombinant biopharmaceuticals, there is a requirement for greater biomanufacturing capacity. 
This created a major problem in 2001 when the demand for Enbrel, a recombinant fusion protein commercialized by Immunex for the treatment of rheumatoid arthritis, exceeded expectations.

One of the reasons for this extra demand for biomanufacturing capacity is the dose requirement for the novel therapeutic humanized monoclonal antibodies that are now being commercialized. 
The requirement for hundreds of kilograms per annum far exceeds other recombinant therapeutics such as erythropoietin, which is more potent at smaller doses. 
The extra demand for production is being met by the construction of increased bioreactor capacity by some biopharmaceutical companies such as Biogen, Lonza Biologics and Genentech. 
However, the requirement for large-capacity bioreactors may be offset by an increased productivity of cell culture systems, some of which maybe capable of producing up to 5 g/L and is up to 100 times the productivity that would have been expected a few years ago. 
Clearly, a tenfold enhancement of cell line productivity reduces the volumetric capacity required of the bioreactor for manufacture by an equivalent factor.

@Butler_2005[p.288]

== Kretzmer 2002

#done[
  The developments of the 1970s – fusion of cells to form hybridomas, and genetic engineering – triggered a second wave of products. 
  Monoclonal antibodies and recombinant proteins for diagnosis and therapy set new challenges for the inventors.  
]

Products with high value and small demand can be produced in multiple unit systems whereas “bulk” products for vaccination and therapy may need large-scale bioreactors to be cost effective.

#done[In 1907, Ross Harrison was the first to record the maintenance and growth of nerve cells in a hanging drop over a period of up to 30 days. 
These experiments (Harrison 1907) showed that normal cell functions can continue in vitro and therefore the year 1907 is commonly regarded as marking the beginning of cell cultivation. ]
Harrison and his successors observed that strict aseptic conditions were crucial for the success of such experiments.
During the next four decades, the progress of cell cultivation was limited due to the stringent sterility controls necessary. The development of antibiotics in the late 1940s was another milestone. The addition of antibiotics eased the handling of complex undefined culture media.
At the same time, the development of sterility techniques took place. During the following decade, great progress was made towards mass cultivation of animal cells and production processes.


#done[The most important breakthrough towards large scale cultivation was achieved by Earle and Eagle, who made an extensive analysis of the requirements of cells in vitro. 
In 1955, Eagle reported a chemically defined medium known as EMEM (Eagle’s minimum essential medium; Eagle 1955) which could replace the biological fluids used thus far. 
The only handicap was the necessity for the addition of undefined blood serum.]

@Kretzmer_2002[p. 135]

The success of Capstick and co
workers
(1962) in culturing BHK (baby hamster kidney)
cells in suspension like microorganisms meant the break
through
to industrial usage of animal cells. This, together
with the establishment of permanent cell lines, drove the
development of large-scale processes in industry.

The replacement of the primary monkey kidney cells with safer cell lines (WI-38 and MRC-5) increased the number of licensed human vaccines: measles (1963), rabies (1964), mumps (1969) and rubella (1969). 
All these processes were batch type since the cells should grow to high density and then be infected with the virus. 
After virus propagation the cells are of no further interest and the virus is harvested.

Examples of the success of this strategy are the, now licensed, monoclonal antibodies for human therapy, e.g. for immunosuppression in organ transplant operations (Zenapax, Simulect), against non-Hodgkin lymphoma (Rituxan), against Morbus Crohn (Remicade), against breast cancer (Herceptin) and angioplastic surgery (Reopro).

#done[In the early 1980s, a new kind of product was introduced to the pharmaceutical industry: recombinant proteins.]
Genetic engineering had progressed to the point that stable insertion of target DNA into mammalian cells was possible. The first non-native product produced by animal cells was tissue plasminogen activator (tPA), a protein necessary for dissolving blood clots for the treatment of cardiac infarction.

@Kretzmer_2002[p. 136]

Inserting the human tPA gene into CHO cedce(chinese hamster ovary) cells and growing the cells in agitated-tank reactors increased productivity to 50 mg 109 CHO $"cells"^(-1)"day"^(-1)$ or even higher.


Developing a new product and studying the growth and production characteristics of the cell line used is carried out on the laboratory scale, normally starting with small flasks and then changing to spinner flasks or roller bottles depending on the growth characteristics of the cell line (anchorage dependent or not). 
For initial quality studies of the new product this scale is sufficient but a scale-up is necessary as soon as preclinical studies will follow. 
Depending on the product requirements there are two possibilities: keeping the scale and working in multiple units or transferring the process to larger reactors.

@Kretzmer_2002[p. 137]

=== BATCH REACTOR

Antibodies for research and some diagnostic applications may be produced in the small-scale reactors described above. 
Antibody doses for some therapeutic applications can range from 0.5 to more than 5 mg/kg and this can translate into a requirement for tens to hundreds of kilograms per year. 
Large scale (tens of grams upwards) needs systems with the potential for scale up.

The ideal reactor for optimal growth and/or production provides a homogenous environment and can be easily controlled. 
#done[
  These conditions can be achieved in stirred-tank reactors, which are the preferred reactors for scaling up processes with suspension cells.
]


#done[
  The basic parameters for biotechnological processes, like temperature, pH value, dissolved oxygen, etc., are measured and controlled by standard devices implemented in every commercial stirred tank. 
]
#done[
  For optimal mixing, various types of impellers are available as well as standard sampling probes for monitoring the environment and the cells during the process. 
  A disadvantage of the stirred tank reactor compared to the small-scale reactors is the oxygen supply. 
]
At small-scale, the ratio of surface area to culture volume is high enough to maintain the oxygen level in the supernatant. Using a stirred-tank reactor, this ratio is negligible with respect to aeration. 
Devices such as spargers, baffles and low shear impellers, have been developed to supply oxygen to cultures in stirred-tank reactors.
@Kretzmer_2002[p. 138]

Another possibility to overcome the problem of the rising air bubbles is bubble-free aeration using membranes for indirect aeration. 
The supply of oxygen is diffusion-controlled and no bubbles arise. 
The length of the membrane is limited. 
The depletion of oxygen increases
with increasing length of the membrane, i.e. the average oxygen transfer rate is decreasing. On the other hand the pressure inside the tubing is limited. If the critical transmembrane pressure difference (“bubble point”) is reached, bubbles are formed. A 2-l reactor needs a membrane length of at least 6 m to reach an oxygen transfer rate of 30–40 mg (lh)–1. Several hundred metres of membrane for one reactor makes handling complicated and disturbances by rupture and contamination probable. 
Therefore, the scale-up of this system is limited to bioreactors of about 500 l but it works very well for small scale tank reactors.
@Kretzmer_2002[p. 188-139]


However, problems and challenges still remain for the optimisation of this kind of process. 
The nature of a batch process generates a gradient of nutrients during the run. 
This leads not only to a depletion of the nutrients, and therefore a drop in viability and death of the cells, but also to a steady increase in toxic metabolites.


Cell density and culture life-span can be increased by systematic modification of the culture medium with addition of the most important nutrients to keep the level constant. 
Fed-batch operation increases the product output of the process.

Nevertheless, batch reactors ultimately result in a toxification of the process since the toxic metabolites are not removed. 
The main challenges to be addressed are the cell demands concerning nutrients (requiring study of cell metabolism), developing optimised feeding strategies, and detoxification of the culture supernatant.

=== Perfusion

Stirred-tank reactors can also be operated in continuous mode. 
This technique is well-known from microorganisms, where large quantities of product are produced. 
Unfortunately, the technique is not directly transferable to animal cell cultures. 
In contrast to microorganisms, animal cells have very slow growth rates and this makes cell retention inevitable. 
This has led to the development of a variety of internal and external separation devices like spin filters, external tangential flow filtration units, acoustic resonance sedimentation, cell settlers and continuous centrifuges.


Perfusion cultures, on the other hand, combine homogenous mixing with control of the environment and detoxification of the reactor. 
The continuous exchange of medium allows maintenance of very low concentrations of toxic metabolites.


The overall advantage of perfusion cultures is the very small scale required compared with batch cultures in order to obtain the desired amount of product.

@Kretzmer_2002[p. 139]

Validation of the perfusion process is much more complicated and time-consuming than for batch cultures.
The validation has to be done for the whole culture run.
It has to be shown that the process is stable throughout the whole run (viability, product release and cell-related performance), the product quality is the same at different cultivation times and reactor scale, and finally that the cells are genetic stability for the entire process run. 
This disadvantage is compensated for by the advantages of perfusion cultures. 
They provide a high degree of control: conditions for optimal medium requirement can be kept constant and a real steady state is achieved. 
A high cell density perfusion culture can be a very effective and economic large-scale process.


Before more industrial processes can be transferred to perfusion mode, some challenges remain to be addressed.
For example, cell retention has to be more sophisticated. The devices available so far are a major bottleneck because of fouling and blocking.

Another important topic is the run-time of the perfusion. 
This depends on the cell line and culture medium. 
Therefore, cell metabolism under production conditions has to be studied carefully to gain more knowledge for developing better strategies for process control.

@Kretzmer_2002[p. 140]

== Gibbons 2021

The Quality by Design (QbD) approach to the production of therapeutic monoclonal
antibodies (mAbs) emphasizes an understanding of the production process ensuring
product quality is maintained throughout. Current methods for measuring critical
quality attributes (CQAs) such as glycation and glycosylation are time and resource
intensive, often, only tested offline once per batch process.

@Gibbons_2021[p. 1]

== mandenius 2016

the bioreactor is the designed space where biological reactions take place.

The bioreactor should create a biosphere that as profoundly and adequately as possible provides the ideal environment for the biological reaction.
The path for reaching, attaining, and maintaining this is the main task for bioreactor engineers to find.

@mandenius_2016[p. 1]

#done[
  The bioreactor is a historical apparatus known since ancient times. Old antique cultures were able to solve bioengineering design challenges for practical purposes such as wine and beer making from mere experience and observations. This paved the way for the evolvement of biotechnological processes, primarily for preparation and production of food products @soetaert_2010.
]

#done[In the early twentieth century, large-scale fermentation processes were set up with impact onto the war-time industry of that period. Glycerol production for use in the manufacture of explosives, using yeast for conversion from glucose, was established.] 

#done[Another contemporary example is the large-scale production of butanol and acetone by butyric acid bacteria, as developed by ChaimWeizmann, used first for explosives and then for rubber manufacture in the emerging car industry @santangelo_1996.] 
However, these bioprocesses were soon abandoned for petroleum based products that had better process economy.


@mandenius_2016[p. 2]

The original discovery in 1929 by Alexander Fleming of the
antibiotic effect of a Penicillium culture was in a series of steps for amplifying
the yield and activity of cultures transferred into large-scale production @brown_2005.

And other renowned scientists such as Howard Florey, Ernest Chain, Norman Heatley, Marvin Johnson, and others in close collaboration with pharmaceutical companies managed to identify, stabilize, exploit, select strains, exploit genetics, mutational methods and, finally, establish large-scale bioproduction in bioreactors for meeting global medical needs for curing infections @aminov_2010.


It also gave ample examples of how knowledge and skills from one group of products could be transferred into others and, by that, pave way for other antibiotics such as cephalosporins, streptomycins, and aminoglycosides.



In parallel with the progress of developing antibiotics, other microbial primary and secondary products were realized. 
These included amino acids (e.g., glutamate and lysine) and organic acids (e.g., vitamins) used as food ingredients and commodity chemicals and reached considerable production volumes. 
Microbial polymers such as xanthan and polyhydroxyalkanoates are other examples of bio process unfolding during the mid-1950s @ratledge_2006.


Protein manufacture, especially industrial enzymes, became comparatively soon a part of the industrial biotechnology with large-scale production sites at a few specialized companies (e.g., Novo, Genencor, Tanabe). At these upscaled processes, very important findings and experiences were reached concerning bioreactor design and operation. Although not yet exploiting gene transfer between species for these proteins, significant technology development for later use was accomplished @soetaert_2010.


Subsequently, the emerging industrial use of animal cells came about.
Culturing at large scale, at lower cell densities than fungi and yeasts, and with much lower product titers posed a next challenge to bioreactor engineering @freshney_2015.

@mandenius_2016[p. 4]



#done[However, it was the genetic engineering and recombinant DNA technology that created a revolution in the field of industrial biotechnology with macromolecular products from cells, first in bacteria and yeast and subsequently in animal and human cells @butler_2012.]

In California, Cetus and Genentech were established in the early 1970s. 
In the years thereafter, Biogen, Amgen, Chiron, and Genzyme followed, all with successful biotherapeutic products in their pipelines – insulin, erythropoietin, interferons, growth hormones, blood coagulation factors, interleukins, and others reached the therapeutic market with relatively short development times, in spite of regulatory requirements and the multitude of novel production conditions spanning from clinical considerations to new manufacturing methodology.
Especially, the later embodied numerous challenges for bioprocess and bioreactor engineering to disentangle.

The controllability demands of bioreactors for these purposes are higher due to more vulnerable cell types, more complicated growth behavior, and substantially different operations. 
This addresses again the critical issues of mass transfer and barriers of oxygen, nutrients, and sterility of the cultures.

@mandenius_2016[p. 5]



#done[In textbooks, a bioreactor is typically described as an apparatus shaped like a chamber for growing organisms such as bacteria or yeasts that can be used for the production of biomolecular metabolites or biopolymers or for the conversion of organic wastes.]

This very general bioreactor description clearly highlights the main purpose of the design efforts: to accomplish conditions where diverse cell types are able to grow efficiently and produce a variety of biological products with a wide range of molecular sizes in a single unit.

The diversity of the design mainly caused by the time factor; due to the fact that rates differ largely from one organism to another, in reproduction rates, in rates of molecular processing in the individual organisms, and transfer across biological barriers of the cellular systems.

The time factor also applies to the operational procedures. When cells grow, the design must adapt to compensate for the magnification of the dynamics due to higher cell numbers. This mostly concerns supply of nutrients and growth factors.
However, it may also be about removal of mass and energy to avoid overloading the system with any of these.

Sterilization is an operational procedure that differs only slightly depending on the organism but must be carefully adapted to the bioreactors’ geometrical shape and construction materials. 
The prevalence of single-use units made in plastic materials highlights the actuality of this issue.


@mandenius_2016[p. 8]


== Maria 2020







#bibliography("references.bib", style: "ieee")