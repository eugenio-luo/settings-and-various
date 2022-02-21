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

(add-hook 'window-setup-hook 'delete-other-windows)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("03e26cd42c3225e6376d7808c946f7bed6382d795618a82c8f3838cd2097a9cc" default))
 '(package-selected-packages
   '(gruber-darker-theme haskell-mode company-irony company flycheck-irony irony auto-complete linum-relative evil flycheck use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(package-initialize)

;; to reactivate flycheck ->
(global-flycheck-mode 1)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(evil-mode 1)

(linum-relative-global-mode)
(setq-default linum-relative-current-symbol "")

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(put 'upcase-region 'disabled nil)
