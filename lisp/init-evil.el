
(require-package 'evil)
(require 'evil)
(evil-mode -1)
(setq evil-visual-state-cursor 'hbar)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor 'box)

(provide 'init-evil)
