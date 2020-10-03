;; Character sets
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8) ;set coding environment: utf-8

;; specify font for all unicode characters
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))

(fset 'yes-or-no-p 'y-or-n-p) ;less typing when Emacs ask you yes or no

(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

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

;; Extra packages which don't require any configuration

(require-package 'gnuplot)
(require-package 'htmlize)

;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;; Variables configured via the interactive 'customize' interface
(when (file-exists-p custom-file)
  (load custom-file))

;; markdown-mode
(require-package 'markdown-mode)

;; emojify mode
(require-package 'emojify)
(add-hook 'after-init-hook #'global-emojify-mode)

(provide 'init-misc)
