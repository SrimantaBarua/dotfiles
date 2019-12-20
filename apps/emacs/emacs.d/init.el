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
;; (org-babel-load-file (expand-file-name "emacs_config.org" user-emacs-directory))

;; Load byte-compiled file generated from org config
(let ((of (expand-file-name "emacs_config.org" user-emacs-directory))
      (elf (expand-file-name "emacs_config.el" user-emacs-directory))
      (elcf (expand-file-name "emacs_config.elc" user-emacs-directory)))
  (unless (file-exists-p elcf)
    (org-babel-tangle-file of elf)
    (byte-compile-file elf))
  (load-file elcf))

(garbage-collect)
