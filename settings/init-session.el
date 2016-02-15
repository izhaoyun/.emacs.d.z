(el-get-bundle workgroups2)
(require 'workgroups2)
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
(workgroups-mode 1)

(el-get-bundle undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-visualizer-timestamps t
      undo-tree-visualizer-diff       t)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)

(provide 'init-session)
