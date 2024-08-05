#set heading(offset: 1)

#import "../../additional.typ": todo

#import "/src/figures/mod.typ": reactor, batch_reactor


A bioreactor is typically described as an apparatus containing a chamber in which organisms such as bacteria or yeast are grown.
The purpose of it is the production of biomolecular metabolites or biopolymers or conversion of organic wastes @mandenius_2016[p. 8].
Even if the first impression the bioreactor gives is something mundane, they represent vital components in biotechnological processes, particularly in modern pharmaceutical production. 

They are instruments or systems engineered to provide an optimal environment wherein biological reactions can catalyze, facilitating the growth of cells, tissues, or microbial cultures. 
They are used in production of food, chemicals and drugs.


Bioreactor have been in use since ancient times.
Old antique cultures solved bioengineering design challenges for practical purposes such as wine and beer making from mere experience and observations. 
This paved the way for the advancements of biotechnological processes, mainly for preparation, production and preservation of food products @soetaert_2010.


By the early twentieth century, large-scale fermentation processes were being utilized, with impact onto the war-time industry of that period.
Glycerol was being produced for its use in manufacture of explosives,
achieved by using yeast for conversion from glucose @mandenius_2016[p. 2].

Butanol and acetone experienced large-scale production utilizing the butyric acid bacteria developed by biochemist Chaim Weizmann.
These were first used for production of explosives, and later rubber manufacture needs of the emerging car industry @santangelo_1996.



The basic parameters for biotechnological processes, like temperature, pH value, dissolved oxygen, etc., are measured and controlled by standard devices implemented in every commercial stirred tank @Kretzmer_2002[p. 138]. These provide information about the values in the bioreactor at each taken measurement.
In a bioreactor these measurements are divided into three groups:
- _physical_ such as temperature, pressure, flow, etc.
- _chemical_ such as pH or concentrations of $O_2$ or $C O_2$
- _biological_ such as biomass, enzyme activity, consumption of substrate and so on.
All of these measurements can be divided into one of two groups based on how the measurement is taken.
_Online_ measurements are measured on the bioreactor, and can be monitored in real time, while _offline_ measurements need to be measured by taking a sample of a bioreactor process.

== Types


Bioreactors can be classified into many different types.
They differ in their operation, process time, use and functionality.
Among them suspension bioreactors are the most used by far.
They are easier to operate and can scale much larger.
Their importance can be demonstrated by the annual sales volume of over 250 billion dollars @Meyer_Schmidhalter_2014.

Bioreactors are grouped into three groups by their scale.
The smallest among the three are the _laboratory_ bioreactors.
These range up to 5 L, and are mainly used for revitalization an cell growth.
_Pilot_ bioreactors range up to 200 L in size, and can be meant either for  inoculum growth or as semi-industrial meant for process optimization or reactor testing.
Lastly the largest bioreactors are _industrial_, with their size ranging up to 100 000 L.
As the name suggests, they are meant for industrial production.

During the biotechnological process, stirring of the bioreactor is of vital importance.
Stirring ensures that nutrients, cells, substrate and other substances are uniformly distributed throughout the bioreactor.
This can be achieved by using a mechanical mixer, aeration of the bioreactor, using a circulation pump or a combination of these.
For mechanical stirring various types of impellers are available @Kretzmer_2002[p. 138].

Aeration of the bioreactor is also important for maintaining the oxygen level needed for many aerobic organisms to survive, eucaryotic cells being one of them.
This process also helps with stripping of waste gasses such as $C O_2$ that can saturate in the medium, and potentially kill the organisms.

On the basis of mode of operation, a bioreactor may be classified as batch, fed batch or continuous (e.g. a continuous stirred-tank reactor). 

=== Batch

The most basic  and oldest of the bioreactor types is the batch bioreactor.
Batch bioreactors derive their name from the way the product is made in batches.
Bioreactor is prepared with a substrate, and then the process starts with inoculation of the organism.
The process is then monitored until the desired product concentration is achieved.
It is then harvested and process can be restarted with a new batch.
A simple sketch of a batch bioreactor can be seen in @batch.

#figure(
  caption: [A simple model of a batch bioreactor],
  reactor
)<batch>

The most typical example of batch bioreactor process is beer brewing, one of the oldest biotechnological processes.
In biopharmaceuticals these bioreactors can be used for the production of small scale antibodies for research and diagnostic application @Kretzmer_2002[p. 138].

The problem with batch bioreactors is their nutrients deplete during the run, which not only results in a drop of viability and death of cells, but also contributes to a steady increase of toxic metabolites.
Ultimately batch reactors result in toxication of the process, since toxic metabolites are not removed @Kretzmer_2002[p. 139].

=== Fed-batch

Fed-batch bioreactors differ in that they are "fed" during the process.
The reactor receives a steady supply of substrate during the duration of the process as can be seen in @fed-batch.
This can prevent the culture from crashing from the lack of nutrients, and helps to encourage the production of primary metabolites.
This can be seen in a extension of the stationary faze of cell growth and helps delay the dying phase of cells.

By maintaining low concentration set points of major carbon substrates, a more efficient primary metabolism production can be achieved, with lower rates of metabolic by-products. This results in the cells remaining in a productive state over an extended time, which has enabled considerable enhancement of yields from these processes @Butler_2005[p. 285].


#figure(
  caption: [A simple model of a fed-batch bioreactor],
  batch_reactor
)<fed-batch>

== Bioreactors using CHO Cells

The first recorded growth of eucaryotic cells happened in 1907.
This was achieved by Ross Harrison by managing to grow nerve cells utilizing the hanging drop method.
The cells were grown over a period of 30 days which showed the possibility of growing cells in vitro.
This is why many regard year 1907 as the beginning of cell cultivation
@Kretzmer_2002[p. 135].


The biggest leap forward towards large-scale cultivation of  animal cells was achieved by Earle and Eagle. 
They made extensive analysis of the requirements of cells grown in vitro.
By 1955, chemically defined medium known as @EMEM; short for Eagle's minimum essential medium, was reported by Eagle.
This medium could replace the biological fluids such as bovine serum that were used till then. 
The only necessity that remained was the needed addition of undefined blood serum @Kretzmer_2002[p. 135].

Bovine serum was used as a supplement of cell culture media for several decades.
It contains many substances needed for cell growth, such as hormones, growth factors and trace elements.
It also contains high amounts of albumin, that ensures cell protection from changes like pH fluctuations of shear forces.
Variable and undefined composition of the bovine serum made it hard to keep stable and consistent growth and productivity of cells.
This combined with the mad cow crisis in the beef industry, created a strong demand for cell culture mediums free of all animal components
@Butler_2005[p. 286].




Revolution started by recombinant @DNA technology and genetic engineering stirred the field of industrial biotechnology with macromolecular products acquired from cells.
At first bacteria and yeast were being used as producers, but soon animal and human cells followed @butler_2012.
By the early 1980s, recombinant proteins started to be introduced to the pharmaceutical industry@Kretzmer_2002[p. 136].


@CHO cell lines are among the most extensively utilized hosts for the production of therapeutic proteins in the bio-pharmaceutic industry @Wurm_2004.
Nearly 80% of the approved human therapeutic antibodies are produced by @CHO cells @Xu_Lin_Mi_Pang_Wang_2023.
They provide an advantage over other non-eucaryotic cell lines, since they are able to achieve correct glycosylation patterns of mammalian-cells, needed for protein therapeutics such as therapeutic antibodies @Cui_2023[p. 1].
Their use in stirred tank bioreactors are preferred because of their scalability with these cells @Kretzmer_2002[p. 138].
Currently, stirred tank bioreactors over 10,000 L scale are readily used for SF suspension cultures of recombinant CHO (@rCHO) cells producing therapeutic antibody @Kim_2012[p. 917-918].

=== Chinese hamster (_Cricetulus griseus_)

Chinese hamster or Chinese striped hamsters are rodents of the _Cricetidae_ family.
They are native to deserts of China and Mongolia.
Typically they are brown with a black stripe running down their back.
Their belly is of lighter color.
The tail is longer than the typical hamster species.
Coloration in combination with their physique makes them look more mouse-like. 
Genus _Cricetulus_ contains species that tend to be more ratlike in appearance than the typical hamster.
They reach maturity at two months, and their gestation period is only three weeks @lsf_2015[p. 39].
Their lifespan is two to three years.
The size ranges from 76 mm to 127 mm, with the tail being 20 mm to 33 mm long.
They weigh between 30 and 45 grams.

They are closely related with the Chinese striped hamster (_Cricetulus barabensis_) and are taxonomically unsettled. Some authorities consider them as a separate species, while some classify them as subspecies.
In that case the Latin name of the Chinese hamster becomes _Cricetulus barabensis griseus_, and the Chinese striped hamster becomes _Cricetulus barabensis barabensis_.

=== History of the Chinese hamster in research

Chinese hamsters were first successfully used as laboratory specimens in the early 20th century in place of mice. 
First such report was posted by Hsieh in 1919 report: "A new laboratory animal (Cricetulus griseus)". 
He encountered them in the streets of Peking, where the captured hamsters were being sold as pets. 
As mice were scarce at the time he opted to  use them in his study for identification of pneumococcal types by Avery's method @Yerganian_1972[p. 8].
Their fast maturity and low gestation period made them a promising animal model to study several generations over a single year @lsf_2015[p. 39].

By the mid 20th century, the captured Chinese hamsters were used routinely, both locally and in other countries. 
Peking Union Medical College maintained an inexhaustible amount of captured animals.
The figures of annually employed hamsters were in the thousands.
Chinese hamsters were being used in variety of studies pertaining to Leishmaniasis, tuberculosis, diphtheria, rabies, equine encephalitis, influenza, pneumonia, Monilia, relapsing fever and other drug evaluations.
Strong consideration as a possible reservoir host for _Leishmania donovani_ garnered world-wide attention of the Chinese hamster.
This parasite is the etiological agent for kala-azar a disease also know as black fever, and is prevalent in tropical and temperate regions like China, Middle East, South America and the Mediterranean basin @van_2012[p.310].

The rising popularity of the Chinese hamster led to attempts to breed them in captivity, but they all failed due to their pugnacious habits exhibited whenever adult animals were paired.
Since the Chinese hamster proved to be a most sensitive host for the various forms of _Leishmaniae_, researchers in other countries, notably India and the Near East, were encouraged to import them from China for their own needs @Yerganian_1972[p. 9].

In China researchers Chang and Wu also noted irregularities in the estrous cycle of captured females, and were able to obtain 5 small litters from laboratory-born females over a 2-year period of trials @Chang1938.
After a report describing the karyotype as consisting of 7 pairs of chromosomes in hamsters was posted, the interest in the Chinese hamster was renewed @Pontecorvo_1944.
Low chromosome count in comparison to other animals (mice have 2n = 40 and rats have 2n = 42) made them promising animals for cytogenetic research @Jayapal_2007[p. 41]. 

In 1948 20 subjects; ten female and ten male were smuggled out of China into the U.S. by Dr. Robert Watson. 
The hamsters were supplied by Dr. H. C. Hu, a pathologist at Peking Union Medical College for Dr. Schwentker to try to start a colony @Yerganian_1972[p. 12-13].
The hamsters left China on one of the last Pan-Am flights out of Shanghai before the Chinese civil war ended with the Maoists victory and an establishment of the new Peoples Republic.
Dr. Hu and Dr. Watson were both charged by the Chinese Germ Warfare Commission.
Dr. Watson was accused of "war crimes" and tried in absentia while Dr. Hu was 
found guilty of supplying scientific material to the enemy.
He was convicted and sent to a detention camp for six months
@Yerganian_1972[p. 15].


Upon successful landing of the hamsters in San Francisco, they were shipped to Schwentker's farm.
Schwentker managed to domesticate and breed them in captivity. The process required a great amount of labor intensive taming, but within two years he had managed to create a thriving colony.
By 1954 Schwentker discontinued sales of Chinese hamsters.
They were popular with researchers, but the natural solidarity combined with female aggression in captivity made raising and breeding them a difficult and laborious job.
Schwentker never published or shared his breeding techniques, but by 1954, George Yerganian; a graduate student at Harvard had devised his own hamster-taming methods.
With funds from the National Cancer Institute, he established a breeding center and began distributing hamsters to scientific colleagues.
He became the sole supplier of  Chinese hamsters to biomedical research institutions for the next decade in the United States @lsf_2015. 

=== CHO cell lines

The developments of the 1970s – fusion of cells to form hybridomas, and genetic engineering – triggered a second wave of products. Monoclonal antibodies and recombinant proteins for diagnosis and therapy set new challenges for the inventors @Kretzmer_2002[p. 135].
Looking at today, there has been a rapid increase in the number and demand for approved bio-pharmaceuticals produced from animal cell culture processes.
Some part of it has been due to the efficiency of several humanized monoclonal antibodies that are required at large dose for therapeutic use @Butler_2005[p. 283].

Popularity of @CHO cells can be attributed to these reasons.
Firstly, as @CHO cells have been demonstrated as safe hosts, it is easier to obtain approval to market the therapeutic proteins from regulatory agencies like the @FDA. 
Secondly, low specific productivity, normally the disadvantage of using mammalian cells for protein production, can be overcome by @CHO cells gene amplification. 
Powerful gene amplifications systems, like  dihydrofolate reductase (DHFR)-mediated or glutamine synthase (GS) - mediated gene amplification are available for @CHO cells. 
Thirdly, @CHO cells have the capacity for efficient post-translational modification, and also produce recombinant proteins with glyco forms that are both compatible with and fully functional within humans.
Finally, @CHO cells can adapt easily to growth in the regulatory-friendly serum-free suspension conditions.
This characteristic is preferred for large-scale culture in bioreactors @Kim_2012[p. 917-918].

Recent advances in cell culture technology for @rCHO cells have achieved significant improvements in protein production leading to titer of more than 10 g/L to meet the huge demand from market needs @Kim_2012[p. 917].
As such @CHO cells have become the standard mammalian host cells used in the production of recombinant proteins, although there are other options such as the mouse myeloma (NS0), baby hamster kidney (@BHK), human embryonic kidney (@HEK[293]) or human-retina-derived (PER C6) cells. 
All these cell lines have been adapted to grow in suspension culture and are well suited for scale-up in stirred tank bioreactors @Butler_2005[p. 284].
