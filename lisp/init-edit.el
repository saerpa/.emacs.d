
(setq-default
 auto-window-vscroll nil
 make-backup-files nil
 next-line-add-newlines t
 auto-save-default nil
 isearch-allow-motion t
 isearch-lazy-count t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain)

(auto-save-visited-mode t)
(save-place-mode t)
(global-display-fill-column-indicator-mode -1)

(add-hook 'after-init-hook 'delete-selection-mode)
(add-hook 'after-init-hook 'global-auto-revert-mode)
(add-hook 'after-init-hook 'global-hl-line-mode)
(add-hook 'before-save-hook 'delete-trailing-lines)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package move-dup :ensure t :defer t
  :hook
  (after-init . global-move-dup-mode)
  :bind
  ("M-<up>" . 'move-dup-move-lines-up)
  ("M-<down>" . 'move-dup-move-lines-down)
  ("M-S-<up>" . 'move-dup-duplicate-up)
  ("M-S-<down>" . 'move-dup-duplicate-down))

(use-package iedit :ensure t :defer t
  :config
  (require 'iedit)

  :bind
  ("C-;" . 'iedit-mode))

(use-package pyim)
(use-package pyim-basedict)
(use-package posframe)

(setq default-input-method "pyim")
(setq pyim-page-style 'vertical)
(setq pyim-pinyin-fuzzy-alist nil)

(pyim-basedict-enable)
(pyim-default-scheme 'xiaohe-shuangpin)

(define-key pyim-mode-map "." 'pyim-page-next-page)
(define-key pyim-mode-map "," 'pyim-page-previous-page)

(use-package jinx
  :hook
  (emacs-startup . global-jinx-mode)
  :bind
  (("M-$" . jinx-correct)
   ("C-M-$" . jinx-languages)))

(setq jinx-languages "en_US")
(setq jinx-exclude-regexps
      '((emacs-lisp-mode "Package-Requires:.*$")
	(t "[A-Z]+\\>" "-\\>" "\\w*?[0-9]\\w*\\>" "[a-z]+://\\S-+" "<?[-+_.~a-zA-Z][-+_.~:a-zA-Z0-9]*@[-.a-zA-Z0-9]+>?" "\\(?:Local Variables\\|End\\):\\s-*$" "jinx-\\(?:languages\\|local-words\\):\\s-+.*$" "\\cc")))

(provide 'init-edit)
