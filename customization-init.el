(defun downcase-character ()
  (interactive)
  (downcase-region (point) (+ (point) 1)))
(defun upcase-character ()
  (interactive)
  (upcase-region (point) (+ (point) 1)))

(global-set-key (kbd "C-x C-u") 'upcase-character)
(global-set-key (kbd "C-x C-l") 'downcase-character)
