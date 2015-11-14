;; Package: helm
(el-get-bundle helm)

(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-x b")   'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c h x") 'helm-register)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-s")     'helm-occur)

(setq helm-recentf-fuzzy-match    t
      helm-buffers-fuzzy-matching t
      helm-semantic-fuzzy-match   t
      helm-imenu-fuzzy-match      t
      helm-M-x-fuzzy-match        t
      helm-apropos-fuzzy-match    t
      helm-locate-fuzzy-match     t)

;; Package: helm-ag
(el-get-bundle helm-ag)
(global-set-key (kbd "M-g a") 'helm-do-ag)

;; Package: helm-ls-git
(el-get-bundle helm-ls-git)

;; Package: helm-swoop
(el-get-bundle helm-swoop)
(require 'helm-swoop)

;; Package: helm-descbinds
(el-get-bundle helm-descbinds)
(require 'helm-descbinds)
(helm-descbinds-mode 1)

(provide 'init-helm)
