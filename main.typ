#import "template.typ": project, codefigure, hr, quote, note, weakbreak, caption_with_source
#import "@preview/dashy-todo:0.1.0": todo
#show: project.with(
  // 'de' for german or 'en' for english.
  // Pull Requests for other languages are welcome! :)
  lang: "de",

  // Shows a line for a signature, if set to `false`,
  is_digital: true,

  // Display the confidentiality clause
  confidentiality_clause: true,

  ///
  /// Cover Sheet
  ///
  // Full title of your project
  title_long: "Entwicklung eines Parsers zur Normalisierung und Aufarbeitung heterogener Build-Protokolle",
  // Shortened title, which is displayed in the header on every page
  title_short: "Parser zur Aufarbeitung heterogener Build-Protokolle",
  // The type of your project
  thesis_type: "Projektarbeit IIb (T3_2000)",
  // Other information about you and your project
  firstname: "Lukas",
  lastname: "Bailey",
  signature_place: "Karlsruhe",
  matriculation_number: "8232296",
  course: "TINF23B2",
  submission_date: "15. September 2025",
  processing_period: "30.06.2025 - 15.09.2025",
  supervisor_company: "Philipp Degler",
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
    // ("Appendix Titel 1", include("appendix.typ")), // appendix from file
    (
      "Verwendete Nom-Parserfunktionen",
      [
        #figure(
          table(
  columns: 2,
  [*Name*], [*Beschreibung*],
  [char(a)], [Akzeptiert das Zeichen `a` am Anfang der Kette], 
  [alt((parser1 , parser2, ...))] , [Testet mehrere Parserfunktionen, nur eine muss erfolgreich sein], 
  [many1(parser)] , [Wendet einen Parser so oft an, wie er erfolgreich ist; mindestens 1-mal], 
  [tag(A)],[Akzeptiert die Zeichenkette `A` am Anfang der Kette],
  [delimited(parser1, parser2, parser3)],[Akzeptiert eine von parser2 akzeptierte Zeichenkette, die von zwei anderen akzeptierten Zeichenketten umgeben ist],
  [separated_pair(parser1, trennzeichen, parser1)],[Akzeptiert zwei von einer bestimmten Zeichenkette getrennte Zeichenketten],
  [digit1],[Akzeptiert eine (mindestens ein Zeichen lange) Kette an Ziffern],
  [multispace1],[Ignoriert (mindestens ein) Leerzeichen am Anfang der Kette],
  [is_not(a)],[Akzeptiert ein Zeichen, das nicht `a` ist],
  [take_until(A)],[Falls Nom die Zeichenkette `A` im Text findet, konsumiert es alles bis inklusive `A`],
    ))<tab:nom>
      ],
    ), // appendix inline
    (
      "Testausgabe",
      [
         #codefigure(
  caption: "Ausgabe von log-jitsu nach Testeingabe",
  reference: "log-test-output"
)[```Rust
Diagnostic { 
  message: "'int readdir_r(DIR*, dirent*, dirent**)' is deprecated [-Wdeprecated-declarations]", 
  severity: Warning, 
  location: SourceLocation { 
    path: "/SAPDevelop/I587738/git/sapkernel/flat/nlsui3.c", 
    row: Some(577), 
    column: Some(61) 
  }, 
  code: Some("   rc = readdir_r( dirp, &(c_entryBuffer.c_entry), &c_result );\n                                                             ^\n"), 
  trace: [
    In { 
      context: "function 'int readdir_rU16(DIR*, direntU16*, direntU16**)'", 
      location: SourceLocation { 
        path: "/SAPDevelop/I587738/git/sapkernel/flat/nlsui3.c", 
        row: None, 
        column: None 
      } 
    }
  ], 
  notes: [
    Note { 
      message: "declared here", 
      location: Some(SourceLocation { 
        path: "/sapmnt/appl_sw/sysroot-sles15/usr/include/dirent.h", 
        row: Some(189), 
        column: Some(12) 
      }), 
    code_snippet: Some(" extern int __REDIRECT (readdir_r,\n            ^~~~~~~~~~\"\n"), 
    trace: [] 
    }
  ] 
}
 ```]
      ],
    ),
    (
      "Screenshots der generierten HTML-Datei",
      [#figure(
  image("assets/gnumake-html.png", width: 95%),
  caption: [Vom Build-System generierter Output],
) <fig:gnumake-ss>
      ],
    ), 
  ),

  // Path/s to references - either .yaml or .bib files
  // * for `.yaml` files see: [hayagriva](https://github.com/typst/hayagriva)
  library_paths: "example.yaml",

  // Specify acronyms here.
  // The key is used to reference the acronym.
  // The short form is used every time and the long form is used
  // additionally the first time you reference the acronym.
  acronyms: (
    (key: "ABAP", short: "NN", long: "Neural Network"),
    (key: "GCC", short: "SG", long: "Singular"),
  ),
)

// You can now start writing :)
#include "chapters/1_Einleitung.typ"