#import "@preview/typslides:1.3.0": *

#title-slide[
  Perpective
]


#slide(title: "A Lot of Work Ahead, But a Lot of Opportunities Too", outlined: true)[
  == Development
    - Port bash scripts to Rust
      - Easier development and maintenance
      - Embed Prolog runner

  == User Experience
    - Deploy Bakage to package hosting services (AUR, Chocolatey, Flatpak, etc.)
    - Make it usable without copying the Bakage in a project
    - Comprehensive CLI

    #pagebreak()
  == Features
    - Package registry
      - Encourage creation and sharing of reusable building blocks
    - Semantic versioning
    - (Semi-)automatic Prolog implementation compatibility detection and polyfilling
      - Focus on sharing Prolog code, not implementation-specific code
    - License auditing
]
