;; go to sbcl org page http://www.sbcl.org/platform-table.html, click the green button to download the osx compatible version
;; cd  sbcl-directory
;; for OS X, "su -" to setup root, then sh run-sbcl.sh and sudo sh install.sh

;; download slime respository through "M-x package-list-packages"

(setq inferior-lisp-program "sbcl")
(setq inferior-lisp-program "/usr/local/bin/sbcl") ; tell emacs where the lisp interpreter is
(add-to-list 'load-path "/Users/ryuyutyo/.emacs.d/elpa/slime-20141010.1357")     ; tell emacs where slime is
(require 'slime)
(slime-setup '(slime-fancy))  ; load almost all slime packages (minimalist: use (slime-setup))
