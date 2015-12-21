(require 'ruby-mode)

;; Package: robe
(el-get-bundle robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; Package: Enhanced-Ruby-Mode
(el-get-bundle enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

;; Package: inf-ruby
(el-get-bundle inf-ruby)
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
;; Package: company-inf-ruby
(el-get-bundle company-inf-ruby)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))

(provide 'init-ruby)
