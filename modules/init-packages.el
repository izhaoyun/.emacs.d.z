;;; init-packages.el --- initialize packages

;;; Commentary:

;;; Code:
;; Package: undo-tree
(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init
  (progn
    (setq undo-tree-visualizer-diff       t)
    (setq undo-tree-visualizer-timestamps t))
  :config
  (progn (global-undo-tree-mode)))

;; Package: expand-region
(use-package expand-region
  :defer t
  :bind ("C-=" . er/expand-region))

;; Package: window-numbering
(use-package window-numbering
  :defer t
  :init
  (window-numbering-mode))

;; Package: smart-mode-line
(use-package smart-mode-line
  :defer t
  :init
  (progn
    (setq sml/them 'light)
    (setq sml/no-confirm-load-theme t)
    (sml/setup)))

;; Package: rainbow-delimiters
(use-package rainbow-delimiters
  :init
  (add-hook 'org-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Package: smartparens
;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org#smartparens-mode
(use-package smartparens
  :init
  (progn
    (require 'smartparens-config)
    (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-smartparens-mode)))

;; Package: chinese-fonts-setup
;; (use-package chinese-fonts-setup
;;   :defer t
;;   :config
;;   (progn
;;      (setq cfs-profiles '("org-mode" "program"))
;;      (setq cfs--current-profile-name "org-mode")
;;      (setq cfs--custom-set-fontsizes '(10 12.5 12.5))
;;      (setq cfs--fontsize-steps (quote (2 3 4)))))

;; Package: helm
(use-package helm
  :diminish helm-mode
  :defer t
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0
          helm-input-idle-delay 0.01
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
(use-package helm-swoop
  :defer t
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

;; Package: swiper
(use-package counsel
  ;; https://github.com/jwiegley/use-package/issues/121
  :bind (("C-s" . swiper)               ; global-map
         ("C-r" . ivy-resume)
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

;; Package: hydra
(use-package hydra
  :init
  (progn
    (require 'hydra)
    (setq hydra--work-around-dedicated nil))
  :config
  (hydra-add-font-lock))

;; Package: which-key
(use-package which-key)

;; Package: avy
(use-package avy
  :defer t
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0)
         ("M-p" . avy-pop-mark))
  :init
  (progn
    (avy-setup-default)
    (setq avy-all-windows nil)
    (setq avy-timeout-seconds 0.8))
  :config
  (advice-add 'swiper :before 'avy-push-mark))

;; Package: yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :defer t
  :init
  (progn
    (setq yas-verbosity 0)
    (setq yas-fallback-behavior 'return-nil)
    (setq yas-triggers-in-field t)
    (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets/"))))
  :config
  (progn
    (define-key yas-minor-mode-map [(tab)] nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (yas-global-mode)))

;; Package: projectile
(use-package projectile
  :defer t
  :init
  (progn
    (setq projectile-enable-caching t)
    (setq projectile-completion-system 'ivy)
    (setq projectile-indexing-method 'alien)
    (projectile-global-mode)))

;; Package: magit
(use-package magit
  :defer t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

;; Package: comment-dwim-2
(use-package comment-dwim-2
  :bind ("M-;" . comment-dwim-2))

;; Package: company
(use-package company
  :defer t
  :config (global-company-mode))

(provide 'init-packages)
;;; init-swiper.el ends here
