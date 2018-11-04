(require-package 'deft)
(require 'deft)
(setq deft-extensions '("org" "txt"))
(setq deft-directory "~/Documents/OrgNotes")
(setq deft-recursive t)
(setq deft-extensions '("txt" "tex" "org" "md"))
(setq deft-directory "~/Documents/OrgNotes")
(setq deft-recursive t)
(setq deft-file-naming-rules '((noslash . "_")))
(setq deft-text-mode 'org-mode)
(setq deft-use-filter-string-for-filename t)
(setq deft-org-mode-title-prefix t)
(setq deft-use-filename-as-title nil)
(setq deft-strip-summary-regexp
      (concat "\\("
              "[\n\t]" ;; blank
              "\\|^#\\+[[:upper:]_]+:.*$" ;; org-mode metadata
              "\\|^#\\+[[:alnum:]_]+:.*$" ;; org-mode metadata
              "\\)"))

(provide 'init-deft)
