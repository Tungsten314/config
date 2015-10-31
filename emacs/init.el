;; Packages
(load-file "~/.emacs.d/config/packages.el")

;; Load things
(load "mine-sweeper")
(load "two-mode-mode")

;; UI (theme, fonts, cursor, etc.)
(load-file "~/.emacs.d/config/interface.el")

;; Programming
(load-file "~/.emacs.d/config/code.el")

;; Autocomplete
(ac-config-default)

;; $PATH
(setq exec-path (append exec-path '("/usr/local/bin" "/usr/texbin")))
(setenv "PATH"
         (concat
          "/usr/texbin" ":" "/usr/local/bin" ":"
          (getenv "PATH")))

;; Turn on modes
(delete-selection-mode t)
(global-hl-line-mode t)
(tool-bar-mode -1)


;; Spellchecking
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq ispell-dictionary "en_CA")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; TeX/Asy
(load-file "~/.emacs.d/config/tex.el")

;; Save backup and autosave files to temporary-file-directory, not the current directory
(setq temporary-file-directory "~/tmp/emacs")
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; doc-view-mode
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq doc-view-continuous t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
