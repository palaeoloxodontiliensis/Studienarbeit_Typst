<img src="https://media.github.tools.sap/user/54420/files/8a0fe5cd-94d0-4bf2-8107-2c5994862f2d" width="100%" />

# Typst Template DHBW <a href="https://github.tools.sap/I550629/vt-template-typst/generate"><img src="https://img.shields.io/badge/Generate_from_Template-8A2BE2?logo=github" /></a>

This is a university report template written in [Typst](https://typst.app/),
based on the [vtgermany/LaTeX-Template-DHBW](https://github.wdf.sap.corp/vtgermany/LaTeX-Template-DHBW).

> Typst was born out of our frustration with LaTeX. Not knowing what we were in for, we decided to take matters into our own hands and started building. -Typst

Typst is a replacement for LaTeX which was designed to be **as powerful as LaTeX while being much easier to learn and use**.
It has a much simpler syntax (similar to Markdown), _actual good error messages_ (looking at you, LaTeX)
and out-of-the-box bibliography features using `.bib` or `.yaml` files (see `example.yaml`) (again, looking at you, LaTeX).

If you want to explore other features here is the link for the offical [documentation](https://typst.app/docs/).

## 🏃‍♂️ Getting Started

<table>
  <tr>
    <td>
      <p>Getting started is easy!</p>
      <ul>
        <li>Follow the steps as described in <a href="#local-compiler">🛠️ Setup</a></li>
        <li>Open <code>main.typ</code> and edit the document metadata</li>
        <li>If you're new to Typst, take a look at the <a href="https://typst.app/docs/tutorial">Tutorial</a></li>
        <li>Compile PDF using <code>typst compile main.typ</code></li>
      </ul>
    </td>
    <td>
      <a href="https://video.sap.com/media/t/1_nrsgn0jc">
        <img src="https://media.github.tools.sap/user/54420/files/bca73772-05c3-4724-b5d6-fe1f9151465d" />
      </a>
    </td>
  </tr>
  <tr>
    <th>Setup in Local Machine</th>
    <th>Quick Start in 2 Minutes</th>
  </tr>
</table>

## ✨ Features

Here are some basic features our template provides:

### Pre-defined Pages

The template supports the following pages out-of-the-box:

- Title Page
- Declaration of Originality
- Confidentiality Clause
- Abstracts (in multiple languages)
- Table of Contents
- List of Abbreviations
- List of Figures
- List of Tables
- Source Code Directory
- Bibliography

The Confidentiality Clause can be toggled by setting `confidentiality_clause` and the abstracts can be modified by changing the `abstract` field:

<table>
  <tr>
    <td>
      <code>main.typ</code> @ <code>#show: project.with(</code>
    </td>
  </tr>
  <tr>
    <td><pre lang="yaml">confidentiality_clause: true
abstract: (
  ("de", "Deutsch",
    include("abstracts/abstract_german.typ")
  ),
  ("en", "English",
    [*Hello World!* This is my abstract.]
  )
),</pre>
    </td>
  </tr>
</table>

> **Note**: Some outlines are only shown if your document contains figures which should be outlined.
> For example, `List of Figures` will be hidden if you dont't have any images in your document.

---

### Languages

You can switch to a different language easily by setting `lang` in your main document. This will also affect some region-based writing style.
If the language is set to "de", quotes will be `„test"`, otherwise `"test"`.

<table>
  <tr>
    <td>
      <code>main.typ</code> @ <code>#show: project.with(</code>
    </td>
  </tr>
  <tr>
    <td><pre lang="yaml">lang: "de"</pre>
    </td>
  </tr>
</table>

Currently, there are 2 languages supported:

|Language|Code|
|---|---|
|German|`de`|
|English|`en`|

---

### Abbreviations

First, define the acronyms in the `acronyms` field then initialize the template. Under the hood it is using [glossarium](https://github.com/typst-community/glossarium).

```typ
#show: project.with(
  ...
  acronyms: (
    (key: "NN", short: "NN", long: "Neural Network"),
    (key: "SG", short: "SG", long: "Singular"),
  )
  ...
)
```

Once the acronyms are defined, you can use them in the text with the `@key`. To get the plural version of the acronym, you can use `@key:pl` that adds an 's' after the acronym. If a plural version of the definition is provided, it will be used if the first use of the acronym is plural. Otherwise, the singular version is used, and a trailing 's' is added.

## 🛠️ Setup

Here are some basic setup instructions, if you need more details please refer to the [documentation](https://typst.app/docs/).

### Local Compiler

Please note that common editors like VS Code provide only limited support for Typst.
Mostly auto-complete and syntax highlighting is only provided in a _relatively_ basic form.
For VS Code, you can install the [`Tinymist Typst` Extension](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist).

1. Click on [![Generate](https://img.shields.io/badge/Generate-8A2BE2?logo=github)](https://github.tools.sap/I550629/vt-template-typst/generate) and name the repository (e. g. `pa-1`)
2. Clone the created repository to your local machine: `git clone https://github.tools.sap/I550629/pa-1.git`
3. Navigate to the repository `cd pa-1`
4. Install [Typst](https://github.com/typst/typst)
    - Pre-compiled Binaries: [typst/releases](https://github.com/typst/typst/releases/)
    - macOS/Linux: `brew install typst`
    - Arch Linux: `pacman -S typst`
    - Void Linux: `xbps-install typst`
7. Compile your PDF: `typst compile main.typ`
8. Open the PDF in your favorite PDF-Viewer

If you want live updates, you can use `typst watch main.typ` for automatically watch for changes in your code.

---

### Web-IDE

Please note that the Web-IDE **does not** have the ability to upload your work to a VCS like GitHub.
But it supports better auto-complete and a nicer user experience.

> ⚠️ **Warning**: Please make sure **you are allowed to work in a cloud environment** if working with confidentiality information.
> A good rule-of-thumb would be to not use the Web-IDE if your document contains a [Confidentiality Clause](#content) 😊.

1. Clone the Template to your local machine: `git clone https://github.tools.sap/I550629/vt-template-typst.git`
2. Open the [Web-IDE](https://typst.app/)
3. Start a new project
4. Manually copy all files from the template to the new project


## 💡 Feedback

**Anything Missing?** Please [create an issue](https://github.tools.sap/I550629/vt-template-typst/issues/new) or open a Pull Request right away.

**Have Questions?** Please [open a discussion](https://github.tools.sap/I550629/vt-template-typst/discussions).
