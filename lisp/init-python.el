;; Package: python.el
(el-get-bundle python24)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

;; Package: pymacs
(el-get-bundle pymacs)
(add-to-list 'load-path "~/.emacs.d/el-get/pymacs")
(require 'pymacs)
;; Package: ropemacs
(el-get-bundle ropemacs)
(setq pymacs-load-path '("~/.emacs.d/el-get/rope"
                         "~/.emacs.d/el-get/ropemacs"))
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(add-hook 'python-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)
             (setq default-tab-width 4)
             (ropemacs-mode)))

;; ElDoc
(add-hook 'python-mode-hook 'eldoc-mode)

;; Package: elpy
(el-get-bundle elpy)
(elpy-enable)
(when (executable-find "ipython")
  (elpy-use-ipython))

(provide 'init-python)
