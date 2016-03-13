;;; init-swiper.el --- Swiper

;;; Commentary:

;;; Code:
;; Package: swiper
(el-get-bundle swiper)
(use-package counsel
  ;; https://github.com/jwiegley/use-package/issues/121
  :bind (("C-s" . swiper)               ; global-map
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-x C-f" . counsel-find-file)
         ("C-h K"   . counsel-descbinds)
         ("C-h S"   . counsel-info-lookup-symbol)
         ("C-h l"   . counsel-load-library)
         ("C-c s a" . counsel-ag)
         ("C-c s g" . counsel-git)
         ("C-c s j" . counsel-git-grep)
         ("C-c s l" . counsel-locate))
  :bind (:map help-map                  ; help-map
              ("f" . counsel-describe-function)
              ("v" . counsel-describe-variable))
  :init
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy))
  :config
  (progn
    (ivy-mode)))

(provide 'init-swiper)
;;; init-swiper.el ends here
