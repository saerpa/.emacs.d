(global-set-key (kbd "\C-x \C-r") 'recentf-open-files)
(global-set-key (kbd "<f2>") 'open-init-file) ; open init.el
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer) ; 缩进buffer

;; swiper
;;(global-set-key "\C-s" 'swiper)
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "C-h f") 'counsel-describe-function)
;;(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; company 
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; ace-jump-mode
;(define-key global-map (kbd "C-c j") 'ace-jump-char-mode)
;(define-key global-map (kbd "C-c p") 'ace-pinyin-jump-word)


