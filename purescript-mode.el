;;; purescript-mode.el --- Major mode for editing PureScript  -*- lexical-binding: t -*-

;; Copyright (C) 2019 Justin Woo
;; License: MIT

;; Homepage: https://github.com/justinwoo/new-purescript-mode
;; Keywords: languages
;; Package-Version: 0.0.1
;; Package-Requires: ()

;;; Commentary:
;;
;;  A mode for editing PureScript files, deferring IDE tasks to `psc-ide`
;;
;;; Code:

;;;###autoload
(define-derived-mode purescript-mode
  prog-mode "PureScript"
  "Major mode for editing PureScript programs"
  :group 'purescript
  :syntax-table purescript-mode-syntax-table

  (setq
   indent-tabs-mode nil

   comment-start "--"
   comment-end ""

   dabbrev-case-fold-search nil
   dabbrev-case-distinction nil
   dabbrev-case-replace nil

   font-lock-defaults '(purescript-mode-font-lock-keywords)
   )

  :after-hook purescript-mode-hook)

(setq
 purescript-mode-syntax-table
 (let ((table (make-syntax-table)))
   (modify-syntax-entry ?_  "w" table)
   (modify-syntax-entry ?.  "w" table)
   (modify-syntax-entry ?\{  "(}1nb" table)
   (modify-syntax-entry ?\}  "){4nb" table)
   (modify-syntax-entry ?-  "_ 123" table)
   (modify-syntax-entry ?\n ">" table)
   table))

(setq
 purescript-mode-font-lock-keywords
 (let
     ((my-keywords-regexp
       (regexp-opt
        '("if" "then" "else" "case" "of"
          "ado" "do" "_" "let" "foreign"
          "module" "import" "where" "as"
          "instance" "derive" "forall" "∀"
          "newtype" "data" "class" "type" "kind"
          "infix" "infixl" "infixr")
        'words))
      (my-operators-regexp
       (regexp-opt
        '("::" "∷"
          "=>" "⇒"
          "->" "→"
          "<-" "←"
          "<=" "⇐"
          "~>" "|")
        'words))
      (my-types-modules-regexp "\\<[A-Z][0-9A-Za-z_']*")
      (my-function-names-regexp "^\\([a-z_][0-9A-Za-z_']*\\|([^)]+)\\)")
      )
   `((,my-operators-regexp . font-lock-operator-face)
     (,my-keywords-regexp . font-lock-keyword-face)
     (,my-types-modules-regexp . font-lock-type-face)
     (,my-function-names-regexp . font-lock-function-name-face)
     )))

(defcustom purescript-mode-hook nil
  "List of functions to run after `purescript-mode' is enabled."
  :group 'purescript
  :type 'hook)

(progn
  (add-to-list 'auto-mode-alist '("\\.purs\\'" . purescript-mode))
  (modify-coding-system-alist 'file "\\.purs\\'" 'utf-8))

(provide 'purescript-mode)
;;; purescript-mode.el ends here
