# New PureScript Mode

This is a PureScript Emacs mode I am putting together to replace my own usage of [purescript-mode](https://github.com/dysinger/purescript-mode), which is a fork of haskell-mode. While it is amazing that haskell-mode itself is code that has been migrated and committed to since 1992, it features a huge amount of code that is simply unused. As my own need for a PureScript mode is limited to syntax highlighting and *some* alignment, I will focus on getting that working in some simple way.

For any IDE related functionality, install [psc-ide-emacs](https://github.com/epost/psc-ide-emacs).

## Goals

* Cheap syntax highlighting
* Indentation via SMIE or some other method not involving parsing in elisp <https://www.gnu.org/software/emacs/manual/html_mono/elisp.html#SMIE>

## TODO

* Fix psc-ide-emacs to not depend on a literal "purescript-mode" (I will PR this sooner or later)
* Indentation
* Misc.

## Installation

```lisp
(add-to-list 'load-path (expand-file-name "~/Code/new-purescript-mode/"))
(require 'new-purescript-mode)
```

If you are using Spacemacs, consider telling it to not mess with indentation:

```lisp
(add-to-list 'spacemacs-indent-sensitive-modes 'purescript-mode)
```
