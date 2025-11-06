#import "@preview/glossarium:0.5.6": make-glossary, register-glossary, print-glossary, gls, glspl

#let page_numbering = "1 / 1"
#let heading_numbering = "1.1.1"

#let __tpl_messages_array = (
  "submission_date": (
    "de": "Abgabedatum",
    "en": "Submission Date",
  ),
  "processing_period": (
    "de": "Bearbeitungszeitraum",
    "en": "Processing Period",
  ),
  "matriculation_number": (
    "de": "Matrikelnummer",
    "en": "Matriculation Number",
  ),
  "course": (
    "de": "Kurs",
    "en": "Course",
  ),
  "company": (
    "de": "Ausbildungsfirma",
    "en": "Training Company",
  ),
  "supervisor_company": (
    "de": "Betreuer der Ausbildungsfirma",
    "en": "Supervisor of the Training Company",
  ),
  "supervisor_university": (
    "de": "Gutachter der Dualen Hochschule",
    "en": "Reviewer of the Duale Hochschule",
  ),
  "part_of": (
    "de": "Im Rahmen der Prüfung:",
    "en": "As part of the examination:",
  ),
  "examination": (
    "de": "Bachelor of Science (B. Sc.)",
    "en": "Bachelor of Science (B. Sc.)",
  ),
  "course_of_study": (
    "de": "des Studienganges Informatik",
    "en": "in Computer Science",
  ),
  "university_pos": (
    "de": "an der Dualen Hochschule Baden-Württemberg Karlsruhe",
    "en": "at the Baden-Wuerttemberg Cooperative State University Karlsruhe",
  ),
  "by": (
    "de": "von",
    "en": "by",
  ),
  "list_contents": (
    "de": "Inhaltsverzeichnis",
    "en": "Table of Contents",
  ),
  "list_abbreviations": (
    "de": "Abkürzungsverzeichnis",
    "en": "List of Abbreviations",
  ),
  "list_figures": (
    "de": "Abbildungsverzeichnis",
    "en": "Table of Figures",
  ),
  "list_tables": (
    "de": "Tabellenverzeichnis",
    "en": "Table Directory",
  ),
  "list_code": (
    "de": "Quellcodeverzeichnis",
    "en": "Source Code Directory",
  ),
  "list_bibliography": (
    "de": "Literaturverzeichnis",
    "en": "Bibliography",
  ),
  "appendix": (
    "de": "Anhang",
    "en": "Appendix",
  ),
  "list_appendix": (
    "de": "Anhangsverzeichnis",
    "en": "Index of Appendices",
  ),
)

#let __tpl_message(idx, lang) = __tpl_messages_array.at(idx).at(lang)


// usage: caption_with_source("text", [@source])
// Prevents the using of the source in the outlines, to enable right sorting when using ieee for bibliography
#let in-outline = state("in-outline", false)
#let caption_with_source(caption_text, source) = context {
  if in-outline.at(here()) {
    caption_text
  } else {
    caption_text + source
  }
}



#let project(
  lang: "en",
  is_digital: true,
  confidentiality_clause: true,
  title_long: none,
  title_short: none,
  thesis_type: none,
  firstname: none,
  lastname: none,
  signature_place: none,
  matriculation_number: none,
  course: none,
  submission_date: none,
  processing_period: none,
  supervisor_company: none,
  supervisor_university: none,
  abstract: [],
  appendices: none,
  library_paths: (),
  acronyms: (),
  body,
) = {
  // page setup
  set document(title: title_long)
  set page(paper: "a4")

  // set text language (e. g. for smart quotes)
  set text(lang: lang)

  // justify content
  set par(justify: true)

  // font setup (LaTeX Look: 'New Computer Modern')
  set text(
    font: "New Computer Modern",
    size: 12pt,
  )

  // header setup
  set heading(numbering: heading_numbering)
  show heading: it => {
    text(font: "Libertinus Serif", it)
    v(0.5cm)
  }

  show heading.where(level: 1): it => {
    colbreak(weak: true)
    it
  }

  show heading.where(level: 2): it => {
    v(weak: true, 1.2cm)
    it
  }

  // load additional syntaxes for code
  set raw(syntaxes: "syntax/cds.sublime-syntax")

  // fancy inline code
  // if you don't like them, just remove this section.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 2pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // fancy code blocks
  // if you don't like them, just remove this section.
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 2pt,
    width: 100%,
  )

  // turn off justify within code blocks
  show raw.where(block: true): set par(justify: false)

  show: make-glossary

  // Styled glossary references
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.kind == "glossarium_entry" {
      // Make the glossarium entry references dark blue
      emph(it)
    } else if (el != none and el.func() == figure and el.kind == raw) {
      // Add styling for raw references (like references to headings)
      it
    } else if (el != none and el.func() == figure) {
      it
    } else {
      // Add styling for references to sources
      it
    }
  }

  // fancy inline links
  // if you don't like them, just remove this section.
  show link: it => {
    if type(it.dest) == str {
      set text(fill: gray.darken(80%))
      underline(
        stroke: (paint: gray, thickness: 0.5pt, dash: "densely-dashed"),
        offset: 4pt,
        it,
      )
    } else {
      it
    }
  }

  // Coversheet
  // SAP and DHBW Logo
  grid(
    columns: (1fr, 1fr),
    align(left)[
      #image("assets/SAP-Logo.svg", height: 2.5cm)
    ],
    align(right)[
      #image("assets/DHBW-Logo.svg", height: 2.5cm)
    ],
  )

  v(1.5cm)

  // Meta
  align(center)[
    #set par(justify: false)
    #text(size: 28pt)[*#title_long*]
    #v(0.1cm)

    #text(16pt)[*#thesis_type*]
    #v(0.1cm)

    #__tpl_message("part_of", lang) \
    *#__tpl_message("examination", lang)*
    #v(0.1cm)

    #text(20pt)[#__tpl_message("course_of_study", lang)] \
    #__tpl_message("university_pos", lang)
    #v(0.5cm)

    #__tpl_message("by", lang) \
    #text(16pt)[*#firstname #lastname*]
  ]

  v(1.5cm)

  // Advanced Meta
  align(center)[
    #table(
      columns: (1fr, 1fr),
      align: (right, left),
      stroke: none,
      [*#__tpl_message("submission_date", lang)*], [#submission_date],
      [*#__tpl_message("processing_period", lang)*], [#processing_period],
      [*#__tpl_message("matriculation_number", lang), #__tpl_message("course", lang)*],
      [#matriculation_number, #course],

      [*#__tpl_message("company", lang)*],
      [
        SAP SE \
        Dietmar-Hopp-Allee 16 \
        69190 Walldorf, Deutschland
      ],

      [*#__tpl_message("supervisor_company", lang)*], [#supervisor_company],
      [*#__tpl_message("supervisor_university", lang)*], [#supervisor_university],
    )
  ]
  pagebreak()

  //Start page count on second page
  counter(page).update(1)
  set page(numbering: "I")

  // Eidesstattliche Erklaerung
  import "assets/declaration_of_originality.typ": declarationOfOriginalityWith
  declarationOfOriginalityWith(
    title_long: title_long,
    is_digital: is_digital,
    author_reversed: [#lastname, #firstname],
    signature_place: signature_place,
    lang: lang,
    type: thesis_type,
  )
  pagebreak()

  // Sperrvermerk
  if confidentiality_clause {
    import "assets/confidentiality_clause.typ": confidentialityClauseWith
    confidentialityClauseWith(lang: lang)
  }

  // Abstracts
  for a in abstract {
    let (abstract_lang, abstract_lang_long, abstract_body) = a
    align(center + horizon)[
      #heading(
        outlined: false,
        numbering: none,
        [#text(0.85em, smallcaps[Abstract])\ #text(
            0.75em,
            weight: "light",
            style: "italic",
            [\- #abstract_lang_long -],
          )],
      )
      #text(lang: abstract_lang, abstract_body)
      #v(20%)
    ]
  }

  // Inhaltsverzeichnis
  // Show level 1 headings in outline in a fancier way, if not desired feel free to remove it
  [#show outline.entry.where(level: 1): it => {
      v(12pt, weak: true)
      strong(it)
    }
    #outline(
      title: [#__tpl_message("list_contents", lang)],
      depth: 3,
      indent: auto,
      target: selector(heading).before(<appendix-start>),
    )
  ]

  // captions with caption_with_source shouldn't show source in outline
  show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }

  // Only display certain outlines if elements for it exist
  context {
    // source-code verzeichnis
    if query(figure.where(kind: raw)).len() > 0 {
      pagebreak()
      heading(__tpl_message("list_code", lang), numbering: none)
      outline(target: figure.where(kind: raw).before(<appendix-start>), title: none)
    }
  }

  // display header
  set page(
    header: {
      context {
        if here().page-numbering() == page_numbering {
          let headingsBefore = query(selector(heading).before(here())).filter(h => h.level == 1)
          let headingsAfter = query(selector(heading).after(here())).filter(h => h.level == 1)

          // if level 1 heading is on current page, use it as header
          let currentHeading = if headingsAfter != () and headingsAfter.first().location().page() == here().page() {
            headingsAfter.first().body
          } else if headingsBefore != () {
            headingsBefore.last().body
          } else {
            // display a minus if no level 1 headings exist
            [---]
          }

          grid(
            columns: (auto, 1fr),
            align(left, text(title_short)), align(right, text(style: "italic", currentHeading)),
          )
          line(length: 100%, stroke: (paint: gray))
        }
      }
    },
  )

  // display main document and reset page counter
  set page(
    numbering: page_numbering,
    footer: align(center)[
      #context counter(page).display() / #context {
        let end = query(<end>).first()
        counter(page).at(end.location()).first()
      }
    ],
    margin: (top: 4cm, x: 2.5cm, bottom: 2.5cm),
  )
  counter(page).update(1)

  set par(leading: 0.9em)

  body
  [#[] <end>]

  // display bibliography
  set page(numbering: "a", footer: auto)
  counter(page).update(1)

  bibliography(
    library_paths,
    title: [#__tpl_message("list_bibliography", lang)],
  )

  // display appendix
  if appendices != none {
    set heading(level: 1, outlined: false)
    set page(numbering: "A", footer: auto)
    counter(page).update(1)
    counter(heading).update(0)

    heading(__tpl_message("list_appendix", lang), numbering: none, outlined: true)

    outline(
      depth: 3,
      indent: auto,
      title: none,
      target: selector(heading).after(<appendix-start>),
    )

    pagebreak(weak: true)
    [#[] <appendix-start>]

    for appendix in appendices {
      let (appendix_heading, appendix_content1) = appendix

      pagebreak()
      set heading(supplement: __tpl_message("appendix", lang), outlined: true)
      heading([#__tpl_message("appendix", lang): #appendix_heading], outlined: true)
      appendix_content1
    }
  }
}

/// codefigure creates a figure with a caption.
/// figures created using this function will also appear in the
/// source-code table of contents.]
///
/// * The `caption` parameter is optional and can be used to add a caption to the figure.
///
/// * The `reference` parameter is optional and can be used to reference the figure:
/// ```typ
/// codefigure(
///   caption: "A simple C++ program",
///   reference: "simple-cpp-program"
/// )[```c
/// int main() { return 0; }
/// ```]
/// See @simple-cpp-program for a simple C++ program.
/// ```
///
/// * The `v-space` parameter is optional and can be used to add vertical space after the figure.
#let codefigure(body, caption: none, reference: none, v-space: 0.2cm) = {
  [
    // this is a workaround to allow for optional reference
    #figure(
      align(left, box(width: 100%, body)),
      caption: caption,
      outlined: true,
      supplement: [Code],
    )
    #if reference != none {
      label(reference)
    }
  ]
  // add some vertical space by default
  if v-space != none {
    v(0.2cm)
  }
}

/// codefigurefile is an alias to `codefigure` that reads the content of a file and uses it as the body.
/// The `file` parameter is required and should be the path to the file.
/// If you don't specify the `lang` parameter, the language will be extracted from the file extension.
///
/// * The `caption` parameter is optional and can be used to add a caption to the figure.
///
/// * The `reference` parameter is optional and can be used to reference the figure:
/// ```typ
/// codefigure(
///   caption: "A simple C++ program",
///   reference: "simple-cpp-program"
/// )[```c
/// int main() { return 0; }
/// ```]
/// See @simple-cpp-program for a simple C++ program.
/// ```
///
/// * The `v-space` parameter is optional and can be used to add vertical space after the figure.
#let codefigurefile(file, caption: none, reference: none, v-space: 0.2cm, lang: none) = {
  // extract language from file name if no lang was specified
  if lang == none {
    if file.contains(".") {
      lang = file.split(".").last()
    }
  }
  codefigure(
    raw(
      read(file),
      lang: lang,
      block: true,
    ),
    caption: caption,
    reference: reference,
    v-space: v-space,
  )
}

/// note creates a colored note box.
/// The `title` parameter is optional and can be used to add a title to the note.
/// The `color` parameter is optional and should be a color.
/// The `body` parameter is required and should contain the content of the note.
///
/// Example:
/// ```typ
/// #note(title: "Note", color: green)[
///   *Hello World!* This is a note.
/// ]
///
/// #note[This is a green note without a title.]
/// ```
#let note(title: "", color: green, body) = {
  block(
    fill: color.lighten(80%),
    stroke: (paint: color),
    inset: 10pt,
    width: 100%,
  )[
    #if title != "" {
      text(weight: "bold", title)
      linebreak()
    }
    #body
  ]
}

/// `hr` creates a horizontal line.
#let hr = line(length: 100%, stroke: (paint: gray))

/// `quote` creates a blockquote.
#let quote(content) = {
  block(
    width: 100%,
    fill: gray.lighten(90%),
    inset: (x: 10pt, y: 7pt),
    stroke: (left: (paint: gray, thickness: 3pt)),
    content,
  )
}

#let weakbreak = pagebreak(weak: true)
