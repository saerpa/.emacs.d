(global-set-key (kbd "\C-x \C-r") 'recentf-open-files)
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-;") 'iedit-mode)

;; swiper
(global-set-key "\C-s" 'swiper)

;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; pinyin-search
(global-set-key (kbd "C-c C-s") 'isearch-forward-pinyin)

(provide 'init-keybindings)
