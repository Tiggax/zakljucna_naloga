#import "@preview/sunny-famnit:0.2.0": project
#import "/src/additional.typ" as ab

#let meta = toml("metadata.toml")

#let res = meta.insert("ključne_besede", meta.kljucne_besede)
#let res = meta.remove("kljucne_besede")

// - - - - - Add to template - - - - - 
#set outline(fill: repeat[.#h(8pt)], indent: 2em)

// - - - - - - - - - - - - - - - - - -

#show: project.with(
	date: datetime(day: 1, month: 5, year: 2024),
   ..meta,


	izvleček: ab.izvleček,
	abstract: ab.abstract,


	kratice: meta.kratice,

	priloge: (), // you can add attachments as a dict of a title and content like `"name": [content],`

	zahvala: ab.zahvala,

  bib_file: bibliography(
    "references.bib",
    style: "ieee",
    title: [Bibliography],
  ),
)


#import "@preview/cheq:0.1.0": checklist
#show: checklist.with(fill: luma(95%), stroke: navy)


// - - - - - Add to template - - - - - 
#show heading.where(level: 1):it => {pagebreak(weak: true);it}
#show heading: set block(spacing: 2em)
#show heading.where(level: 3):it => text(weight: "regular", it)

#set text(hyphenate: false)
#set math.equation(numbering: "(1)")
// - - - - - - - - - - - - - - - - - -

#include "/src/sec/1uvod.typ"
= Purpose
#include "/src/sec/2namen.typ"
= Methods
#include "/src/sec/3metode.typ"
= Results
#include "/src/sec/4rezultati.typ"
= Summary
#include "/src/sec/5summary.typ"
= Povzetek
#include "/src/sec/6zaključek.typ"