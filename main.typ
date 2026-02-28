#import "template.typ": project, codefigure, hr, quote, note, weakbreak, caption_with_source
#import "@preview/dashy-todo:0.1.0": todo
#show: project.with(
  // 'de' for german or 'en' for english.
  // Pull Requests for other languages are welcome! :)
  lang: "de",

  // Shows a line for a signature, if set to `false`,
  is_digital: true,

  // Display the confidentiality clause
  confidentiality_clause: false,

  ///
  /// Cover Sheet
  ///
  // Full title of your project
  title_long: "Erstellung von Pop-Video Remixen unter einsatz von Typ-3 Grammatiken",
  // Shortened title, which is displayed in the header on every page
  title_short: "Pop-Video Remixe mit Typ-3 Grammatiken",
  // The type of your project
  thesis_type: "Studienarbeit",
  // Other information about you and your project
  firstfullname: "Leonhard Zeller,",
  secondfullname: " Lukas Bailey",
  signature_place: "Karlsruhe",
  matriculation_number: "2833211, 8232296",
  course: "TINF23B2",
  submission_date: "15. September 2025",
  processing_period: "30.06.2025 - 15.09.2025",
  supervisor_university: "Prof. Dr. Sebastian Ritterbusch",

  // Disable the abstract by changing to `abstract: ()`
  // To load the abstract from a file use include("abstract.typ") instead of [...]`
  // If you only want one language, leave the comma at the end -> `("de", "Deutsch", []),` its necessary for syntax of the template
  abstract: (
    ("de", "Deutsch", include "abstracts/abstract_german.typ"),
  ),

  // appendices: usage: ("Title", [content] || include("appendix.typ"))
  // change to `appendices: none` to remove appendix
  appendices: (
   
  ),

  // Path/s to references - either .yaml or .bib files
  // * for `.yaml` files see: [hayagriva](https://github.com/typst/hayagriva)
  library_paths: "example.yaml",

  // Specify acronyms here.
  // The key is used to reference the acronym.
  // The short form is used every time and the long form is used
  // additionally the first time you reference the acronym.
  acronyms: (
    (key: "DAW", short: "DAW", long: "Digital Audio Workstation"),
    (key: "DL", short: "DL", long: "Deep Learning"),
    (key: "HPSS", short: "HPSS", long: "Harmonic-Percussive Source Separation"),
    (key: "INST", short: "INST", long: "Instrumental"),
    (key: "MFC", short: "MFC", long: "Mel-Frequency-Cepstrum"),
    (key: "MFCC", short: "MFCC", long: "Mel-Frequency Cepstral Coefficients"),
    (key: "REPET", short: "REPET", long: "REpeating Pattern Extraction Technique"),
    (key: "RMS", short: "RMS", long: "Root Mean Square"),
    (key: "STFT", short: "STFT", long: "Short-Time Fourier Transform"),
    (key: "VOC", short: "VOC", long: "Vocal")
  ),
)

// You can now start writing :)
#include "chapters/1_Einleitung.typ"
#include "chapters/2_Theoretische_Grundlagen.typ"
#include "chapters/3_Praktische_Umsetzungsversuche.typ"
#include "chapters/4_Auswertungsstrategie.typ"
#include "chapters/5_Betrachtung_der_Ergebnisse.typ"
#include "chapters/6_Fazit_und_Ausblick.typ"


