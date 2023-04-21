
(require 'epa-file)
(epa-file-enable)
(setenv "GPG_AGENT_INFO" nil)

(use-package pinentry
  :config
  (setq epa-pinentry-mode 'loopback)
  (pinentry-start))

(provide 'init-epa-file)
