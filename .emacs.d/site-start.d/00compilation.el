(use-package compile
  :custom
  (compilation-ask-about-save nil)
  (compilation-scroll-output t)
  :bind
  ("<f5>" . recompile)
  ("<f6>" . next-error))

(use-package ansi-color
  :hook
  (compilation-filter . ansi-color-compilation-filter))
