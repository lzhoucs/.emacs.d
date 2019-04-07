;; reference: https://dev.to/huytd/emacs-from-scratch-1cg6 https://gist.github.com/huytd/6b785bdaeb595401d69adc7797e5c22c

;; ==================== Boostrap =======================

;; Use emacs version specfic elpa location
(setq package-user-dir
      (locate-user-emacs-file (concat "elpa-" emacs-version)))

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

;; ==================== Emacs settings =======================
;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; Turn off autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

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
	evil-escape-excluded-major-modes '(magit-status-mode)
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

;; ====================== Helm Projectile ===========================

;; Helm
(use-package helm
  :config
  ;; enables Helm completion globally for any Emacs command. https://github.com/emacs-helm/helm/wiki#helm-mode
  (helm-mode)
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50)
  (setq helm-display-header-line nil)
  :bind (:map helm-find-files-map
	      ("C-h"         . helm-find-files-up-one-level)
	      ("C-j"         . helm-next-line)
	      ("C-k"         . helm-previous-line)
	      ("C-l"         . helm-execute-persistent-action)
	      )
  )

;;============== JavaScript Development ===============
(use-package vue-mode)
(use-package emmet-mode)
(use-package smartparens
  :hook ((vue-mode vue-mode) . smartparens-mode))
  ;; the following approach is recommended when the package name is the same as the mode to be hooked
  ;; :hook (vue-mode vue-mode))

;; ============== Other Packages ==============
(use-package magit)


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
  ;; "/"   '(counsel-rg :which-key "ripgrep") ; You'll need counsel package for this
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  "fs"  '(save-buffer :which-key "save buffer")
  "ff"  '(helm-find-files :which-key)
  "pf"  '(helm-find-file :which-key "find files")
  ;; Buffers
  "bb"  '(helm-buffers-list :which-key "buffers list")
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
