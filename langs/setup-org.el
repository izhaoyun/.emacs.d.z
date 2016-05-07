(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (add-hook 'org-mode-hook 'init-org-bullets))

(defun init-org-bullets ()
  (use-package org-bullets
    :ensure org-plus-contrib
    :init
    (org-bullets-mode 1))
  )

(provide 'setup-org)
