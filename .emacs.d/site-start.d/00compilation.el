;;; https://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html

(global-set-key (kbd "<f5>")        'recompile)
(global-set-key (kbd "<f6>")        'next-error)

(setq-default
 compilation-ask-about-save nil
 compilation-scroll-output t)

(require 'ansi-color)
(defun cc/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook 'cc/colorize-compilation)
