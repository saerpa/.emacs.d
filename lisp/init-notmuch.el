(require 'notmuch)

(autoload 'notmuch "notmuch" "notmuch mail" t)

(define-key notmuch-show-mode-map "S"
  (lambda ()
    "mark message as spam"
    (interactive)
    (notmuch-show-tag (list "+spam" "-inbox"))))

(define-key notmuch-show-mode-map "d"
  (lambda ()
    "toggle deleted tag for message"
    (interactive)
    (if (member "deleted" (notmuch-show-get-tags))
	(notmuch-show-tag (list "-deleted"))
      (notmuch-show-tag (list "+deleted")))))

(setq notmuch-search-oldest-first nil ;; defines the sort order
      message-sendmail-envelope-from 'header
      mail-specify-envelope-from 'header
      notmuch-show-all-multipart/alternative-parts nil
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "~/sh/msmtp-enqueue.sh"
      message-sendmail-f-is-evil nil
      mail-interactive t
      user-full-name "alex"
      user-mail-address "saerpa@163.com"
      message-kill-buffer-on-exit t
      mail-user-agent 'message-user-agent
      notmuch-always-prompt-for-sender t
      notmuch-fcc-dirs '((".*" . "sent"))
      notmuch-show-indent-messages-width 4)

(provide 'init-notmuch)
