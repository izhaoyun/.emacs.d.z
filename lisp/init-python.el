(el-get-bundle python24)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i"
      python-indent-offset 4)

(el-get-bundle init-python)

;; ElDoc
(add-hook 'python-mode-hook 'eldoc-mode)

;; Package: elpy
(el-get-bundle elpy)
(add-hook 'python-mode-hook '(lambda ()
                               (elpy-enable)
                               (elpy-mode)
                               (setq elpy-rpc-backend "jedi")
                               (elpy-use-ipython)))

(provide 'init-python)
