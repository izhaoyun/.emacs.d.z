;;; init-project.el --- Development project

;;; Commentary:

;;; Code:
;; Package: projectile
(el-get-bundle projectile)
(use-package projectile
  :defer t
  :init
  (progn
    (setq projectile-enable-caching t)
    (setq projectile-completion-system 'ivy)
    (setq projectile-indexing-method 'alien)
    (projectile-global-mode)))

;; Package: magit
(el-get-bundle magit)
(use-package magit
  :defer t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

;; Package: comment-dwim-2
(el-get-bundle comment-dwim-2)
(use-package comment-dwim-2
  :bind ("M-;" . comment-dwim-2))

;; Package: company
(el-get-bundle company-mode)
(use-package company-mode
  :defer t
  :config (global-company-mode))

;; Package: yasnippet
(el-get-bundle yasnippet)
(use-package yasnippet
  :defer t
  :config
  (progn
    (yas-global-mode 1)))

(provide 'init-project)
;;; init-project.el ends here
