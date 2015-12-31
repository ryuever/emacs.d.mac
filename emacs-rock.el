;;*************************************************************************************
;; based on the emacs wizard Magnar Sveen's expand-region and multiple-cursors package.
;; The corresponding video could be found on Youtube
;;*************************************************************************************
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

;;*************************************************************************************
;; 不同于kill line(C-k)，这个可以支持在行中的任何位置来删除当前行
;;*************************************************************************************
(global-set-key (kbd "C-9") 'kill-whole-line)

(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )

(defun copy-word (&optional arg)
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  )

(global-set-key (kbd "C-c w") (quote copy-word))

;;*************************************************************************************
;; 文件保存的时候自动去除尾部的whitespace
;;*************************************************************************************
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;*************************************************************************************
;; support shift + arrow to switch between windows
;;*************************************************************************************
(windmove-default-keybindings)
(setq windmove-wrap-around t)
