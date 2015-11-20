(defun downcase-character ()
  (interactive)
  (downcase-region (point) (+ (point) 1)))
(defun upcase-character ()
  (interactive)
  (upcase-region (point) (+ (point) 1)))

(global-set-key (kbd "C-x C-u") 'upcase-character)
(global-set-key (kbd "C-x C-l") 'downcase-character)

;;*************************************************************************************
;; 清除buffer中每一行结尾的空格
;;*************************************************************************************
(defun remove-tail-space()
  (interactive)
  (let ((current-position (point)))
    (goto-char (point-min))
    (replace-regexp " +$" "")
    (goto-char current-position)
    )
  )

(global-set-key (kbd "C-x C-r") 'remove-tail-space)
