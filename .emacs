;;; Package --- Summary
;;; Commentary:
;;; Code:

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
(setq-default explicit-shell-file-name "/bin/zsh")
(set-frame-font "Iosevka" nil t)
(setq auto-mode-alist
      (append '((".*\\.cppm\\'" . c++-mode))
              auto-mode-alist))

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Requirements
(unless (package-installed-p 'flycheck))
  (package-install 'flycheck)
(unless (package-installed-p 'gruber-darker-theme))
  (package-install 'gruber-darker-theme)
(unless (package-installed-p 'company-irony))
  (package-install 'company-irony)
(unless (package-installed-p 'irony))
  (package-install 'irony)
(unless (package-installed-p 'flycheck-irony))
  (package-install 'flycheck-irony)
(unless (package-installed-p 'evil)
  (package-install 'evil))
(unless (package-installed-p 'linum-relative))
  (package-install 'linum-relative)
(unless (package-installed-p 'magit))
  (package-install 'magit)
(unless (package-installed-p 'ef-themes))
  (package-install 'ef-themes)
;(unless (package-installed-p 'haskell-mode))
;  (package-install 'haskell-mode)
;(unless (package-installed-p 'markdown-mode))   - it breaks the config file
;  (Package-install 'markdown-mode)

(require 'ef-themes)
(ef-themes-load-random 'light)

(require 'company-irony)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(require 'irony)
;;(add-hook 'window-setup-hook 'delete-other-windows)
(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'flycheck)
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
 '(custom-safe-themes
   '("30b323c73d2b24c3eff96802f0085fbfef3c6d2aad03ddfb5f615b658b2d5bfa" "64204b9e3ad01000654d5524d2904fc8fa28aafc168f48660897ddfe36a2bfd5" "8e08bb8da358e2cf92e10e4bac47b025ccbcf4c70788cdbd67dc4ed11f786194" "4b026ac68a1aa4d1a91879b64f54c2490b4ecad8b64de5b1865bca0addd053d9" "21e3d55141186651571241c2ba3c665979d1e886f53b2e52411e9e96659132d4" "ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" default))
 '(package-selected-packages
   '(ef-themes irony flycheck linum-relative haskell-mode gruber-darker-theme flycheck-irony evil company-irony)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
