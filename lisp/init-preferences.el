(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t) ;disable startup message
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8) ;set coding environment: utf-8
(setq make-backup-files nil) ;turn off make-backup-files
(setq auto-save-default nil) ;stop creating those #auto-saved# files
(fset 'yes-or-no-p 'y-or-n-p) ;less typing when Emacs ask you yes or no
(show-paren-mode 1)
(electric-pair-mode 1) ;auto close bracket insertion
(delete-selection-mode 1)
(global-auto-revert-mode 1) ;自动加载外部修改过的文件
(global-company-mode 1) ;enable company

(require 'recentf) ;enable recentf-mode
(recentf-mode 1)

(yas-global-mode 1) ;enable yas-global-mode

;; Emacs Dired mode 使用唯一一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;dired
(setq dired-listing-switches "-Al --si --time-style long-iso")
(setq dired-dwim-target t)

;;auto save abbrev
(setq save-abbrevs 'silently)

;; Mutt support.
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

;; ace jump mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-char-mode)

;; enable a more powerful jump back function from ace jump mode
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; enable rainbow-delimiters-mode
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(provide 'init-preferences)
