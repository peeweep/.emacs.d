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

;; theme
(load-theme 'tsdh-light)

;; use-package
(require-pkg 'use-package)
(setq use-package-always-ensure t)

;; emacs-rime
(if (eq system-type 'gnu/linux)
    (use-package rime
      :custom
      (default-input-method "rime")
      (rime-show-candidate 'posframe)))

;; company
(require-pkg 'company)
(global-company-mode 1)

;; org-mode
(use-package org
  :pin gnu)

;; highlight current line
(global-hl-line-mode +1)

;; recover last location
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))
