(use-package systemd-mode
  :ensure systemd
  :mode (("\\.service\\'" . conf-unix-mode)
         ("\\.timer\\'" . conf-unix-mode)
         ("\\.target\\'" . conf-unix-mode)
         ("\\.automount\\'" . conf-unix-mode)
         ("\\.mount\\'" . conf-unix-mode)
         ("\\.slice\\'" . conf-unix-mode)
         ("\\.socket\\'" . conf-unix-mode)
         ("\\.path\\'" . conf-unix-mode)
         ("\\.netdev\\'" . conf-unix-mode)
         ("\\.link\\'" . conf-unix-mode)
         ("\\.network\\'" . conf-unix-mode)
         ("\\.busname\\'" . conf-unix-mode)
         )
  )

(provide 'setup-shell)
