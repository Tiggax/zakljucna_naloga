#let zahvala = [
  #text(fill: red, [TODO])
]

#let izvleček = [
  #text(fill: red, [TODO])
]

#let abstract = [
  #text(fill: red, [TODO])
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