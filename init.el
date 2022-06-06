;; ======== Set user-emacs-directory variable =========
(setq user-emacs-directory (concat "~/.emacs.d/"
                               ;; (getenv "MY_EMACS_CONFIG")

				   ;; make sure DOOMDIR is set
				   "distributions/doomemacs"

				   ;; make sure SPACEMACSDIR is set
			           ;; "distributions/spacemacs"

                                   ;; my config - wip
                                   ;; "emacs"
                               "/"
                               )
    )

(setq my-shared-dir "~/.emacs.d/shared/")

(load-file (concat user-emacs-directory "init.el"))
(load-file (concat my-shared-dir "init.el"))
