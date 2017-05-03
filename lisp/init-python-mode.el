(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
 		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'ein)
(require-package 'elpy)
(require-package 'py-autopep8)

(elpy-enable)
(setq elpy-rpc-python-command "python3")  ;; python3
;;(elpy-use-ipython)                        ;; ipython
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (when (maybe-require-package 'anaconda-mode)
;;   (after-load 'python
;;     (add-hook 'python-mode-hook 'anaconda-mode)
;;     (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
;;   (when (maybe-require-package 'company-anaconda)
;;     (after-load 'company
;;       (add-hook 'python-mode-hook
;;                 (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))


(provide 'init-python-mode)
