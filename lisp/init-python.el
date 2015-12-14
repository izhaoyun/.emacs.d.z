;; Package: python.el
(el-get-bundle python24)

;; ElDoc
(add-hook 'python-mode-hook 'eldoc-mode)

;; Package: pymacs
(el-get-bundle pymacs)
(add-to-list 'load-path "~/.emacs.d/el-get/pymacs")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

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
