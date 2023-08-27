
(use-package pyim)
(use-package pyim-basedict)
(use-package posframe)

(setq default-input-method "pyim")
(setq pyim-page-style 'vertical)

(pyim-basedict-enable)
(pyim-default-scheme 'xiaohe-shuangpin)

(define-key pyim-mode-map "." 'pyim-page-next-page)
(define-key pyim-mode-map "," 'pyim-page-previous-page)

(provide 'init-pyim)
