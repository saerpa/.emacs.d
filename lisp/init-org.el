
(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-hide-leading-stars t))

(setq my-org-file-root-dir "~/Org/")
(setq org-agenda-files (list (concat my-org-file-root-dir "Gtd/Todo.org")))
(setq org-capture-templates
      '(("d" "Diary" entry (file+datetree (lambda() (concat my-org-file-root-dir "/Diary/" (format-time-string "%Y.org"))))
	 "* %?\n%U")
        ("t" "Todo" entry (file+headline (lambda() (concat my-org-file-root-dir "Gtd/Todo.org")) "Todo")
	 "* TODO %?\n%U")))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (C . t)
     (python . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes)

  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))

(provide 'init-org)
