(defun init-anaconda-mode ()
  "Code navigation, documentation lookup and completion for
  Python."
  (use-package anaconda-mode
    :init
    (anaconda-mode))
  )

(use-package python
  :mode ("\\.py$" . python-mode)
  :config
  (add-hook 'python-mode-hook 'init-anaconda-mode)
  (add-hook 'python-mode-hook 'init-py-yapf))

(defun init-py-yapf ()
  "use yapf tool to tidy up the current buffer according to
  Python's PEP8."
  (use-package py-yapf
    :config
    (add-hook 'python-mode-hook 'py-yapf-enable-on-save))
  )

(defun init-live-py-mode ()
  (use-package live-py-mode
    :commands live-py-mode
    :init))

(provide 'setup-python)
