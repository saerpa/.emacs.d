(require-package 'company-statistics)

(global-company-mode 1)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)

(when (maybe-require-package 'company)
  (add-hook 'eval-after-init-hook 'global-company-mode)
  (add-hook 'eval-after-init-hook 'company-statistics-mode)
  (setq-default company-backends '((company-capf company-dabbrev-code) company-dabbrev)
		company-dabbrev-other-buffers 'all))

(when (maybe-require-package 'company-quickhelp)
  (add-hook 'eval-after-init-hook 'company-quickhelp-mode))

(defun local-push-company-backend (backend)
  "Add BACKEND to a buffer-local version of `company-backends'."
  (set (make-local-variable 'company-backends)
       (append (list backend) company-backends)))


;; {{ setup company-ispell
(defun toggle-company-ispell ()
  (interactive)
  (cond
   ((memq 'company-ispell company-backends)
    (setq company-backends (delete 'company-ispell company-backends))
    (message "company-ispell disabled"))
   (t
    (add-to-list 'company-backends 'company-ispell)
    (message "company-ispell enabled!"))))

(defun company-ispell-setup ()
  ;; @see https://github.com/company-mode/company-mode/issues/50
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends)
    (add-to-list 'company-backends 'company-ispell)
    ;; https://github.com/redguardtoo/emacs.d/issues/473
    (if (and (boundp 'ispell-alternate-dictionary)
             ispell-alternate-dictionary)
        (setq company-ispell-dictionary ispell-alternate-dictionary))))

;; message-mode use company-bbdb.
;; So we should NOT turn on company-ispell
(add-hook 'org-mode-hook 'company-ispell-setup)
;; }}


(provide 'init-company)
