(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))

(menu-bar-mode -1)

(delete-selection-mode t)

(show-paren-mode t)

(setq inhibit-startup-screen t)

(setq make-backup-files nil)

(setq auto-save-default nil)


(fset 'yes-or-no-p 'y-or-n-p)
