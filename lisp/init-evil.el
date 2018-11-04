(require-package 'evil)
(require 'evil)
(evil-mode 0)
(setq evil-visual-state-cursor '(box "yellow")
      evil-insert-state-cursor '(bar "green")
      evil-normal-state-cursor '(hollow "cyan"))

(provide 'init-evil)
