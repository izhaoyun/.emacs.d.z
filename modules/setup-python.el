(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (setq python-indent-offset 4)
  :config
  (use-package flycheck-pyflakes))

(defun python/init-pyenv-mode ()
  (use-package pyenv-mode
    :init
    (pyenv-mode 1))
  )
(add-hook 'python-mode-hook 'python/init-pyenv-mode)

(defun python/init-nose ()
  (use-package nose
    :commands
    :init
    :config
    (add-to-list 'nose-project-root-files "setup.cfg")
    (setq nose-use-verbose nil))
  )

(defun python/init-virtualenvwrapper ()
  (use-package virtualenvwrapper
    :commands (venv-initialize-eshell
               venv-initialize-interactive-shells)
    :init
    (venv-initialize-interactive-shells)
    (venv-initialize-eshell)
    (require 'eshell)
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
    :commands (anaconda-mode
               anaconda-eldoc-mode)
    :init
    (anaconda-mode 1)
    (anaconda-eldoc-mode 1))
  (use-package company
    :init
    (company-mode 1)
    :config
    (setq company-show-numbers t))
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
