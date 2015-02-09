;; refer to https://wiki.python.org/moin/EmacsEditor for information about the Python plugin 
;; used in Emacs.

;; ;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; ;; (add-hook 'shell-mode-hook
;; ;;           (lambda ()
;; ;;             (setq indent-tabs-mode t)
;; ;;             (setq tab-width 4)
;; ;;             (setq python-indent-offset 4))) ;;tab = 2 is not conform with Pep8

;; ;; jedi for python auto-completion
;; (require 'epc)
;; (require 'deferred)
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)
;; ;;(autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
;; ;;**********************************************************************
;; ;; django 
;; ;;**********************************************************************
;; (require 'sws-mode)
;; (require 'jade-mode)
;; (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;; (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; second time comment
;; (global-hl-line-mode nil) ;; To enable
; (nload-file "~/.emacs.d/emacs-for-python/epy-init.el")

;; (set-face-background 'hl-line "black") ;; change with the color that you like
                                       ;; for a list of colors: http://raebear.net/comp/emacscolors.html
;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation)

;; Download elpy package from package-list
;; (elpy-enable)
