
(use-package jinx
  :hook (emacs-startup . global-jinx-mode)
  :bind (("M-$" . jinx-correct)
	 ("C-M-$" . jinx-languages)))

(setq jinx-languages "en_US")
(setq jinx-exclude-regexps
      '((emacs-lisp-mode "Package-Requires:.*$")
	(t "[A-Z]+\\>" "-\\>" "\\w*?[0-9]\\w*\\>" "[a-z]+://\\S-+" "<?[-+_.~a-zA-Z][-+_.~:a-zA-Z0-9]*@[-.a-zA-Z0-9]+>?" "\\(?:Local Variables\\|End\\):\\s-*$" "jinx-\\(?:languages\\|local-words\\):\\s-+.*$" "\\cc")))

(provide 'init-jinx)
