(require 'init-company)
(require 'ruby-mode)

;; Package: robe
(el-get-bundle robe)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; Package: Enhanced-Ruby-Mode
(el-get-bundle Enhanced-Ruby-Mode)

;; Package: inf-ruby
(el-get-bundle inf-ruby)
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(provide 'init-ruby)
