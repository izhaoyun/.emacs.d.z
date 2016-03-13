;;; init-helm.el --- Helm

;;; Commentary:

;;; Code:

;; Package: helm
(el-get-bundle helm)
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-apropos-fuzzy-match  t
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-c f" . helm-recentf)
         ("C-h a" . helm-apropos)
         ("C-h M" . helm-man-woman)
         ("C-x C-b" . helm-buffers-list)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings))

;; Package: helm-swoop
(el-get-bundle helm-swoop)
;; (require 'helm-swoop)
;; (global-unset-key (kbd "C-c h s"))
;; (global-set-key (kbd "C-c h s f") 'helm-swoop)
;; (global-set-key (kbd "C-c h s b") 'helm-swoop-back-to-last-point)
;; (global-set-key (kbd "C-c h s p") 'helm-multi-swoop)
;; (global-set-key (kbd "C-c h s l") 'helm-multi-swoop-all)

(provide 'init-helm)
;;; init-helm.el ends here
