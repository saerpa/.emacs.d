(fset 'yes-or-no-p 'y-or-n-p) ;less typing when Emacs ask you yes or no
(yas-global-mode 1) ;enable yas-global-mode

(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; Emacs Dired mode 使用唯一一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;auto save abbrev
(setq save-abbrevs 'silently)

;; Mutt support.
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

(require-package 'evil)
(require 'evil)
(evil-mode 1)
(setq evil-visual-state-cursor 'hbar)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor 'box)

(provide 'init-misc)
