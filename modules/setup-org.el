(eval-and-compile
  (defun init-org-bullets ()
    "initialize org-bullets"
    (use-package org-bullets
      :ensure org-plus-contrib
      :init
      (org-bullets-mode 1))))

(use-package org
  :ensure nil
  :mode
  (("\\.org$" . org-mode)
   ("\\.txt$" . txt-mode))
  :bind
  (("C-c a" . org-agenda)
   ("C-c b" . org-iswitch)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link))
  :init
  (setq org-src-fontify-natively t)
  (add-hook 'org-mode-hook 'init-org-bullets)
  :config
  )

(provide 'setup-org)
