;; Package: undo-tree
(el-get-bundle undo-tree)
(require 'undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-visualizer-timestamps t
      undo-tree-visualizer-diff       t)
;; setting up undo/redo keys
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)

;; self-defined function
(defun zhao/new-line-before (times)
  "Insert a newline above the current line."
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))

(global-set-key (kbd "C-s-o")
                'zhao/new-line-before)

(provide 'init-misc)
