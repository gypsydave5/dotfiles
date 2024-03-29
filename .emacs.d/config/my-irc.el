;;; my-irc.el --- settings for emacs irc clients
;;; Commentary:
;;; Code:

(setq rcirc-default-nick "gypsydave5")
(setq rcirc-default-user-name "gypsydave5")
(setq rcirc-default-full-name "David Wickes")

(setq rcirc-authinfo nil)
(setq *irc-libera-chat-password* "cradlecap")

(setq rcirc-authinfo '(("libera" 'nickserv "gypsydave5" "cradlecap")))

(setq rcirc-server-alist
      '(("irc.libera.chat" :port 6697 :encryption tls
	 :channels ("#emacs"))))

(setq rcirc-reconnect-delay 5)

(provide 'my-irc)
;;; my-irc.el ends here
