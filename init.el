(setq package-archives
      '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ))
(package-initialize)
(setq package-check-signature nil)

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

;; RIME
(if (eq system-type 'gnu/linux)
    (use-package rime
      :custom
      (default-input-method "rime")
      (rime-show-candidate 'posframe))
  )

(use-package org
  :pin org
  :ensure org-plus-contrib)

