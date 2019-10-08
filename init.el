;; ======== Set user-emacs-directory variable =========
(setq user-emacs-directory (concat "~/.emacs.d/"
                               ;; (getenv "MY_EMACS_CONFIG")
                               ;; "doomemacs"
                               ;; "spacemacs"
                               "emacs"
                               "/"
                               )
    )

(load-file (concat user-emacs-directory "init.el"))
