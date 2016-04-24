(use-package cl)
(use-package cl-lib)

(use-package auto-compile
  :config
  (auto-compile-on-load-mode))
;; https://github.com/itsjeyd/.emacs.d/blob/emacs24/init.el
(defun recompile-elisp-file ()
  (interactive)
  (when (and buffer-file-name (string-match "\\.el" buffer-file-name))
    (let ((byte-file (concat buffer-file-name "\\.elc")))
      (if (or (not (file-exists-p byte-file))
              (file-newer-than-file-p buffer-file-name byte-file))
          (byte-compile-file buffer-file-name)))))
(add-hook 'after-save-hook #'recompile-elisp-file)
(setq load-prefer-newer t)

(use-package dash
  :config
  (dash-enable-font-lock))

(use-package winner
  :config
  (winner-mode))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package expand-region
  :commands er/expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package window-numbering
  :init
  (window-numbering-mode))

(use-package undo-tree
  ;; :defer 8
  :diminish undo-tree-mode
  :init
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  :config
  (global-undo-tree-mode))

(use-package swiper
  ;;  :defer 1
  :ensure counsel
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

;; (use-package hydra)

(use-package which-key
  :defer 5
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package avy
  :defer 5
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

(use-package ace-pinyin
  :defer 7
  :diminish ace-pinyin-mode
  :init
  (setq ace-pinyin-use-avy t)
  :config
  (ace-pinyin-global-mode))

;;(use-package async
  ;; :defer 5
  ;; :config
  ;; (dired-async-mode 1)
  ;; (async-bytecomp-package-mode 1)
  ;;)

(use-package helm-config
  ;; :defer 6
  :ensure helm
  :init
  (setq helm-truncate-lines t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  :config
  )

(provide 'setup-utils)
