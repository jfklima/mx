;; (setq custom-file (make-temp-file "emacs-custom"))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "community" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
(setq use-package-always-ensure t
      use-package-compute-statistics t)

(require 'init-easy)
(require 'funcs)
(require 'ui)
(require 'init-multistate)
(require 'init-general)
(require 'init-which-key)
(require 'init-keybindings)
(require 'init-helm)
(require 'init-ido)
(require 'init-company)
(require 'init-util)
(require 'init-org)
(require 'init-magit)
(require 'init-projectile)
(require 'init-neotree)
(require 'init-telephone-line)
(require 'init-elisp-mode)
(require 'init-python-mode)

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))
