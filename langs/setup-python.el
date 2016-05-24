(defun python/init-pyenv-mode ()
  (use-package pyenv-mode
    :init
    (pyenv-mode))
  )

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

(use-package python
  :mode ("\\.py$" . python-mode)
  :init
  (add-hook 'python-mode-hook 'python/init-pyenv-mode)
  (add-hook 'python-mode-hook 'python/init-complete))

(provide 'setup-python)
