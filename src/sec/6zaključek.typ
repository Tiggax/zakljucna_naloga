#set heading(offset: 1)
#import "/src/additional.typ": todo

#set text(lang: "sl")


Bioreaktorji so ključni za industrijsko proizvodnjo različnih biofarmacevtskih produktov. 
Uporaba celic kitajskega hrčka je postala standard v industriji zaradi njihove visoke produktivnosti in zmožnosti post-translacijske modifikacije proteinov. 
V nalogi so podrobno obravnavane različne vrste bioreaktorjev, kot so serijski in bioreaktorji z dohranjevanjem. 
Poseben poudarek je na bioreaktorjih z dohranjevanjem, kjer se hranila dodajajo med procesom, kar omogoča boljše pogoje za rast celic in proizvodnjo produktov​.

Zaključna naloga predstavlja podroben matematični model bioreaktorja z dohranjevanjem in uporabo celic ovarijev kitajskega hrčka (CHO), ki so ključne za proizvodnjo biofarmacevtskih izdelkov zaradi njihove učinkovitosti in stabilnosti pri proizvodnji terapevtskih proteinov.
Delo se osredotoča na optimizacijo parametrov sistema, ki zagotavlja zanesljivost modela s prilagajanjem modela na eksperimentalnim podatke. 
Optimizacija je ključnega pomena za doseganje maksimalne učinkovitosti in zanesljivosti bioreaktorjev, ki se uporabljajo v industrijski proizvodnji biofarmacevtskih izdelkov.

Namen zaključne naloge je bil optimizirati delovanje bioreaktorja z uporabo simulacij, ki analizirajo vpliv različnih pogojev na rast celic in tvorbo produktov. 
To je bilo doseženo z modelom zasnovanim na diferencialnih enačbah, ki omogoča simulacijo dinamike celične rasti, porabe hranil in proizvodnje produktov. 
Enačbe so bile rešene z metodo Runge-Kutta, kar je omogočilo natančno napovedovanje gostote celic, koncentracije hranil in tvorbe produktov skozi čas. 
Za optimizacijo modelnih parametrov je bil uporabljen algoritem Nelder-Mead, ki je zagotovil dobro ujemanje modela z eksperimentalnimi podatki in s tem visoko zanesljivost simulacij.

Matematični model vključuje masne bilance, kinetiko celične rasti po Monodu in procesno kontrolo z uporabo PID regulatorjev. 
Ta celovit pristop je omogočil simulacijo in napovedovanje obnašanja bioreaktorja pod različnimi pogoji.
Matematično modeliranje bioreaktorjev je pomembno za razumevanje in optimizacijo procesov v biotehnologiji. 
Modeliranje temelji na sistemu navadnih diferencialnih enačb, ki opisujejo dinamiko gostote celic, koncentracije hranil in produktov skozi čas. 
V nalogi so uporabljene metode za reševanje teh enačb, kot so metoda Runge-Kutta in Nelder-Mead algoritmi za optimizacijo parametrov. 
Te metode omogočajo natančne napovedi in prilagoditev modela eksperimentalnim podatkom, kar je ključno za validacijo modela​.

Optimizacija delovanja bioreaktorja vključuje prilagajanje različnih parametrov, kot so hitrost dovajanja hranil, začetne koncentracije celic in hranil ter maksimalna specifična hitrost rasti celic. 
V nalogi so predstavljene različne simulacije, ki prikazujejo vpliv teh parametrov na končne rezultate, kot so gostota celic, poraba glukoze in glutamina ter koncentracija končnih produktov. 
Rezultati simulacij kažejo, da je natančno uravnavanje teh parametrov ključno za optimalno delovanje bioreaktorja​

Celoten model in simulacije so implementirane v programskem jeziku Rust, kar omogoča učinkovito in hitro izvajanje kompleksnih izračunov. 
Poudarjena je pomembnost uporabe sodobnih programskih orodij in metod za reševanje zahtevnih problemov v biotehnologiji. 
Aplikacija in podatki so dostopni na GitHub repozitoriju, kar omogoča preglednost in nadaljnjo uporabo ter razvoj modela s strani drugih raziskovalcev in strokovnjakov v industriji​.

Zaključna naloga ponuja robusten in prilagodljiv okvir za simulacijo in optimizacijo bioreaktorjev z dovajanjem in uporabo CHO celic. Predlagane prihodnje izboljšave, kot so vključitev bolj realističnih modelov življenjske sposobnosti, izboljšane simulacije produktov in napredne kontrole kisika, obetajo še večjo natančnost in praktično uporabnost modela v dejanskih operacijah bioreaktorjev. 
Te izboljšave obetajo še večjo natančnost modela in njegovo uporabnost v realnih industrijskih pogojih​.


S tem raziskava odpira nove možnosti za optimizacijo bioprocesov, kar lahko vodi do bolj ekonomične in učinkovite proizvodnje pomembnih terapevtskih proteinov in drugih biofarmacevtskih izdelkov, kar je ključno za napredek v medicini in farmaciji.
Z vključitvijo realnih eksperimentalnih podatkov in sodobnih optimizacijskih algoritmov ponuja robusten in prilagodljiv okvir za nadaljnje raziskovalno delo z modeliranjem bioreaktorjev.



