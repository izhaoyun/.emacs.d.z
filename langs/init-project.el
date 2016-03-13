;;; init-project.el --- Development project

;;; Commentary:

;;; Code:
;; Package: projectile
(el-get-bundle projectile)
(use-package projectile
  :defer 5
  :commands (projectile-find-file projectile-switch-project)
  :config
  (projectile-global-mode 1)
  ;; Variables
  (setq projectile-cache-file "~/.emacs.d/.projectile.cache")
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  (setq projectile-known-projects-file "~/.emacs.d/.projectile-bookmarks.eld")
  (setq projectile-mode-line
        '(:eval (format " %s[%s]" (string #x1f5c0) (projectile-project-name)))))

;; Package: magit
(el-get-bundle magit)
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

;; Package: comment-dwim-2
(el-get-bundle comment-dwim-2)
(use-package comment-dwim-2
  :bind ("M-;" . comment-dwim-2))

(provide 'init-project)
;;; init-project.el ends here
