;;; init-helm.el --- Helm

;;; Commentary:

;;; Code:

;; Package: helm
(el-get-bundle helm)
(use-package helm
  :diminish helm-mode
  :defer 5
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
         ("C-x c SPC" . helm-all-mark-rings)))

;; Package: helm-swoop
(el-get-bundle helm-swoop)
(use-package helm-swoop
  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all))
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i")
      'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i")
      'helm-multi-swoop-all-from-helm-swoop)))

(provide 'init-helm)
;;; init-helm.el ends here
