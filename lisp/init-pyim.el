
(use-package pyim)
(use-package pyim-basedict)
(use-package posframe)

(pyim-basedict-enable)
(setq default-input-method "pyim")
(pyim-default-scheme 'xiaohe-shuangpin)

(define-key pyim-mode-map "." 'pyim-page-next-page)
(define-key pyim-mode-map "," 'pyim-page-previous-page)

(provide 'init-pyim)
