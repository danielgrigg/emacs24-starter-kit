(starter-kit-load "misc-recommended")
(starter-kit-load "python")
;;(starter-kit-load "scala")

(starter-kit-load "haskell")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")
(custom-set-variables '(haskell-tags-on-save t))
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(custom-set-variables
  '(haskell-process-type 'cabal-repl))
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

;(defun haskell-interactive-toggle-print-mode ()
  ;(interactive)
  ;(setq haskell-interactive-mode-eval-mode
        ;(intern
         ;(ido-completing-read "Eval result mode: "
                              ;'("fundamental-mode"
                                ;"haskell-mode"
                                ;"espresso-mode"
                                ;"ghc-core-mode"
                                ;"org-mode")))))
;(define-key haskell-interactive-mode-map (kbd "C-c C-v") 'haskell-interactive-toggle-print-mode)

;; cabal mode
;;(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; explicit compilation
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night t)

(setq ring-bell-function 'ignore)

