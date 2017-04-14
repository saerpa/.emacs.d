(global-set-key (kbd "\C-x \C-r") 'recentf-open-files)
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-;") 'iedit-mode)

;; neotree
(global-set-key [f8] 'neotree-toggle)

;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'init-keybindings)
