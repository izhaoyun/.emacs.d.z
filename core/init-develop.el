;; (defun init-company ()
;;   (use-package company
;;     :init
;;     (setq company-show-numbers t)
;;     (company-mode 1))
;; )

(defun init-auto-complete ()
  (use-package auto-complete-config
    :ensure auto-complete
    :init
    (ac-config-default)
    (auto-complete-mode))
  )
(add-hook 'emacs-lisp-mode-hook 'init-auto-complete)

(use-package magit
  :defer t
  :bind
  ("C-x g" . magit-status))
  
(defun init-comment ()
  ;; auto fill only comments
  (auto-fill-mode 1)
  (setq comment-auto-fill-only-comments t)

  (use-package comment-dwim-2
    :bind
    ("M-;" . comment-dwim-2))
  )
(add-hook 'prog-mode-hook 'init-comment)

(defun init-indent ()
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode nil)
  (global-set-key (kbd "RET") 'newline-and-indent)

  (use-package clean-aindent-mode
    :init
    (clean-aindent-mode 1))

  (use-package dtrt-indent
    :config
    (dtrt-indent-mode 1))

  (use-package indent-guide
    :diminish indent-guide-mode
    :init
    (indent-guide-global-mode))
  )
(add-hook 'prog-mode-hook 'init-indent)

(use-package ws-butler
  :diminish ws-butler-mode
  :init
  (ws-butler-mode))

(use-package yasnippet
  :commands yas-global-mode
  :init
  (yas-global-mode 1))

(defun init-flycheck ()
  (use-package flycheck
    :commands flycheck-mode
    :init
    (flycheck-mode)
    (setq flycheck-check-syntax-automatically
          '(mode-enabled save)))
  )
(add-hook 'prog-mode-hook 'init-flycheck)

(use-package projectile
  :diminish projectile-mode
  :commands projectile-global-mode
  :init
  (setq projectile-verbose nil)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-global-mode)
  )

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

(defun init-semantic-stickyfunc-enhance ()
  (use-package stickyfunc-enhance
    :init
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1))
  )

(provide 'init-develop)
