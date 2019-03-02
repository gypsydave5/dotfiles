;;; my-irc.el --- settings for emacs irc clients
;;; Commentary:
;;; Code:

(setq rcirc-default-nick "gypsydave5")
(setq rcirc-default-user-name "gypsydave5")
(setq rcirc-default-full-name "David Wickes")

(setq rcirc-authinfo nil)
(add-to-list 'rcirc-authinfo (list "freenode" 'nickserv "gypsydave5" (getenv "IRC_PASSWORD")))

(provide 'my-irc)
;;; my-irc.el ends here
