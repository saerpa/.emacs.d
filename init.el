
(load "~/.emacs.d/configs/init-packages")
(load "~/.emacs.d/configs/init-better-defaults")
(load "~/.emacs.d/configs/init-ui")
(load "~/.emacs.d/configs/init-keybindings")
(load "~/.emacs.d/configs/init-org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-pinyin--jump-word-timeout 1)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.qq.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
