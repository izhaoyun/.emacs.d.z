(defconst utils-packages
  '(swiper
    hydra
    counsel
    ivy
    which-key
    avy
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

 
(provide 'setup-utils)
