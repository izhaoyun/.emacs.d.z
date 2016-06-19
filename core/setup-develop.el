(defconst devel-packages
  '(ws-butler
    yasnippet
    flycheck
    flycheck-pos-tip
    company
    company-quickhelp))

(install-pkgs devel-packages)

(setq vc-handled-backends nil)

(defun auto-fill-comments ()
  (auto-fill-mode 1)
  (setq comment-auto-fill-only-comments t)
  )
(add-hook 'prog-mode-hook 'auto-fill-comments)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)

(use-package ws-butler
  :diminish ws-butler-mode
  :commands ws-butler-mode
  :init
  (add-hook 'c-mode-common-hook 'ws-butler-mode)
  (add-hook 'python-mode-hook 'ws-butler-mode)
  (add-hook 'cython-mode-hook 'ws-butler-mode)
  )

(use-package yasnippet
  :commands (yas-reload-all
             yas-minor-mode)
  :init
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (use-package company-yasnippet
    :ensure company
    :commands company-yasnippet
    :bind
    ("C-<tab>" . company-yasnippet))
  )

(use-package flycheck
  :commands (global-flycheck-mode)
  :init
  (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  :config
  (use-package flycheck-pos-tip
    :init
    (flycheck-pos-tip-mode 1))
  )

(use-package company
  :commands (global-company-mode
             company-mode)
  :init
  (global-company-mode 1)
  (setq company-global-modes
        '(not python-mode cython-mode sage-mode))
  (use-package company-quickhelp
    :commands (company-quickhelp-mode)
    :init
    (company-quickhelp-mode 1)
    (setq company-quickhelp-delay nil)
    (define-key company-active-map (kbd "M-h")
      #'company-quickhelp-manual-begin))
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command))
  ;; use company-mode with Clang
  (setq company-backends (delete 'company-semantic company-backends))
  )

(use-package eldoc
  :diminish eldoc-mode
  :init
  (add-hook 'prog-mode-hook #'eldoc-mode)
  )

(provide 'setup-develop)
