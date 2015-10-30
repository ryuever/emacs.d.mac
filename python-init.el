;; https://wiki.python.org/moin/EmacsEditor for info about the Python plugin used in Emacs

;; Download elpy package from package-list
;; (elpy-enable)
(setq python-indent-guess-indent-offset nil)

;; refer to http://blog.csdn.net/mikelearnscode/article/details/23022277
;; download elpy and jedi through command M-x package-list-packages
(require 'elpy nil t)
(elpy-enable)

;; for python syntax check, download pyflakes with command : pip install --upgrade pyflakes
(setq python-check-command "/usr/local/bin/pyflakes")


(setq elpy-rpc-backend "jedi")


;; ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)


;; (setq py-python-command-args '("--matplotlib" "--colors" "LightBG"))
;; (setq ansi-color-for-comint-mode t)
;; (require 'ipython)


;; (require 'python)
(setq
 python-shell-interpreter "/usr/local/bin/ipython"
 python-shell-interpreter-args "--pylab"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
