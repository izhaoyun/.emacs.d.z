;;; ubiquitous settings for programming



;; Package: company-quickhelp
;; (el-get-bundle company-quickhelp)
;; (add-hook 'company-mode-hook 'company-quickhelp-mode)

;; Yasnippet
;; Package: yasnippet
(el-get-bundle yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"
                         "~/.emacs.d/el-get/yasnippet/snippets"))
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)



;; Package: comment-dwim-2
(el-get-bundle comment-dwim-2)
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; Parenthesis


;; Package: smartparens

;; when you press RET, the curly braces automatically add another
;; newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)



;; Indentation


;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda ()
                (interactive)
                (setq show-trailing-whitespace 1)))

;; use space to indent by default

;; set appearance of a tab that is represented by 4 spaces




;; Version control
;; Package: magit
(el-get-bundle magit)


;; Package: avy
(el-get-bundle avy)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(avy-setup-default)

;; Package: projectile




;; Package: fill-column-indicator
(el-get-bundle fill-column-indicator)

;; Eldoc
(el-get-bundle init-eldoc)

;; Package: flycheck
(el-get-bundle flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)
;; Package: flycheck-pos-tip
(el-get-bundle flycheck-pos-tip)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; Package: restclient
(el-get-bundle restclient)
;; Package: company-restclient
(el-get-bundle company-restclient)
(add-to-list 'company-backends 'company-restclient)

(provide 'init-programming)
