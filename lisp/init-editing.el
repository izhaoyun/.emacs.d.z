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

;; backups
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files/151946#151946
(setq vc-make-version-backup t
      version-control        t
      kept-new-versions      10
      kept-old-versions      0
      delete-old-versions    t
      backup-by-copying      t)
;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save. The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook 'force-backup-of-buffer)

;; Package: highlight-symbol.el
(el-get-bundle highlight-symbol)
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Package: multiple-cursors
(el-get-bundle multiple-cursors)
(require 'multiple-cursors)

(provide 'init-editing)
