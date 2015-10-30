;;*************************************************************************************
;; org mode export
;;*************************************************************************************
(setq org-startup-with-inline-images 1)     ;; will inlined display image when you open a file
;;*************************************************************************************
;; use Org-mode as the default mode for all README files
;;*************************************************************************************
(add-to-list 'auto-mode-alist '("README$" . org-mode))
(setq org-src-fontify-natively t)
;; below two variables is used to solve the issue when export to a html file
;; with python code, the number and variable will got a background color.
(setq py-number-face  nil)
(setq py-variable-name-face nil)

;; ;;below key binding is suggested by manual
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; ;;keep track of when a TODO item is finished
(setq org-log-done 'time)
;; ;;record a note along with the timestamp.
(setq org-log-done 'note)
;; ;;TODO entry to automatically change to DONE when all children are done.
(defun org-summary-todo (n-done n-not-done)
        "Switch entry to DONE when all subentries are done, to TODO otherwise."
        (let (org-log-done org-log-states)   ; turn off logging
          (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;;(setq org-export-with-sub-superscripts nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For org appointment reminders
;; Get appointments for today
(defun my-org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
         (org-agenda-to-appt))

;; Run once, activate and schedule refresh
(my-org-agenda-to-appt)
(appt-activate t)
(run-at-time "24:01" nil 'my-org-agenda-to-appt)

; 5 minute warnings
(setq appt-message-warning-time 15)
(setq appt-display-interval 5)

; Update appt each time agenda opened.
(add-hook 'org-finalize-agenda-hook 'my-org-agenda-to-appt)

; Setup zenify, we tell appt to use window, and replace default function
(setq appt-display-format 'window)
;;(setq appt-disp-window-function (function my-appt-disp-window))

;;*************************************************************************************
;; resolve idle time,  “resolve” the time you were away 
;;*************************************************************************************
;; Emacs will alert a window to query what to do after 15 minutes of no operation on 
;; computer which means you are away.
(setq org-clock-idle-time 15)
;; (setq org-clock-persist 'history)
;; (org-clock-persistence-insinuate)
;; (setq org-clock-persist t)
;;************************************************************************
;;org-keywords
;;************************************************************************
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;;         (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;;         (sequence "|" "CANCELED(c)")))

;; (setq org-todo-keywords
;;       '((sequence "TODO" "|" "DONE")
;;         (sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
;;         (sequence "|" "CANCELED")
;;         (type "Fred" "Sara" "Lucy" "|" "DONE")))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-use-fast-todo-selection t)

(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-directory "~/org")
(setq org-default-notes-file "~/百度云同步盘/org/keep-maintain-plan/refile.org")

(setq org-agenda-files (quote ("~/百度云同步盘/org/keep-maintain-plan/reading.org"
                               "~/百度云同步盘/org/keep-maintain-plan/home.org"
                               "~/百度云同步盘/org/keep-maintain-plan/lab.org"
                               "~/百度云同步盘/org/keep-maintain-plan/refile.org")))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/百度云同步盘/org/keep-maintain-plan/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/百度云同步盘/org/keep-maintain-plan/refile.org")
               "* TODO Respond to %:from on %:subject\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/百度云同步盘/org/keep-maintain-plan/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/百度云同步盘/org/keep-maintain-plan/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/百度云同步盘/org/keep-maintain-plan/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("p" "Phone call" entry (file "~/百度云同步盘/org/keep-maintain-plan/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/百度云同步盘/org/keep-maintain-plan/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
;;************************************************************************
;;org-mode babel
;;************************************************************************
;; Some initial langauges we want org-babel to support.
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (clojure . t)
   ))
;;************************************************************************
;;org-mode HTML publish
;;************************************************************************
;;when you type C-c C-e b command, it will add this css to current page.
(setq org-html-head-extra "<link rel=\"stylesheet\" 
href=\"file:///home/ryu/org/static/css/stylesheet-old.css\" type=\"text/css\" />
<link rel=\"stylesheet\" href=\"file:///home/ryu/org/static/styles/default.css\">
<script src=\"file:///home/ryu/org/static/highlight.pack.js\"></script>
<script>hljs.initHighlightingOnLoad();</script>")
(setq css-path (concat my-emacs-path "org/static/css/stylesheet.css"))
(setq org-html-head-extra (concat "<link rel=\"stylesheet\" href=" css-path " type=\"text/css\" />"))
;;(setq org-export-publishing-directory "~/Documents/org/exported_html")

;;(require 'org-publish)

;;************************************************************************
;; add a component to org publish list by only one line
;;************************************************************************
;; The typical method for adding a new component to org publish list.
;; (setq org-publish-project-alist
;;       '(
;;         ("Javascript-notes"
;;          :base-directory "~/百度云同步盘/org/js/"
;;          :auto-sitemap t
;;          :index-filename "sitemap.org"
;;          :index-title "Sitemap"
;;          :recursive t
;;          :base-extension "org"
;;          :publishing-directory "~/Documents/public_html/Javascript/"
;;          :publishing-function org-html-publish-to-html
;;          :headline-levels 3
;;          :auto-preamble t
;;          )
;;         ("Javascript-static"
;;          :base-directory "~/百度云同步盘/org/js/"
;;          :recursive t
;;          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
;;          :publishing-directory "~/Documents/public_html/Javascript/"
;;          :publishing-function org-publish-attachment)
;;         ("js" :components ( "Javascript-notes" "Javascript-static"))))
(defun make_publish_stmt (dir_name publish_name)
  "when add a new object to org-publish list, normally It's need to format the dada as listed above.
   Appearantly, it is fallible; meanwhile when it has bunchs of components, it will be cumbersome.
   The meaning of corresponding parameters is list as follows : 
      - dir_name is for the directory name under a specified path
      - publish_name is for the directory name under the specified published folder"
  (let (static_header note_header dir_path publish_path)
    (setq dir_path (concat "~/百度云同步盘/org/" dir_name "/"))
    (setq publish_path (concat "~/Documents/public_html/" publish_name "/"))
    (setq note_header (concat publish_name "-notes"))
    (setq static_header (concat publish_name "-static"))
    (append
     (pairlis (list note_header) (list (apply 'append (pairlis (list :base-directory :auto-sitemap :index-filename
                                                                     :index-title :recursive :base-extension
                                                                     :publishing-directory :publishing-function
                                                                     :headline-levels :auto-preamble)
                                                               (list (list dir_path) (list t) (list "sitemap.org")
                                                                     (list "Sitemap") (list t) (list "org")
                                                                     (list publish_path)
                                                                     (list 'org-html-publish-to-html) (list 3)
                                                                     (list t))))))
     (pairlis (list static_header) (list (apply 'append (pairlis '(:base-directory
                                                                   :recursive
                                                                   :base-extension
                                                                   :publishing-directory
                                                                   :publishing-function)
                                                                 (list (list dir_path)
                                                                       (list t)
                                                                       (list "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf")
                                                                       (list publish_path)
                                                                       (list 'org-publish-attachment))))))
     (pairlis (list dir_name) (pairlis '(:components) (list (list (list note_header static_header))))))))

(setq org-publish-project-alist nil)

(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "PythonCookbook" "Python")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "PythonLib" "PythonLib")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "japanese" "Japanese")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "english" "English")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "compiler" "Compiler")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "linux" "Linux")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "emacs" "Emacs")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "fundamental" "Fundamental")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "gridlabd" "GridLabd")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "app" "App")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "shell-script" "shell-script")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "C-C++" "C-C++")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "network-programming"
                                                                                     "network-programming")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "regexp" "regexp")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "tornado" "Tornado")))
(setq org-publish-project-alist (append org-publish-project-alist (make_publish_stmt "ps" "ps")))
