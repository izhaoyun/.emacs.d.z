;; user details
(setq user-full-name "Zhao Yun")
(setq user-mail-address "zjlyzhy@gmail.com")

;; initialize load paths
;; (defvar dotfiles-dir user-emacs-directory)
(setq dotfiles-dir (file-name-directory (or (buffer-file-name)
                                            load-file-name)))

;; packages repositories
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
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

(setq load-prefer-newer t)

(defun recompile-elisp-file ()
  (interactive)
  (when (and buffer-file-name (string-match "\\.el" buffer-file-name))
    (let ((byte-file (concat buffer-file-name "\\.elc")))
      (if (or (not (file-exists-p byte-file))
              (file-newer-than-file-p buffer-file-name byte-file))
          (byte-compile-file buffer-file-name)))))

(add-hook 'after-save-hook #'recompile-elisp-file)

;; basic settings
(add-to-list 'load-path (expand-file-name "core" dotfiles-dir))
(require 'setup-custom)
(require 'setup-utils)
(require 'init-develop)

;; langs settings
(add-to-list 'load-path (expand-file-name "langs" dotfiles-dir))
(require 'setup-org)
(require 'setup-cpp)
(require 'setup-ruby)
(require 'setup-python)
;;(require 'setup-go)

;;; init.el ends here
