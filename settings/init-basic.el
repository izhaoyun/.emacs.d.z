;;; init-basic.el --- Fixing weird quirks and poor defaults

;;; Commentary:

;;; Code:

;;;###autoload
(progn
  (ido-mode t)
  (setq ido-enable-flex-matching t)

  (menu-bar-mode -1)
  (when window-system
    (tool-bar-mode -1)
    (scroll-bar-mode -1))

  (global-linum-mode t)
  (column-number-mode t)

  (winner-mode t)
  ;; Package: window-numbering
  (el-get-bundle window-numbering)
  (require 'window-numbering)
  (window-numbering-mode t)

  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "M-z") 'zap-up-to-char)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        visible-bell t
        load-prefer-newer t
        ediff-window-setup-function 'ediff-setup-windows-plain)

  ;; backup files
  (setq version-control t
        kept-new-versions 10
        kept-old-versions 0
        delete-old-versions t
        backup-by-copying t)
  (setq backup-directory-alist '(("" . "~/.emacs.d/backups/per-save")))

  (defun force-backup-of-buffer ()
    ;; Make a special "per session" backup at the first save of each
    ;; emacs session.
    (when (not buffer-backed-up)
      ;; Override the default parameters for per-session backups.
      (let ((backup-directory-alist '(("" . "~/.emacs.d/backups/per-session")))
            (kept-new-versions 3))
        (backup-buffer)))
    ;; Make a "per save" backup on each save. The first save results in
    ;; both a per-session and a per-save backup, to keep the numbering
    ;; of per-save backups consistent.
    (let ((buffer-backed-up nil))
      (backup-buffer)))
  
  (add-hook 'before-save-hook 'force-backup-of-buffer)

  )

(provide 'init-basic)
;;; init-basic.el ends here
