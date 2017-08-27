(require-package 'evil)
(require 'evil)
(evil-mode 1)
(setq evil-visual-state-cursor '(box "yellow")
      evil-insert-state-cursor '((bar . 5) "green")
      evil-normal-state-cursor '(box "purple"))

(provide 'init-evil)
