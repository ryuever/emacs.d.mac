(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(add-hook 'jade-mode-hook (lambda() (setq jade-tab-width 2)))

(setq coffee-tab-width 2)

(setq tab-width 4)
