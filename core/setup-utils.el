(use-package cl)
(use-package cl-lib)
(use-package dash)

(use-package recentf
  :commands recentf-mode
  :config
  (recentf-mode 1))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package winner
  :init
  (winner-mode))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package rainbow-delimiters
  :init
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
  (global-undo-tree-mode))

(use-package swiper
  ;;  :defer 1
  :ensure counsel
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (setq counsel-find-file-at-point t)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . counsel-grep-or-swiper)
   ("C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-x C-f" . counsel-find-file)
   ("C-h l"   . counsel-load-library)
   ("C-c s a" . counsel-ag)
   ("C-c s g" . counsel-git)
   ("C-c s i" . counsel-imenu)
   ("C-c s p" . counsel-git-grep)
   ("C-c s l" . counsel-locate)
   ("C-c s t" . counsel-tmm)            ; menubar
   ("C-c s r" . counsel-linux-app)      ; run linux app
   )
  :bind
  (:map help-map
        ("b" . counsel-descbinds)
        ("f" . counsel-describe-function)
        ("v" . counsel-describe-variable)
        ("s" . counsel-info-lookup-symbol))
  :init
  (ivy-mode))

(use-package hydra)

(defhydra hydra-buffer-menu (:color pink
                             :hint nil)
  "
^Mark^             ^Unmark^           ^Actions^          ^Search
^^^^^^^^-----------------------------------------------------------------
_m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch
_s_: save          _U_: unmark up     _b_: bury          _I_: isearch
_d_: delete        ^ ^                _g_: refresh       _O_: multi-occur
_D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only
_~_: modified
"
  ("m" Buffer-menu-mark)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))

(define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)

(use-package which-key
  :defer 3
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package avy
  :bind
  (("C-:" . avy-goto-char)
   ("M-p" . avy-pop-mark))
  :commands avy-setup-default
  :init
  (avy-setup-default)
  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.8)
  (advice-add 'swiper :before 'avy-push-mark))

(defhydra hydra-avy (global-map "M-g a")
  "Jump to things in Emacs tree-style.\n"
  ("j" avy-goto-char)
  ("J" avy-goto-char-2)
  ("w" avy-goto-word-0)
  ("W" avy-goto-word-1)
  ("l" avy-goto-line)
  ("c" avy-copy-line)
  ("C" avy-copy-region)
  ("m" avy-move-line)
  ("M" avy-move-region)
  ("q" nil)
  )

(use-package ace-pinyin
  :diminish ace-pinyin-mode
  :commands ace-pinyin-global-mode
  :init
  (setq ace-pinyin-use-avy t)
  (ace-pinyin-global-mode))

(use-package ace-link
  :init
  (ace-link-setup-default))

(provide 'setup-utils)
