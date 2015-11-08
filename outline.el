(defvar code-editing-mode-hooks '(c-mode-common-hook
                                  clojure-mode-hook
                                  emacs-lisp-mode-hook
                                  java-mode-hook
                                  lisp-mode-hook
                                  perl-mode-hook
                                  python-mode-hook
                                  sh-mode-hook))

;; Add a hs-minor-mode hook to code editing major modes
(dolist (mode code-editing-mode-hooks)
  (add-hook mode 'hs-minor-mode))

;;*************************************************************************************
;; A simple coffeescript and mocha testing hide or show block implementation.
;;*************************************************************************************
(defun my-coffee-customizations()
  (outline-minor-mode)
  (setq outline-regexp "\\([ \t]*@\\)\\|\\(^describe\\)")
  )
;; the keybinding is copied from ew : Outline Minor Mode
;; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")
                                        ; HIDE
(define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines) *
(define-key cm-map "o" 'hide-other)        ; Hide other branches
(define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
(define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
                                        ; SHOW
(define-key cm-map "a" 'show-all)          ; Show (expand) everything   *
(define-key cm-map "e" 'show-entry)        ; Show this heading's body   *
(define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
                                        ; MOVE
(define-key cm-map "u" 'outline-up-heading)                ; Up
(define-key cm-map "n" 'outline-next-visible-heading)      ; Next
(define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
(define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
(define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
(global-set-key "\M-o" cm-map)
