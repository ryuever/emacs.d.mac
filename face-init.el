;; (require 'color-theme)
;;  (eval-after-load "color-theme"
;;     '(progn
;;        (color-theme-initialize)
;;        (color-theme-oswald)))

;;(color-theme-hober)
;;(color-theme-oswald)
;;(color-theme-comidia)
;;(color-theme-gnome2)
;;(color-theme-classic)

;;(require 'color-theme-approximate)
;;(require 'color-theme-github)
;;(require 'color-theme-solarized)

;;(require 'solarized-light-theme)

;; (add-to-list 'custom-theme-load-path (concat home-path "/.emacs.d/theme/"))
;; (require 'color-theme-twilight)
;;(load-theme 'solarized-dark t)

;; (require 'solarized-dark-theme)
;; (add-to-list 'custom-theme-load-path (concat home-path "/.emacs.d/elpa/color-theme-twilight-0.1/"))

;; (require 'color-theme-monokai)
;; (add-to-list 'custom-theme-load-path (concat home-path "/.emacs.d/elpa/color-theme-monokai-0.0.5/"))

;;(add-to-list 'custom-theme-load-path (concat home-path "/Desktop/monokai-theme-20141002.410/"))
(load-theme 'monokai)
;; (load-theme 'solarized-dark)
;;************************************************************************
;;rainbow-mode minor    have color values colored by themselves
;;************************************************************************
(require 'rainbow-mode)
(dolist (hook '(css-mode-hook
              html-mode-hook
              python-mode-hook
              c++-mode-hook
              lisp-mode-hook))
   (add-hook hook (lambda () (rainbow-mode 1))))
(setq rainbow-mode t)
;;************************************************************************
;;rainbow-mode minor    have color values colored by themselves
;;************************************************************************
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
