;;; init-ruby.el --- Ruby development

;;; Commentary:

;;; Code:
(el-get-bundle ruby-mode)

;; Package: inf-ruby
(el-get-bundle inf-ruby)
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; Package: rvm.el
(el-get-bundle rvm)
(rvm-use-default)

;; Package: robe-mode
(el-get-bundle robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; Package: yari
(el-get-bundle yari)
(autoload 'yari "yari" "" t nil)

(provide 'init-ruby)
;;; init-ruby.el ends here
