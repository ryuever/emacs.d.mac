;;*************************************************************************************
;; keybinding for helm mode
;;*************************************************************************************
;;(require 'helm)

(require 'ggtags)
(require 'helm-gtags)
(require  'helm-config)

(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)

(helm-mode 1)                                         ;; global enable helm mode
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
