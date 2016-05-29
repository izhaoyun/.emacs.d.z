(defconst utils-packages
  '(swiper
    hydra
    counsel
    ivy
    which-key
    avy
    ace-link
    ace-pinyin
    projectile
    flycheck
    magit
    ggtags
    ag
    yasnippet
    ))

(install-pkgs utils-packages)

(use-package swiper
  :ensure counsel
  :diminish ivy-mode
  :init
  (setq ivy-display-style 'fancy)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . counsel-grep-or-swiper)
   ("C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-x C-f" . counsel-find-file)
   ("C-h l"   . counsel-load-library)
   ("C-c s a" . counsel-ag)
   ("C-c s g" . counsel-git)
   ("C-c s i" . counsel-imenu)
   ("C-c s p" . counsel-git-grep)
   ("C-c s l" . counsel-locate)
   ("C-c s t" . counsel-tmm)
   ("C-c s r" . counsel-linux-app))
  :bind
  (:map help-map
        ("b" . counsel-descbinds)
        ("f" . counsel-describe-function)
        ("v" . counsel-describe-variable)
        ("s" . counsel-info-lookup-symbol))
  :init
  (ivy-mode))

(use-package hydra)

(use-package which-key
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

(use-package avy
  :bind
  (("C-:" . avy-goto-char)
   ("M-p" . avy-pop-mark))
  :commands avy-setup-default
  :init
  (avy-setup-default)
  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.8)
  (advice-add 'swiper :before 'avy-push-mark)
  :config
  (use-package ace-pinyin
    :diminish ace-pinyin-mode
    :commands ace-pinyin-global-mode
    :init
    (setq ace-pinyin-use-avy t)
    (ace-pinyin-global-mode))
  
  (use-package ace-link
    :init
    (ace-link-setup-default))
  )

(defhydra hydra-avy (:color pink)
  "
^Goto^                ^Copy/Move^               ^Others^
^^^---------------------------------------------------------
_c_: char            _y_: copy line            _q_: quit
_w_: word            _Y_: copy region
_l_: line            _m_: move line
_s_: subword         _M_: move region

"
  ("c" avy-goto-char)
  ("w" avy-goto-word-0)
  ("l" avy-goto-line)
  ("s" avy-goto-subword-0)
  ("y" avy-copy-line)
  ("Y" avy-copy-region)
  ("m" avy-move-line)
  ("M" avy-move-region)
  ("q" nil))
(global-set-key (kbd "M-g a") 'hydra-avy/body)

(use-package ggtags)

(use-package ag)

(use-package projectile
  :diminish projectile-mode
  :commands projectile-global-mode
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

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

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package flycheck
  :diminish flycheck-mode
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode)
  (setq flycheck-check-syntax-automatically
        '(mode-enabled save)))

;; (use-package server
;;   :ensure nil
;;   :defer t
;;   :config
;;   (unless (server-running-p)
;;     (server-start)))

(use-package ibuffer
  :ensure nil
  :bind
  ("C-x C-b" . ibuffer))

(use-package yasnippet
  :diminish yas-minor-mode
  :commands (yas-reload-all
	     yas-minor-mode)
  :init
  (yas-reload-all)
  :config
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(provide 'setup-utils)
