(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "\C-x \C-x") 'recentf-open-files)
(global-set-key (kbd "s-/") 'hippie-expand)

(provide 'init-keybindings)
