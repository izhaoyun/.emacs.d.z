;;; init-ruby.el --- Ruby development

;;; Commentary:

;;; Code:
;; Package: bundler
(el-get-bundle bundler)
(require 'bundler)

;; Package: inf-ruby
(el-get-bundle inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(inf-ruby-minor-mode +1)

(provide 'init-ruby)
;;; init-ruby.el ends here
