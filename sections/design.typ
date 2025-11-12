#import "@preview/typslides:1.3.0": *

#title-slide[
  Bakage
]

#slide(title: "Manifest", outlined: true)[
  #text(size: 0.75em)[```pl
  name("name_of_the_package").
  % Optional. The file that will be imported when this package is used.
  main_file("main.pl").
  % The license of the package
  license(name("Unlicense"), path("./UNLICENSE")).
  % Optional
  dependencies([
      % A git url to clone
      dependency("testing", git("https://github.com/bakaq/testing.pl.git")),
      % A git url to clone at a specific branch
      dependency("test_branch", git("https://github.com/constraintAutomaton/test-prolog-package-manager.git", branch("branch"))),
      % A git url to clone at a tag
      dependency("test_tag", git("https://github.com/constraintAutomaton/test-prolog-package-manager.git", tag("tag"))),
      % A git url to clone at a specific commit hash
      dependency("test_hash", git("https://github.com/constraintAutomaton/test-prolog-package-manager.git", hash("d19fefc1d7907f6675e181601bb9b8b94561b441"))),
      % A path to a local package
      dependency("test_local", path("./local_package"))
  ]).
  ```]
]

#slide(title: "Two-Phase Architecture", outlined: true)[
  - *Planning Phase:* Generate abstract execution plan in Prolog from manifest

  #text(size: 0.75em)[```pl
  [
    validate_manifest,
    install_dependency(dependency("test",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git"))),
    install_dependency(dependency("test_branch",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      branch("branch")))),
    install_dependency(dependency("test_tag",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      tag("tag")))),
    install_dependency(dependency("test_hash",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      hash("d19fefc1d7907f6675e181601bb9b8b94561b441")))),
    install_dependency(dependency("test_local",
      path("./local_package")))
  ]
  ```]
  #pagebreak()
  - *Execution Phase:* Execute plan via bash scripts (We gonna migrate to Rust)
    - Transparent, Actionable Reports



  *Already installed:*
  ```pl
  [
    validate_manifest-success,
    do_nothing(dependency("test",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      tag("tag"))))-success
  ]
  ```
  #pagebreak()

  *Successful installation:*
  ```pl
  [
    validate_manifest-success,
    install_dependency(dependency("test", path("./local_package")))-success
  ]
  ```
  #pagebreak()

  *Validation error:*
  ```pl
  [
    validate_manifest_name-success,
    validate_manifest_main_file-success,
    validate_manifest_license-error(
      "the 'license' of the package is not defined or does not have the a predicate of the form 'license(name(N));license(name(N), path(P))'"),
    validate_dependencies-success
  ]
  ```
  #pagebreak()

  *Installation error:*
  #text(size: 0.75em)[```pl
  [
    validate_manifest-success,
    install_dependency(dependency("test",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git")))-success,
    install_dependency(dependency("test_branch",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      branch("branch"))))-success,
    install_dependency(dependency("test_tag",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      tag("tag"))))-success,
    install_dependency(dependency("test_hash",
      git("https://github.com/constraintAutomaton/test-prolog-package-manager.git",
      hash("d19fefc1d7907f6675e181601bb9b8b94561b441"))))-success,
    install_dependency(dependency("test_local", path("./local_package")))-success,
    install_dependency(dependency("error", path("./bar")))-error("the path does not exists")
  ]
  ```]
]
#slide(title: "Usage", outlined: true)[
  - Download Bakage from github
    - https://github.com/bakaq/bakage/releases
  - Copy the Bakage in your project
  - Create a manifest (see example above)
  - Run `./bakage.pl install`
    - The dependencies will be installed
]

#slide(title: "Usage", outlined: true)[

  #text(size: 0.75em)[```pl
  % Loads the package loader
  :- use_module(bakage).

  % Loads a package. The argument should be an atom equal to the name of the
  % dependency package specified in the `name/1` field of its manifest.
  :- use_module(pkg(testing)).

  % You can then use the predicates exported by the main file of the dependency
  % in the rest of the program.

  main :-
      % `run_tests/0` is exported by `pkg(testing)`
      run_tests,
      halt.

  test("Example test", (true)).
  test("Another test", (false)).
  ```]
]

#slide(title: "Current Features", outlined: true)[
  - Support for git dependencies
    - Main, branches, tags, commit hashes
  - Support for local dependencies
  - Validation of manifest
]

#slide(title: "Missing Features for MVP", outlined: true)[
  - #link("https://github.com/bakaq/bakage/issues/8")[Lockfile]
    - We have a #link("https://github.com/bakaq/bakage/pull/40")[closed PR] with a working prototype, but we decided to merge it with the transitive dependencies
  - #link("https://github.com/bakaq/bakage/issues/63")[Transitive dependencies]
  - #link("https://github.com/bakaq/bakage/issues/62")[Rename Scryer Prolog-specific names]
  - #link("https://github.com/bakaq/bakage/issues/58")[Initialization command]
]
