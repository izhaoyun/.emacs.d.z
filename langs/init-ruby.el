;;; init-ruby.el --- Ruby development

;;; Commentary:

;;; Code:
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$"       . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$"  . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$"       . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$"     . ruby-mode))

;; Package: inf-ruby
(el-get-bundle inf-ruby)
(require 'inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; Package: robe-mode
(el-get-bundle robe-mode)
(require 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; Package: yard-mode
(el-get-bundle yard-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

;; Package: ruby-block
(el-get-bundle ruby-block)
(require 'ruby-block)
(ruby-block-mode t)

;; Package: bundler
(el-get-bundle bundler)
(require 'bundler)

;; Package: rubocop
(el-get-bundle rubocop)
(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)

;; Package: yari
(el-get-bundle yari)
(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))
(add-hook 'ruby-mode-hook 'ri-bind-key)

(provide 'init-ruby)
;;; init-ruby.el ends here
