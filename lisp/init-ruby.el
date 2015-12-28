;; Package: inf-ruby
(el-get-bundle inf-ruby)
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(inf-ruby-minor-mode +1)

;; Package: rvm.el
(el-get-bundle rvm)
(rvm-use-default)

;; Package: bundler.el
(el-get-bundle bundler)
(require 'bundler)

;; Package: robe
(el-get-bundle robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company '(push 'company-robe company-backends))

;; Package: yard-mode
(el-get-bundle yard-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

;; eldoc support
(add-hook 'ruby-mode-hook 'eldoc-mode)

;; Package: company-inf-ruby
(el-get-bundle company-inf-ruby)
(eval-after-load 'company '(add-to-list 'company-backends 'company-inf-ruby))

;; Package: rbenv.el
(el-get-bundle rbenv)
(require 'rbenv)
(global-rbenv-mode)

;; Package: ruby-tools
(el-get-bundle ruby-tools)
(require 'ruby-tools)

(provide 'init-ruby)
