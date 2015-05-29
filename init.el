(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))

; key binding
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

; function settings
(menu-bar-mode -1)

(delete-selection-mode t)

(show-paren-mode t)

(ido-mode 1)
(ido-everywhere 1)

; auto-complete doesn't work for now
;(require 'auto-complete-config)
;(ac-config-default)

; variable settings
(setq inhibit-startup-screen t)

(setq make-backup-files nil)

(setq auto-save-default nil)


(fset 'yes-or-no-p 'y-or-n-p)

