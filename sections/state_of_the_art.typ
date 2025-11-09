#import "@preview/typslides:1.3.0": *

#slide(title: "But Prolog Already Have Package Managers", outlined: true)[
  - #link("https://www.swi-prolog.org/pldoc/man?section=packs")[SWI-Prolog Packs]
    - *Strongly tied to SWI-Prolog*
    - Limited functionality
      - No lockfile (for reproducibility when range of versions is specified)
      - No support for workspaces features, local dependencies (#link("https://www.swi-prolog.org/pldoc/man?section=prologpack")[local pack can be installed] but cannot be #link("https://www.swi-prolog.org/pldoc/man?section=pack-devel")[declare in the manifest] )
      - No support for transitive dependencies outside of the #link("https://www.swi-prolog.org/pack/list")[Packs (add-ons)] (there is a system of #link("https://www.swi-prolog.org/pldoc/man?section=pack-devel")[providers]) or not already installed
      - No support for version constraints (only latest version is installed)
        - #link("https://github.com/wouterbeek/ppm")[Prolog-Package-Manager (PPM)] attempt to solve this problem
  #pagebreak()

  - #link("https://logtalk.org/manuals/devtools/packs.html")[Logtalk Packs]
    - *Not compatible with Scryer Prolog*
    - No support for workspace features
    - No cross-compatibility between Prolog implementations outside of the #link("https://logtalk.org/")[Logtalk language]
      - Pack authors can specify which Prolog backend(s) a pack supports
]
