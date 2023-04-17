(deftheme salmon-dragon
  "Created 2023-04-15.")

(custom-theme-set-faces
 'salmon-dragon
 ;  Command for available fonts >> fc-list -f "%{fullname} : %{foundry} : %{family}\n"
 '(default ((t (:family "Fira Code Medium"
                :foundry "CTDB" 
                :width normal 
                :height 150 
                :weight normal 
                :slant normal 
                :underline nil 
                :overline nil 
                :extend nil 
                :strike-through nil 
                :box nil 
                :inverse-video nil 
                :foreground "white" 
                :background "#17151A" 
                :stipple nil 
                :inherit nil))))

           ;Backgoround in Light Theme
 '(fringe ((((class color) (background light))
            (:background "grey95"))     

           ;Backgoround in Dark Theme
           (((class color) (background dark))
            (:background "#17151A")) 

           ;Backgoround in other cases
           (t (:background "gray"))))

           ;Backgoround in Light Theme
 '(cursor ((((background light))
            (:background "black"))

           ;Backgoround in Dark Theme
           (((background dark))
            (:background "white"))))

                      ;Backgoround in Light Theme
 '(minibuffer-prompt ((((background light))
                       (:foreground "cyan"
                        :background "red")) 

                      ;Backgoround in Dark Theme
                      (((background dark))
                       (:foreground "#FEC900"))

                      ;Backgoround in other cases
                      (t (:foreground "medium blue"))))

 '(mode-line ((((supports :box t))
	       (:height 180 
		:family "Cartograph CF Thin"
		:weight thin 
		:foreground "#BCBEC9"
		:background "#252436"
		:box (:line-width (9 . 8)
		      :color "#252436")
		:slant normal 
		:inverse-video nil))))

 '(mode-line-inactive ((((supports :box t))
	       (:height 180 
		:family "Cartograph CF Thin"
		:weight thin 
		:foreground "#BCBEC9"
		:background "#313141"
		:box (:line-width (9 . 8)
		      :color "#313141")
		:slant normal 
		:inverse-video nil))))

 '(highlight ((((class color) (min-colors 88) (background light))
	       (:background "darkseagreen2"))
	      (((class color) (min-colors 88) (background dark))
	       (:foreground "white"
		:background "#5343B6"
	        :box (:line-width (5 . 5) :color "#5343B6" :style released-button)))
	      (((class color) (min-colors 16) (background light))
	       (:background "darkseagreen2"))
	      (((class color) (min-colors 16) (background dark))
	       (:background "darkolivegreen"))
	      (((class color) (min-colors 8))
	       (:foreground "black" :background "green"))
	      (t (:inverse-video t))))

; '(mode-line-buffer-id ((t (:height 180 :weight thin))))
; '(mode-line-emphasis ((t (:height 180 :weight thin))))
; '(mode-line-highlight ((((supports :box t) (class color) (min-colors 88)) (:box (:line-width (20 . 20) :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 ;'(fixed-pitch ((t (:family "Monospace"))))
 ;'(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 ;'(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 ;'(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 ;'(region ((((class color) (min-colors 88) (background dark)) (:extend t :background "blue3")) (((class color) (min-colors 88) (background light) (type gtk)) (:extend t :background "gtk_selection_bg_color" :distant-foreground "gtk_selection_fg_color")) (((class color) (min-colors 88) (background light) (type ns)) (:extend t :background "ns_selection_bg_color" :distant-foreground "ns_selection_fg_color")) (((class color) (min-colors 88) (background light)) (:extend t :background "lightgoldenrod2")) (((class color) (min-colors 16) (background dark)) (:extend t :background "blue3")) (((class color) (min-colors 16) (background light)) (:extend t :background "lightgoldenrod2")) (((class color) (min-colors 8)) (:extend t :foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:extend t :background "gray"))))
 ;'(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 ;'(secondary-selection ((((class color) (min-colors 88) (background light)) (:extend t :background "yellow1")) (((class color) (min-colors 88) (background dark)) (:extend t :background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:extend t :background "yellow")) (((class color) (min-colors 16) (background dark)) (:extend t :background "SkyBlue4")) (((class color) (min-colors 8)) (:extend t :foreground "black" :background "cyan")) (t (:inverse-video t))))
 ;'(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 ;'(font-lock-builtin-face ((((class grayscale) (background light)) (:weight bold :foreground "LightGray")) (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "dark slate blue")) (((class color) (min-colors 88) (background dark)) (:foreground "LightSteelBlue")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue")) (((class color) (min-colors 8)) (:weight bold :foreground "blue")) (t (:weight bold))))
 ;'(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 ;'(font-lock-comment-face ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "DimGray")) (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "LightGray")) (((class color) (min-colors 88) (background light)) (:foreground "Firebrick")) (((class color) (min-colors 88) (background dark)) (:foreground "chocolate1")) (((class color) (min-colors 16) (background light)) (:foreground "red")) (((class color) (min-colors 16) (background dark)) (:foreground "red1")) (((class color) (min-colors 8) (background light)) (:foreground "red")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow")) (t (:slant italic :weight bold))))
 ;'(font-lock-constant-face ((((class grayscale) (background light)) (:underline (:color foreground-color :style line) :weight bold :foreground "LightGray")) (((class grayscale) (background dark)) (:underline (:color foreground-color :style line) :weight bold :foreground "Gray50")) (((class color) (min-colors 88) (background light)) (:foreground "dark cyan")) (((class color) (min-colors 88) (background dark)) (:foreground "Aquamarine")) (((class color) (min-colors 16) (background light)) (:foreground "CadetBlue")) (((class color) (min-colors 16) (background dark)) (:foreground "Aquamarine")) (((class color) (min-colors 8)) (:foreground "magenta")) (t (:underline (:color foreground-color :style line) :weight bold))))
 ;'(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 ;'(font-lock-doc-markup-face ((t (:inherit (font-lock-constant-face)))))
 ;'(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "Blue1")) (((class color) (min-colors 88) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 16) (background light)) (:foreground "Blue")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 8)) (:weight bold :foreground "blue")) (t (:weight bold :inverse-video t))))
 ;'(font-lock-keyword-face ((((class grayscale) (background light)) (:weight bold :foreground "LightGray")) (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "Purple")) (((class color) (min-colors 88) (background dark)) (:foreground "Cyan1")) (((class color) (min-colors 16) (background light)) (:foreground "Purple")) (((class color) (min-colors 16) (background dark)) (:foreground "Cyan")) (((class color) (min-colors 8)) (:weight bold :foreground "cyan")) (t (:weight bold))))
 ;'(font-lock-negation-char-face ((t nil)))
 ;'(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 ;'(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 ;'(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 ;'(font-lock-string-face ((((class grayscale) (background light)) (:slant italic :foreground "DimGray")) (((class grayscale) (background dark)) (:slant italic :foreground "LightGray")) (((class color) (min-colors 88) (background light)) (:foreground "VioletRed4")) (((class color) (min-colors 88) (background dark)) (:foreground "LightSalmon")) (((class color) (min-colors 16) (background light)) (:foreground "RosyBrown")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon")) (((class color) (min-colors 8)) (:foreground "green")) (t (:slant italic))))
 ;'(font-lock-type-face ((((class grayscale) (background light)) (:weight bold :foreground "Gray90")) (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "ForestGreen")) (((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen")) (((class color) (min-colors 16) (background light)) (:foreground "ForestGreen")) (((class color) (min-colors 16) (background dark)) (:foreground "PaleGreen")) (((class color) (min-colors 8)) (:foreground "green")) (t (:underline (:color foreground-color :style line) :weight bold))))
 ;'(font-lock-variable-name-face ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "Gray90")) (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "sienna")) (((class color) (min-colors 88) (background dark)) (:foreground "LightGoldenrod")) (((class color) (min-colors 16) (background light)) (:foreground "DarkGoldenrod")) (((class color) (min-colors 16) (background dark)) (:foreground "LightGoldenrod")) (((class color) (min-colors 8)) (:weight light :foreground "yellow")) (t (:slant italic :weight bold))))
 ;'(font-lock-warning-face ((t (:inherit (error)))))
 ;'(button ((t (:inherit (link)))))
 ;'(link ((((class color) (min-colors 88) (background light)) (:underline (:color foreground-color :style line) :foreground "RoyalBlue3")) (((class color) (background light)) (:underline (:color foreground-color :style line) :foreground "blue")) (((class color) (min-colors 88) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan1")) (((class color) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan")) (t (:inherit (underline)))))
 ;'(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "magenta4")) (((class color) (background dark)) (:foreground "violet"))))
 ;'(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90")) (((class color grayscale) (background dark)) (:box nil :foreground "grey90" :background "grey20")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))
 ;'(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
 ;'(isearch ((((class color) (min-colors 88) (background light)) (:foreground "lightskyblue1" :background "magenta3")) (((class color) (min-colors 88) (background dark)) (:foreground "brown4" :background "palevioletred2")) (((class color) (min-colors 16)) (:foreground "cyan1" :background "magenta4")) (((class color) (min-colors 8)) (:foreground "cyan1" :background "magenta4")) (t (:inverse-video t))))
 ;'(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 ;'(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise")) (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4")) (((class color) (min-colors 16)) (:background "turquoise3")) (((class color) (min-colors 8)) (:background "turquoise3")) (t (:underline (:color foreground-color :style line)))))
 ;'(match ((((class color) (min-colors 88) (background light)) (:background "khaki1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 ;'(next-error ((t (:inherit (region)))))
 ;'(query-replace ((t (:inherit (isearch)))))
 )

(provide-theme 'salmon-dragon)
