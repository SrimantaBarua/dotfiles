;; Enable package management and add melpa
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Install and enable use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)

;; Use latest org mode
(use-package org
  :ensure t)
(require 'org)

;; Load org emacs config
(org-babel-load-file (expand-file-name "emacs_config.org" user-emacs-directory))
(garbage-collect)
