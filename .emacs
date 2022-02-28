(setq inhibit-startup-screen t)
(setq pop-up-frames 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)
(column-number-mode 1)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(set-face-attribute 'default nil :height 240)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(defvaralias 'c-basic-offset 'tab-width)
(electric-pair-mode 1)
(setq-default electric-pair-preserve-balance nil)
(setq-default explicit-shell-file-name "/bin/bash")
(set-frame-font "Iosevka" nil t)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Requirements
;;(unless (package-installed-p 'flycheck))
;;  (package-install 'flycheck)
;;(unless (package-installed-p 'gruber-darker-theme))
;;  (package-install 'gruber-darker-theme)
;;(unless (package-installed-p 'company-irony))
;;  (package-install 'company-irony)
;;(unless (package-installed-p 'irony))
;;  (package-install 'irony)
;;(unless (package-installed-p 'flycheck-irony))
;;  (package-install 'flycheck-irony)
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))
;;(unless (package-installed-p 'linum-relative))
;;  (package-install 'linum-relative)

(require 'company-irony)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(require 'irony)
(add-hook 'window-setup-hook 'delete-other-windows)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'flycheck)
(global-flycheck-mode 1)
(global-flycheck-mode 1)

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(put 'upcase-region 'disabled nil)


(require 'evil)
(evil-mode 1)

(require 'linum-relative)
(linum-relative-global-mode)
(setq-default linum-relative-current-symbol "")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(package-selected-packages '(linum-relative irony gruber-darker-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
