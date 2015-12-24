;;; ubiquitous settings for programming

;; Package: company
(el-get-bundle company)
(require 'company)
(setq company-show-numbers t)
(add-hook 'prog-mode-hook 'company-mode)

;; Package: company-quickhelp
(el-get-bundle company-quickhelp)
(add-hook 'company-mode-hook 'company-quickhelp-mode)

;; Yasnippet
;; Package: yasnippet
(el-get-bundle yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"
                         "~/.emacs.d/el-get/yasnippet/snippets"))
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; solving conflicts in company and yasnippet.
;; http://www.emacswiki.org/emacs/CompanyMode
(defun check-expansion ()
 (save-excursion
  (if (looking-at "\\_>") t
   (backward-char 1)
   (if (looking-at "\\.") t
    (backward-char 1)
    (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
 (let ((yas/fallback-behavior 'return-nil))
  (yas/expand)))

(defun tab-indent-or-complete ()
 (interactive)
 (if (minibufferp)
  (minibuffer-complete)
  (if (or (not yas/minor-mode)
       (null (do-yas-expand)))
   (if (check-expansion)
    (company-complete-common)
    (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

;; Package: comment-dwim-2
(el-get-bundle comment-dwim-2)
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; Parenthesis
(show-paren-mode 1)

;; Package: smartparens
(el-get-bundle smartparens)
(require 'smartparens-config)
(show-smartparens-global-mode t)
(smartparens-global-mode 1)
;; when you press RET, the curly braces automatically add another
;; newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;; Package: rainbow-delimiters
(el-get-bundle rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Indentation
(global-set-key (kbd "RET") 'newline-and-indent)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda ()
                (interactive)
                (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Package: clean-aindent
(el-get-bundle clean-aindent)
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(el-get-bundle dtrt-indent)
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: highlight-indentation
(el-get-bundle highlight-indentation)

;; Version control
;; Package: magit
(el-get-bundle magit)
(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/el-get/magit/Documentation/"))
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; Package: avy
(el-get-bundle avy)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(avy-setup-default)

;; Package: projectile
(el-get-bundle projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
;; Package: helm-projectile
(el-get-bundle helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; Package: ws-butler
(el-get-bundle ws-butler)
(require 'ws-butler)
(ws-butler-global-mode +1)

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
