#import "@preview/typslides:1.3.0": *

// Project configuration
#show: typslides.with(
  ratio: "16-9",
  theme: "bluey",
  font: "Fira Sans",
  font-size: 20pt,
  link-style: "color",
  show-progress: true,
)

// The front slide is the first slide of your presentation
#front-slide(
  title: "Bakage, a package manager for Prolog systems",
  authors: "Kauê Hunnicutt Bazilli and Bryan-Elliott Tam",
  info: [#link("https://github.com/bakaq/bakage")],
)

// Custom outline
#table-of-contents()

#include("sections/introduction.typ")
#include("sections/state_of_the_art.typ")
#include("sections/objective.typ")

// Bibliography
#let bib = bibliography("bibliography.bib")
#bibliography-slide(bib)
