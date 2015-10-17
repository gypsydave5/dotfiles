;; if (aspell installed) { use aspell } else if (hunspell installed) {
;; use hunspell } whatever spell checker I use, I always use English
;; dictionary I prefer use aspell because: 1. aspell is older 2. looks
;; Kevin Atkinson still get some road map for aspell: @see
;; http://lists.gnu.org/archive/html/aspell-announce/2011-09/msg00000.html
(defun flyspell-detect-ispell-args (&optional RUN-TOGETHER)
  "if RUN-TOGETHER is true, spell check the CamelCase words"
  (let (args)
      (setq args '("--sug-mode=ultra" "--lang=en_US"))
      (if RUN-TOGETHER
          (setq args (append args
                             '("--run-together"
                               "--run-together-limit=5"
                               "--run-together-min=2"))))
    args))

(cond
 ((executable-find "aspell")
  (setq ispell-program-name "aspell"))
 (t (setq ispell-program-name nil)))

;; ispell-cmd-args is useless, it's the list of *extra* arguments we
;; will append to the ispell process when "ispell-word" is called.
;; ispell-extra-args is the command arguments which will *always* be
;; used when start ispell process

(setq ispell-extra-args (flyspell-detect-ispell-args t))
(setq ispell-cmd-args (flyspell-detect-ispell-args))

(defun my-ispell-word (orig-fun &rest args)
  (let ((old-ispell-extra-args ispell-extra-args))
    (ispell-kill-ispell t)
    (setq ispell-extra-args (flyspell-detect-ispell-args))
    (apply orig-fun args)
    (setq ispell-extra-args old-ispell-extra-args)
    (ispell-kill-ispell t)))

(defun my-flyspell-auto-correct-word (orig-fun &rest args)
  (let ((old-ispell-extra-args ispell-extra-args))
    (ispell-kill-ispell t)
    (setq ispell-extra-args (flyspell-detect-ispell-args))
    (apply orig-fun args)
    (setq ispell-extra-args old-ispell-extra-args)
    (ispell-kill-ispell t)))

(advice-add 'flyspell-auto-correct-word
            :around 'my-flyspell-auto-correct-word)
(advice-add 'ispell-word
            :around 'my-ispell-word)

(provide 'my-spellchecker)
