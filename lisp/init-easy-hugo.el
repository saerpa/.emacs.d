(require-package 'easy-hugo)

(setq easy-hugo-basedir "~/Blog/saerpa/")
(setq easy-hugo-url "https://saerpa/")
(setq easy-hugo-sshdomain "saerpa.coding.me")
(setq easy-hugo-root "~/Blog/saerpa/")
(setq easy-hugo-previewtime "300")

;;(setq easy-hugo-default-ext ".org")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)

(provide 'init-easy-hugo)
