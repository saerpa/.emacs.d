
(tool-bar-mode 0)
(menu-bar-mode t)
(show-paren-mode t)
(global-hl-line-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(toggle-frame-maximized)
(setq inhibit-startup-message t)
(setq make-backup-files t)
(setq visible-bell t)
(add-hook 'before-save-hook 'delete-trailing-lines)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-misc)
