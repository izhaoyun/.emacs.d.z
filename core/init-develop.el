(defun init-company ()
  (use-package company
    :init
    (setq company-show-numbers t)
    (company-mode 1)
    )
)

(defun init-auto-complete ()
  (use-package auto-complete-config
    :ensure auto-complete
    :init
    (ac-config-default))
  )

;; (defun init-magit ()
(use-package magit
  :defer t
  :bind
  (("C-x g" . magit-status)
   ("C-x G" . magit-status-with-prefix)))
  ;; )

(defun init-comment-dwim-2 ()
  (use-package comment-dwim-2
    :bind
    ("M-;" . comment-dwim-2))
  )

(defun init-autofill-only-comments ()
  (auto-fill-mode 1)
  (setq comment-auto-fill-only-comments t)
  )

(defun init-clean-aindent-mode ()
  (use-package clean-aindent-mode
    :init
    (clean-aindent-mode 1))
  )

(defun init-dtrt-indent ()
  (use-package dtrt-indent
    :init
    (dtrt-indent-mode 1))
  )

(defun init-yafolding ()
  (use-package yafolding)
  )

(defun init-ws-butler ()
  (use-package ws-butler
    :diminish ws-butler-mode
    :init
    (ws-butler-mode))
  )

(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-global-mode)
  :config)

(defun init-highlight-indentation ()
  (use-package highlight-indentation
    :diminish (highlight-indentation-mode
               highlight-indentation-current-column-mode)
    :init
    (highlight-indentation-mode 1)
    (highlight-indentation-current-column-mode 1)
    :config
    (set-face-background 'highlight-indentation-face "#e3e3d3")
    (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))
  )

(defun init-semantic-stickyfunc-enhance ()
  (use-package stickyfunc-enhance
    :init
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1))
  )
  
(add-hook 'prog-mode-hook 'init-autofill-only-comments)
(add-hook 'prog-mode-hook 'init-comment-dwim-2)
(add-hook 'prog-mode-hook 'init-highlight-indentation)
(add-hook 'prog-mode-hook 'init-clean-aindent-mode)
(add-hook 'prog-mode-hook 'init-dtrt-indent)
(add-hook 'prog-mode-hook 'init-ws-butler)

(provide 'init-develop)
