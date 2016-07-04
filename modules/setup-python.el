(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  :config
  )

(defun python/init-fill-column-indicator ()
  (use-package fill-column-indicator
    :init
    (fci-mode 1)
    )
  )
(add-hook 'python-mode-hook 'python/init-fill-column-indicator)

(defun python/init-anaconda-mode ()
  (use-package anaconda-mode
    :init
    (anaconda-mode 1)
    (anaconda-eldoc-mode 1)
    )

  (use-package company-anaconda
    :after company
    :init
    (eval-after-load "company"
      '(add-to-list 'company-backends 'company-anaconda))
    )
  )
(add-hook 'python-mode-hook 'python/init-anaconda-mode)

(use-package py-yapf
  :init
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save)
  )

(provide 'setup-python)
