(use-package python
  :mode ("\\.py$" . python-mode)
  :init
  (setq python-indent-offset 4)
  ;; (setq python-shell-interpreter "ipython")
  ;; (setq python-shell-interpreter-args "")
  ;; (setq python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
  ;; (setq python-shell-prompt-output-regexp  "Out\\[[0-9]+\\]: ")
  :config
  (use-package flycheck-pyflakes))

(defun python/init-pyenv-mode ()
  (use-package pyenv-mode
    :init
    (pyenv-mode 1))
  )
(add-hook 'python-mode-hook 'python/init-pyenv-mode)

(defun python/init-virtualenvwrapper ()
  (use-package virtualenvwrapper
    :commands (venv-initialize-eshell
               venv-initialize-interactive-shells)
    :init
    (venv-initialize-interactive-shells)
    (venv-initialize-eshell)
    :config
    (setq eshell-prompt-function
          (lambda () (concat venv-current-name " $ "))))
  )
(add-hook 'python-mode-hook 'python/init-virtualenvwrapper)

;; (defun python/init-sphinx-doc ()
;;   (use-package sphinx-doc
;;     :init
;;     (sphinx-doc-mode 1))
;;   )
;; (add-hook 'python-mode-hook 'python/init-sphinx-doc)

(defun python/init-complete ()
  (use-package anaconda-mode
    :init
    (anaconda-mode)
    (anaconda-eldoc-mode))
  (use-package company
    :init
    (setq company-show-numbers t)
    (company-mode 1))
  (use-package company-anaconda
    :init
    (eval-after-load 'company
      '(push 'company-anaconda company-backends)))
  )
(add-hook 'python-mode-hook 'python/init-complete)

(defun python/init-fill-column-indicator ()
  (use-package fill-column-indicator
    :init
    (fci-mode 1)))
(add-hook 'python-mode-hook 'python/init-fill-column-indicator)

(provide 'setup-python)
