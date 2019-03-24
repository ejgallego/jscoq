# JsCoq 1.0 ((())((()()(()))((()()))))
--------------------------------------

  - [ ] Automatic parsing mode.
  - [ ] Execution gutters.
  - [ ] Move to sertop.
  - [ ] UI layout.

Pending worker tasks:

+ Race: we cancel, then we add before the cancelled event arrives.
+ Be careful about re-execing states, as this brings back the parser to an improper state.
+ quick prev/next creates problems in long commands.
+ we are reusing span_ids and this is not ok for the STM.

  Released on: 

# JsCoq 0.9 "The idea kills the idea"
-------------------------------------

  - [x] Use Dune as build system
  - [x] Worker support.
  - [x] Support for Coq 8.9
  - [x] Static compilation of cma/cmo. (thanks @hhugo).
  - [x] Support for Coq 8.6/8.7/8.8/8.9.
  - [x] Migrated to ppx for jsoo syntax.
  - [x] Port to Ocaml 4.07.1.
  - [x] Port to JSOO 3.3.0.
  - [x] Migrate from d3 to jQuery for DOM manipulation.
  - [x] Full support for SF.
  - [x] Many small fixes.
  - [x] Goal display on hover.
  - [x] Building with 32-bit on macOS.
  - [x] Contextual info when hovering identifiers in goals pane.
  - [x] Contextual info for identifier under cursor.
  - [x] Support for adding packages from Zip files.
  - [x] Automatic download of packages on Require.
  - [x] Fine-grained module dependencies for Coq standard library.
  - [x] company-coq-style symbols and subscripts.
  - [x] Auto-completion of tactics and lemmas.
  - [x] PoC running on Node.js.

  Released on: 

# JsCoq 0.8 "The most inefficient programming language ever designed"
-------------------------------------

  - Port to Ocaml 4.03.0.
  - Fast package loading using TypedArrays. (thanks @gasche @hhugo).
  - Many small fixes.

  Released on: 13/06/2016

# JsCoq 0.7 "Hott"
--------------------------------

  - New panel support.
  - Support many more addons.

# JsCoq 0.6 "���𐄽𐄺�"
--------------------------------

  - JSON/sexp serialization of Constr_uctions.
  - Add jscoq loader.

# JsCoq 0.5 "Alexandria"
--------------------------------

  - Library manager support.
  - Coqdoc backend.

# JsCoq 0.4 "For real"
--------------------------------

  - New manager for multi-snippet documents.
  - Rudimentary Cache of cma => js compilation.

# JsCoq 0.3 "Kitties everywhere"
--------------------------------

  - New IDE/parsing based on CodeMirror.

# JsCoq 0.2 "Castle edition"
----------------------------

  - Asynchronous library caching.
  - CMA precompilation

# JsCoq 0.1 "Mediterranean edition"
-----------------------------------

  - Initial release, support for plugins and modules.
