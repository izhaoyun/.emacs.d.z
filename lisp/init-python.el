;; Package: elpy
(el-get-bundle elpy)
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(elpy-use-ipython)

(provide 'init-python)
