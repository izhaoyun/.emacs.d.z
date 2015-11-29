;; Package: undo-tree
(el-get-bundle undo-tree)
(require 'undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-visualizer-timestamps t
      undo-tree-visualizer-diff       t)
;; setting up undo/redo keys
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)

;; Package: expand-region
(el-get-bundle expand-region)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; new line before current line
(defun zhao/new-line-before (times)
  "Insert a newline above the current line."
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))

(global-set-key (kbd "C-S-o")
                'zhao/new-line-before)

(provide 'init-misc)
