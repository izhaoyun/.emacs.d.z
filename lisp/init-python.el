;; Package: python.el
(el-get-bundle python24)

(add-hook 'python-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)
             (setq default-tab-width 4)))

;; ElDoc
(add-hook 'python-mode-hook 'eldoc-mode)

;; Package: ropemacs
(el-get-bundle ropemacs)
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; Package: elpy
(el-get-bundle elpy)
(elpy-enable)
(when (executable-find "ipython")
  (elpy-use-ipython))

(provide 'init-python)
