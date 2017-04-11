(defvar best-gc-cons-threshold 4000000 "Best default gc threshold value. Should't be too big.")
;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold best-gc-cons-threshold)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(let ((file-name-handler-alist nil))
  (require 'init-elpa)
  (require 'init-ui)
  (require 'mode-line)
  (require 'init-preferences)
  (require 'hippie-exp)
  (require 'functions)
  (require 'init-keybindings)
  (require 'init-company)
  (require 'init-org)
  (require 'init-auctex)
  (require 'init-cal-china-x)
  (require 'init-python)
  (require 'init-notmuch))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (whiteboard))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
