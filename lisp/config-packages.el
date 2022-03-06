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

(provide 'config-packages)
(require 'config-packages)
