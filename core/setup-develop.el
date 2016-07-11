(defconst devel-packages
  '(ws-butler
    yasnippet
    flycheck
    flycheck-pos-tip
    company
    company-quickhelp
    highlight-indentation
    )
  )

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
  (add-hook 'prog-mode-hook #'ws-butler-mode)
  )

(use-package yasnippet
  :commands (yas-reload-all
             yas-minor-mode)
  :init
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  )

(use-package highlight-indentation
  :diminish (highlight-indentation-mode
             highlight-indentation-current-column-mode)
  :init
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)
  :config
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
  )

(use-package flycheck
  :commands (flycheck-mode)
  :init
  (add-hook 'prog-mode-hook 'flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  )

(use-package flycheck-pos-tip
  :after flycheck
  :commands flycheck-pos-tip-mode
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-pos-tip-mode)
  ;; (flycheck-pos-tip-mode 1)
  )

(use-package company
  :commands (global-company-mode
             company-mode)
  :init
  (global-company-mode 1)
  ;; (setq company-global-modes
  ;;       '(not python-mode cython-mode sage-mode))
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command))
  ;; use company-mode with Clang
  (setq company-backends (delete 'company-semantic company-backends))
  )

(use-package company-yasnippet
  :ensure company
  :after yasnippet
  :commands company-yasnippet
  :bind
  ("C-<tab>" . company-yasnippet)
  )

(use-package company-quickhelp
  :commands company-quickhelp-mode
  :after company
  :init
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay nil)
  :bind (:map company-active-map
              ("M-h" . company-quickhelp-manual-begin)
              )
  )

(use-package eldoc
  :diminish eldoc-mode
  :init
  (add-hook 'prog-mode-hook #'eldoc-mode)
  )

(provide 'setup-develop)
