(use-package tex-mode
  :commands latex-mode
  :config

  ;; AUCTEX
  (use-package tex
    :ensure auctex
    :commands TeX-PDF-mode
    :config
    (setq-default TeX-master nil))

  (TeX-PDF-mode)
  (outline-minor-mode))

(provide 'init-latex)
