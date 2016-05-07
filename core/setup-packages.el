(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(setq package-enable-at-startup nil)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package auto-compile
  :init
  (auto-compile-on-load-mode))

;; https://github.com/itsjeyd/.emacs.d/blob/emacs24/init.el
(defun recompile-elisp-file ()
  (interactive)
  (when (and buffer-file-name (string-match "\\.el" buffer-file-name))
    (let ((byte-file (concat buffer-file-name "\\.elc")))
      (if (or (not (file-exists-p byte-file))
              (file-newer-than-file-p buffer-file-name byte-file))
          (byte-compile-file buffer-file-name)))))
(add-hook 'after-save-hook #'recompile-elisp-file)
(setq load-prefer-newer t)

(provide 'setup-packages)
