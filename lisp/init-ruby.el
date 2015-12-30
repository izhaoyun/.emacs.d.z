;; Package: inf-ruby
(el-get-bundle inf-ruby)
(require 'inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(inf-ruby-minor-mode +1)

;; Package: robe
(el-get-bundle robe)
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company '(push 'company-robe company-backends))
;; (TODO)keybinding

;; Package: bundler
(el-get-bundle bundler)
(require 'bundler)
;; (TODO)keybinding

;; Package: rbenv
(el-get-bundle rbenv)
(require 'rbenv)
(global-rbenv-mode)
(add-hook 'ruby-mode-hook (lambda () (rbenv-use-corresponding)))

;; Package: rvm
(el-get-bundle rvm)
(rvm-use-default)
(add-hook 'ruby-mode-hook (lambda () (rvm-activate-corresponding-ruby)))

;; Package: yard-mode
(el-get-bundle yard-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

;; eldoc support
(add-hook 'ruby-mode-hook 'eldoc-mode)

;; Package: company-inf-ruby
(el-get-bundle company-inf-ruby)
(eval-after-load 'company '(add-to-list 'company-backends 'company-inf-ruby))

;; Package: ruby-tools
(el-get-bundle ruby-tools)
(require 'ruby-tools)

(provide 'init-ruby)
