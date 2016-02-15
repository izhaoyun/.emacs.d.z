;;; init-project.el --- Development project

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: projectile
(el-get-bundle projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;; Package: helm-projectile
(el-get-bundle helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: magit
(el-get-bundle magit)
(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/el-get/magit/Documentation/"))
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode 1)

;; Package: smartparens
(el-get-bundle smartparens)
(require 'smartparens-config)
(show-smartparens-global-mode t)
(smartparens-global-mode 1)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)

;; Package: rainbow-delimiters
(el-get-bundle rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(global-set-key (kbd "RET") 'newline-and-indent)
;; Package: clean-aindent
(el-get-bundle clean-aindent)
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(el-get-bundle dtrt-indent)
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: highlight-indentation
(el-get-bundle highlight-indentation)

;; Package: ws-butler
(el-get-bundle ws-butler)
(require 'ws-butler)
(ws-butler-global-mode +1)

(provide 'init-project)
;;; init-project.el ends here
