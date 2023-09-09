
(setq-default
 dired-listing-switches "-alh"
 use-short-answers t)

(recentf-mode t)
(savehist-mode t)

(use-package exec-path-from-shell :ensure t :defer t)
(with-eval-after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE" "NIX_SSL_CERT_FILE" "NIX_PATH"))
    (add-to-list 'exec-path-from-shell-variables var)))

(when (or (memq window-system '(mac ns x pgtk))
          (unless (memq system-type '(ms-dos windows-nt))
            (daemonp)))
  (exec-path-from-shell-initialize))

(use-package icomplete
  :hook
  (after-init . fido-vertical-mode)
  :config
  (setq completions-detailed t))

(provide 'init-misc)
