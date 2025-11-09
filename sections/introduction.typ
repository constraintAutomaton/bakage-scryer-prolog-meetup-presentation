#import "@preview/typslides:1.3.0": *

#slide(title: "Why a Package Manager for Prolog", outlined: true)[
  - Software design requires management of abstraction and modularity
  - Code reusability is essential for productive development
  - Popular languages thrive due to rich package ecosystems:
    - Domain-specific: HTTP servers (#link("https://github.com/scryer-prolog/http-server")[exists in scryer-prolog]), physics engines, etc.
    - Building blocks: error handling, stream processing, type systems, etc.
  - *Prolog's ecosystem lags behind in that regard*, making development harder
    - Place the burden of developing core libraries to Prolog maintainer (at least for *convenient usage*)
  //- A package manager would help Prolog compete with modern languages

  #pagebreak()

    - #link("https://github.com/bakaq/qupak")[Qupak:  Pattern Matching for library(reif)]
      ```pl
      example_match(Term, Out) :-
          match(Term, [
              +a ~> Out = 1,
              \b(-N) ~> Out = N,
              \c(?N) ~> Out = N,
              (*) ~> Out = wildcard
          ]).
      ```

    #pagebreak()

    - #link("https://github.com/bakaq/testing.pl")[testing.pl: A test runner for Scryer Prolog and Trealla Prolog.]
    ```pl
    :- use_module(library(lists)).
    :- use_module(library(clpz)).

    expected_term(exists).

    main :-
        run_tests,
        halt.

    test("The expected relation exists", (some_predicate(X), expected_term(X))).
    test("The computation is valid", (length([1,2,3], X), X #= 1+2)).

    ```

]
