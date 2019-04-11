;; reference: https://dev.to/huytd/emacs-from-scratch-1cg6 https://gist.github.com/huytd/6b785bdaeb595401d69adc7797e5c22c

;; ==================== Boostrap =======================

;; Use emacs version specfic elpa location
(setq package-user-dir
      (locate-user-emacs-file (concat "elpa-" emacs-version)))

;; Customize custom file
(setq custom-file
      (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(require 'subr-x)

;; Load external code
(load-file (locate-user-emacs-file "spacemacs/functions.el"))
(load-file (locate-user-emacs-file "functions/javascript.el"))
;; ==================== Emacs settings =======================
;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; Turn off autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

(fset 'yes-or-no-p 'y-or-n-p)
(setq initial-scratch-message "")
(toggle-frame-maximized)
(global-display-line-numbers-mode)

;; ==================== Theme =========================

;; Theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; ==================== Evil ==========================
;; Evil mode
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-escape
  :init
  (setq evil-escape-excluded-states '(visual
				      ;; normal multiedit emacs motion
				      )
	evil-escape-excluded-major-modes '(magit-status-mode magit-log-mode)
        evil-escape-key-sequence "jj"
        evil-escape-delay 0.20)
  :config
  (evil-escape-mode)
  )
;; evil-magit
(use-package evil-magit)
;; evil-collection
; (use-package evil-collection
;   :after evil
;   :config
;   (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;; ====================== Helm Projectile ===========================

;; Helm
(use-package helm
  :config
  ;; enables Helm completion globally for any Emacs command. https://github.com/emacs-helm/helm/wiki#helm-mode
  (helm-mode)
  (helm-autoresize-mode 1)
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-display-header-line nil)
  :bind (:map helm-find-files-map
	      ("C-h"         . helm-find-files-up-one-level)
	      ("C-j"         . helm-next-line)
	      ("C-k"         . helm-previous-line)
	      ("C-l"         . helm-execute-persistent-action)
	      )
  )

;; Projectile
(use-package projectile
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; Helm Projectile
(use-package helm-projectile
  :init
  (setq helm-projectile-fuzzy-match t)
  :config
  (helm-projectile-on))

;;============== JavaScript Development ===============
(use-package highlight-parentheses
  :config
  :hook ((prog-mode vue-mode) . highlight-parentheses-mode))

(use-package smartparens
  :hook ((prog-mode vue-mode) . smartparens-mode))

(use-package editorconfig
  :config
  (editorconfig-mode 1)
  (add-to-list 'editorconfig-indentation-alist
            '(vue-mode css-indent-offset
  		       js-indent-level
  		       sgml-basic-offset
  		       ssass-tab-width)
  	    )
  )

(use-package flycheck
  :init
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;; Note: this is part of :init, not :config
  (global-flycheck-mode)
  ;; not regular usage of :hook, I know
  :hook ((flycheck-mode) . my/use-eslint-from-node-modules)
  )

(use-package yasnippet-snippets)
(use-package yasnippet
  :config (yas-global-mode 1)
  )

(use-package vue-mode)

(use-package emmet-mode
  :hook (vue-mode vue-mode))

(use-package js2-mode
  ;; https://github.com/jwiegley/use-package#modes-and-interpreters
  :mode "\\.js\\'"
  )

(add-hook 'prog-mode-hook #'hs-minor-mode)
;; ============== Other Packages ==============
(use-package magit)
(use-package helm-rg)


;; ============= Key Bindings =================
;; Which Key
(use-package which-key
  :init
  (setq which-key-idle-delay .4)
  :config
  (which-key-mode))

;; Other packages
(use-package vimrc-mode)
;; Custom keybinding
(use-package general
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(helm-projectile-rg :which-key)
  "TAB" '(spacemacs/alternate-buffer :which-key)
  "SPC" '(helm-M-x :which-key)
  "cl"  '(comment-line :which-key)
  "fs"  '(save-buffer :which-key)
  "ff"  '(helm-find-files :which-key)
  "pb"  '(helm-projectile-switch-to-buffer :which-key)
  "pf"  '(helm-projectile-find-file :which-key)
  "pp"  '(helm-projectile-switch-project :which-key)
  ;; Buffers
  "bb"  '(helm-buffers-list :which-key)
  "bd"  '(kill-this-buffer :which-key)
  "qq"  '(save-buffers-kill-terminal :which-key)
  ;; magit
  "g"  '(magit-status :which-key)
  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")
  ;; Others
  "at"  '(ansi-term :which-key "open terminal")
  )
)
 
;; Fancy titlebar for MacOS
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (etq ns-use-proxy-icon  nil)
;; (setq frame-title-format nil)
