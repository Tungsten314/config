;;; ~/.emacs.d/config/code.el: settings for programming

;; Indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset tab-width)
(setq cperl-indent-level tab-width)
(setq python-indent tab-width)

;; Don't softwrap
(set-default 'truncate-lines t)

;; Python
(setq python-shell-interpreter "python3")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Lisp
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Parentheses
(electric-pair-mode t)
(show-paren-mode t)
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match-face nil
                    :foreground "#268bd2"
                    :inverse-video nil
                    :underline t)
(set-face-attribute 'show-paren-mismatch-face nil
                    :foreground "#839496"
                    :background "#dc322f"
                    :inverse-video nil)
