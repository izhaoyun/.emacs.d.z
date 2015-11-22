;; Package: yasnippet
(el-get-bundle yasnippet)

(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/el-get/yasnippet/snippets"))

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-yasnippet)
