(add-hook 'rust-mode-hook 'cargo-minor-mode)

(require 'rust-mode)

(setq racer-cmd "~/.cargo/bin/racer")
;; Rustup binaries PATH
(setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")

;; Rust source code PATH
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

(setq company-tooltip-align-annotations t)
(provide 'my-rust)
;;; my-rust.el ends here
