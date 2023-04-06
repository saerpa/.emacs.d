
(use-package pangu-spacing)
(global-pangu-spacing-mode 1)

;; Insert whitespace in org-mode
(add-hook 'org-mode-hook
          '(lambda ()
             (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))

(provide 'init-pangu-spacing)
