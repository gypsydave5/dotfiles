(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(use-package go-autocomplete
  :ensure t
  :defer t)

(use-package go-mode
  :ensure t
  :defer t)

(provide 'my-go)
