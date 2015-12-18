;; Package: graphviz-dot
(el-get-bundle graphviz-dot-mode)
(load-library "graphviz-dot-mode")
(define-key graphviz-dot-mode-map (kbd "C-c g p") 'graphviz-dot-preview)
(define-key graphviz-dot-mode-map (kbd "C-c g v") 'graphviz-dot-view)

;; Package: markdown-mode
(el-get-bundle markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Package: emmet-mode
(el-get-bundle emmet-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Package: yaml-mode
(el-get-bundle yaml-mode)

(provide 'init-others)
