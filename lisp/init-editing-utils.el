(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)

(set-cursor-color "#FF1999")

(show-paren-mode 1)

(require-package 'ace-pinyin)
(ace-pinyin-global-mode 1)

;;(global-set-key (kbd "C-.") 'set-mark-command)

(provide 'init-editing-utils)
