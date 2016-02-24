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

;; Package: robe
(el-get-bundle robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; Package: yari
(el-get-bundle yari)
(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))
(add-hook 'ruby-mode-hook 'ri-bind-key)

(provide 'init-ruby)
;;; init-ruby.el ends here
