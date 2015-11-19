(setq whitespace-display-mappings '(
  (space-mark   ?\     [?\u00B7]     [?.])
  (space-mark   ?\xA0  [?\u00A4]     [?_])
  (newline-mark ?\n    [?¶ ?\n])
  (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])
            ))

;; lines lines-tail newline trailing space-before-tab space-afte-tab empty
;; indentation-space indentation indentation-tab tabs spaces
(setq whitespace-style '(face space-mark tab-mark newline-mark) )

(setq whitespace-line-column 85)

(global-set-key (kbd "\C-c w") 'whitespace-mode)

(global-set-key (kbd "\C-o k") 'whitespace-mode)
