(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t) ;disable startup message
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8) ;set coding environment: utf-8
(setq make-backup-files nil) ;turn off make-backup-files
(setq auto-save-default nil) ;stop creating those #auto-saved# files
(fset 'yes-or-no-p 'y-or-n-p) ;less typing when Emacs ask you yes or no
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

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

;;dired
(setq dired-listing-switches "-Al --si --time-style long-iso")
(setq dired-dwim-target t)
