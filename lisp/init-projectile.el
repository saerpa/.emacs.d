
(use-package projectile
  :config
  (projectile-mode t)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(provide 'init-projectile)
