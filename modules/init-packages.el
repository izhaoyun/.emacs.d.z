;;; init-packages.el --- initialize packages

;;; Commentary:

;;; Code:
(use-package undo-tree
  :defer 8
  :diminish undo-tree-mode
  :init
  (setq undo-tree-visualizer-diff       t)
  (setq undo-tree-visualizer-timestamps t)
  :config
  (global-undo-tree-mode))

(use-package expand-region
  :commands er/expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package window-numbering
  :defer 10
  :config
  (window-numbering-mode))

(use-package smart-mode-line
  :init
  (setq sml/them 'light)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package smartparens
  :defer 9
  :config
  (use-package smartparens-config :ensure nil)
  (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (add-hook 'emacs-lisp-mode-hook 'show-smartparens-mode))

(use-package helm
  :defer 2
  :init
  (global-unset-key (kbd "C-x c"))
  (setq helm-truncate-lines t)
  (setq helm-move-to-line-cycle-in-source t)
  :commands helm-recentf
  :bind 
  ("C-c h c" . helm-recentf)
  :config
  (bind-key "C-c h b" 'helm-mini)
  (bind-key "C-x C-b" 'helm-mini)
  (bind-key "C-c h a" 'helm-apropos)
  (bind-key "C-c h f" 'helm-find-files)
  (bind-key "C-c h e" 'helm-register)
  (bind-key "C-c h i" 'helm-info)
  (bind-key "C-c h m" 'helm-man-woman)
  ;; globally enable fuzzy matching for helm-mode
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t))

;; Package: helm-make
(use-package helm-make
  :defer 9
  :init
  (setq helm-make-completion-method 'ivy))

;; Package: swiper
(use-package counsel
  :defer 1
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (setq counsel-find-file-at-point t)
  :bind (("C-s" . swiper)
         ("C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-x C-f" . counsel-find-file)
         ("C-h K"   . counsel-descbinds)
         ("C-h S"   . counsel-info-lookup-symbol)
         ("C-h l"   . counsel-load-library)
         ("C-c s a" . counsel-ag)
         ("C-c s g" . counsel-git)
         ("C-c s p" . counsel-git-grep)
         ("C-c s l" . counsel-locate))
  :bind (:map help-map
              ("f" . counsel-describe-function)
              ("v" . counsel-describe-variable))
  :config
  (ivy-mode))

;; Hydra
(use-package hydra :defer 8)

;; Package: avy
(use-package avy
  :defer 3
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0)
         ("M-p" . avy-pop-mark))
  :init
  (avy-setup-default)
  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.8)
  :config
  (advice-add 'swiper :before 'avy-push-mark))

;; Package: ace-pinyin
(use-package ace-pinyin
  :defer 3
  :diminish ace-pinyin-mode
  :init
  (setq ace-pinyin-use-avy t)
  :config
  (ace-pinyin-global-mode))

;; Package: which-key
(use-package which-key
  :defer 1
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;; Package: yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :defer 2
  :commands yas-minor-mode
  :init
  (setq yas-verbosity 0)
  (setq yas-fallback-behavior 'return-nil)
  (setq yas-triggers-in-field t)
  (setq yas-snippet-dirs "~/.emacs.d/snippets")
  :config
  (define-key yas-minor-mode-map [(tab)] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (yas-global-mode))

;; Package: projectile
(use-package projectile
  :defer 1
  :init
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-global-mode))

;; Package: magit
(use-package magit
  :bind
  ("C-x g" . magit-status)
  :init
  (setq magit-completing-read-function 'ivy-completing-read))

;; Package: comment-dwim-2
(use-package comment-dwim-2
  :defer 2
  :bind
  ("M-;" . comment-dwim-2))

;; Package: company
(use-package company
  :defer 4
  :init
  (setq company-show-numbers t)
  :config
  ;; (progn
    ;; no need to enable company-mode globally. maybe it's better to
    ;; have more than one auto complete packages for different modes.
    ;; (global-company-mode)
    ;; )
  )

(use-package stickyfunc-enhance
  :defer 5
  :config
  (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
  (semantic-mode))

(provide 'init-packages)
;;; init-packages.el ends here
