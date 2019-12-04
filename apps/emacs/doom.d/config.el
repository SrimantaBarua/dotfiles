;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq
 ;; UI
 doom-font (font-spec :family "SF Mono" :size 15)
 doom-format-on-save t
 ;; Company
 company-idle-delay 0
 company-minimum-prefix-length 1
 ;; Markdown
 markdown-command "markdown_py")

(add-to-list 'default-frame-alist '(fullscreen . maximized))
