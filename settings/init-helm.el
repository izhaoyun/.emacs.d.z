;;; init-helm.el --- Helm

;;; Commentary:

;;; Code:

;; Package: helm
(el-get-bundle helm)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "C-c M-x")		'helm-M-x)
;; use switch-to-buffer instead and switch-to-buffer will use ivy
;; completion when ivy-mode is on.
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-c C-s")		'helm-occur)
(global-set-key (kbd "C-c f")		'helm-recentf)
(global-set-key (kbd "C-c h x")		'helm-register)
(global-set-key (kbd "C-c C-x C-f")	'helm-find-files)
(global-set-key (kbd "C-x C-b")		'helm-buffers-list)
(global-set-key (kbd "C-x r b")     'helm-filtered-bookmarks)
(global-set-key (kbd "C-h SPC")		'helm-all-mark-rings)
;; (global-set-key (kbd "M-y")         'helm-show-kill-ring)
(global-set-key (kbd "C-h M")       'helm-man-woman)

;; fuzzy matching
(setq helm-recentf-fuzzy-match	  t  ; helm-recentf & helm-mini
      helm-buffers-fuzzy-matching t  ; helm-mini & helm-buffers-list
      helm-imenu-fuzzy-match	  t  ; helm-imenu
      helm-M-x-fuzzy-match        t  ; helm-M-x
      helm-apropos-fuzzy-match	  t  ; helm-apropos
      helm-locate-fuzzy-match	  t) ; helm-locate

;; Package: helm-swoop
(el-get-bundle helm-swoop)
(require 'helm-swoop)
(global-unset-key (kbd "C-c h s"))
(global-set-key (kbd "C-c h s f") 'helm-swoop)
(global-set-key (kbd "C-c h s b") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c h s p") 'helm-multi-swoop)
(global-set-key (kbd "C-c h s l") 'helm-multi-swoop-all)

(provide 'init-helm)
;;; init-helm.el ends here
