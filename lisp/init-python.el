;; Package: python.el
(el-get-bundle python24)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(add-hook 'python-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)
             (setq default-tab-width 4)))

;; ElDoc
(add-hook 'python-mode-hook 'eldoc-mode)

;; Package: elpy
(el-get-bundle elpy)
(autoload 'elpy-enable "elpy" "enable elpy in all python buffers." t nil)
(autoload 'elpy-mode "elpy" "minor mode in python buffers." t nil)
(autoload 'elpy-use-ipython "elpy" "use ipython instead of python shell." t nil)

(provide 'init-python)
