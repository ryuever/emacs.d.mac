;; based on the emacs wizard Magnar Sveen's expand-region and multiple-cursors package.
;; The corresponding video could be found on Youtube
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; One point to note, when it is under multiple-cursors mode; the delete opration should
;; use C-d, forwarding should be C-f. or it will just works one current cursor.
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; First, select a region then press the keybinding to forward match the selected region.
;; one key stroke for one matched part selected.
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
