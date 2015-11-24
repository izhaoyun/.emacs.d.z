;; Package: undo-tree
(el-get-bundle undo-tree)
(require 'undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-visualizer-timestamps t
      undo-tree-visualizer-diff       t)
;; setting up undo/redo keys
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)

(provide 'init-misc)
