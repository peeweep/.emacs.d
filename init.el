(setq package-archives
      '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(setq package-check-signature nil)

;; save custom to custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
;; install-pkg
(defun install-pkg (pkg)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

;; require-pkg
(defun require-pkg (pkg)
  (install-pkg pkg)
  (require pkg))

;; use-package
(require-pkg 'use-package)
(setq use-package-always-ensure t)

;; theme
;; setup dracula-theme
(use-package dracula-theme
  :init
  ;; Don't change the font size for some headings and titles (default t)
  (setq dracula-enlarge-headings nil)
  ;; Adjust font size of titles level 1 (default 1.3)
  (setq dracula-height-title-1 1.25)
  ;; Adjust font size of titles level 2 (default 1.1)
  (setq dracula-height-title-1 1.15)
  ;; Adjust font size of titles level 3 (default 1.0)
  (setq dracula-height-title-1 1.05)
  ;; Adjust font size of document titles (default 1.44)
  (setq dracula-height-doc-title 1.4)
  ;; Use less pink and bold on the mode-line and minibuffer (default nil)
  (setq dracula-alternate-mode-line-and-minibuffer t))
;; load theme
(if (display-graphic-p)
    (load-theme 'tsdh-light t)
  (load-theme 'dracula t))

;; hide menubar on terminal
(unless (display-graphic-p)
  (menu-bar-mode -1)
  )

;; ELPA keyring
(use-package gnu-elpa-keyring-update)

;; emacs-rime
(if (eq system-type 'gnu/linux)
    (use-package rime
      :custom
      (default-input-method "rime")
      (rime-show-candidate 'posframe)))

;; company
(use-package company
  :hook (after-init . global-company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0))

;; org-mode
(use-package org
  :init
  (setq org-startup-folded t)
  :pin gnu)

;; highlight current line
(global-hl-line-mode +1)

;; recover last location
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; format-all
(use-package format-all
  :bind ("C-c C-f" . format-all-buffer))

;; for YAML file
(require-pkg 'yaml-mode)

