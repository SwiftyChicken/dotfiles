(deftheme salmon-dragon
  "Created 2023-04-15.")

(custom-theme-set-faces
 'salmon-dragon
 ; MAIN FACES
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
                :background "#1B1524" 
                :stipple nil 
                :inherit nil))))

           ;Backgoround in Light Theme
 '(fringe ((((class color) (background light))
            (:background "white"))     
           ;Backgoround in Dark Theme
           (((class color) (background dark))
            (:background "#1B1524")) 
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
		:background "#272447"
		:box (:line-width (9 . 8)
		      :color "#272447")
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

 '(header-line ((default (:inherit (mode-line)))
		(((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil))
		(((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90"))
		(((class color grayscale) (background dark)) (:box nil :foreground "red" :background "#131414"))
		(((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white"))

		(((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))

 '(highlight ((((class color) (min-colors 88) (background light))
	       (:background "darkseagreen2"))
	      (((class color) (min-colors 88) (background dark))
	       (:background "#262032"))
	      (((class color) (min-colors 16) (background light))
	       (:background "darkseagreen2"))
	      (((class color) (min-colors 16) (background dark))
	       (:background "darkolivegreen"))
	      (((class color) (min-colors 8))
	       (:foreground "black" :background "green"))
	      (t (:inverse-video t))))

 '(region ((((class color) (min-colors 88) (background dark))
	    (:extend t :foreground "#FFF" :background "#1E3EBD"))
	   (((class color) (min-colors 88) (background light) (type gtk))
	    (:extend t :background "gtk_selection_bg_color" :distant-foreground "gtk_selection_fg_color"))
	   (((class color) (min-colors 88) (background light) (type ns))
	    (:extend t :background "ns_selection_bg_color" :distant-foreground "ns_selection_fg_color"))
	   (((class color) (min-colors 88) (background light))
	    (:extend t :background "lightgoldenrod2"))
	   (((class color) (min-colors 16) (background dark))
	    (:extend t :background "blue3"))
	   (((class color) (min-colors 16) (background light))
	    (:extend t :background "lightgoldenrod2"))
	   (((class color) (min-colors 8))
	    (:extend t :foreground "white" :background "blue"))
	   (((type tty) (class mono))
	    (:inverse-video t))
	   (t (:extend t :background "gray"))))
; '(mode-line-buffer-id ((t (:height 180 :weight thin))))
; '(mode-line-emphasis ((t (:height 180 :weight thin))))
; '(mode-line-highlight ((((supports :box t) (class color) (min-colors 88)) (:box (:line-width (20 . 20) :color "grey40" :style released-button))) (t (:inherit (highlight)))))
;'(fixed-pitch ((t (:family "Monospace"))))
;'(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
;'(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
;'(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
;'(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
;'(secondary-selection ((((class color) (min-colors 88) (background light)) (:extend t :background "yellow1")) (((class color) (min-colors 88) (background dark)) (:extend t :background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:extend t :background "yellow")) (((class color) (min-colors 16) (background dark)) (:extend t :background "SkyBlue4")) (((class color) (min-colors 8)) (:extend t :foreground "black" :background "cyan")) (t (:inverse-video t))))
;'(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
;'(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
;'(match ((((class color) (min-colors 88) (background light)) (:background "khaki1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
;'(next-error ((t (:inherit (region)))))
;'(query-replace ((t (:inherit (isearch)))))

 ;; DISPLAY LINENUMBER
 '(line-number                 ((nil (:foreground "#BDC3E4"))))
 '(line-number-current-line    ((nil (:foreground "#FFFFFF"
				      :background "#463F63"))))
 ;; ISEARCH/EVIL-SEARCH HIGHLIGTH
 '(isearch ((((class color) (min-colors 88) (background light))
	     (:foreground "lightskyblue1" :background "magenta3"))
	    (((class color) (min-colors 88) (background dark))
	     (:foreground "#008E6C"
			  :background "white"
			  :box (:line-width (2 . 2)
			       :color "#008E6C")))
	    (((class color) (min-colors 16))
	     (:foreground "cyan1" :background "magenta4"))
	    (((class color) (min-colors 8))
	     (:foreground "cyan1" :background "magenta4"))
	    (t (:inverse-video t))))

 ; Other selections
 '(lazy-highlight ((((class color) (min-colors 88) (background light))
		    (:background "paleturquoise"))
		   (((class color) (min-colors 88) (background dark))
		    (:foreground "#008E6C"
				 :background "#1B1524"
				 :box (:line-width (2 . 2)
			       :color "#008E6C")))
		   (((class color) (min-colors 16))
		    (:background "turquoise3"))
		   (((class color) (min-colors 8))
		    (:background "turquoise3"))
		   (t (:underline (:color foreground-color :style line)))))

 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1"))
		 (((class color) (min-colors 88) (background dark)) (:background "#FF006B"))
		 (((class color) (min-colors 16)) (:background "red"))
		 (((class color) (min-colors 8)) (:background "red"))
		 (((class color grayscale)) (:foreground "grey"))
		 (t (:inverse-video t))))
 ;; INDENTATION HIGHLIGHT
 '(highlight-indent-guides-stack-character-face  ((nil (:foreground "#524D6F"))))
 '(highlight-indent-guides-top-character-face    ((nil (:foreground "#E6B91B"))))
 '(highlight-indent-guides-character-face        ((nil (:foreground "#1B1524"))))

 ;; SYNTAX HIHLIGHTING
 ;  :tag 
 '(font-lock-builtin-face ((((class grayscale) (background light)) (:weight bold :foreground "LightGray"))
			   (((class grayscale) (background dark)) (:weight bold :foreground "DimGray"))
			   (((class color) (min-colors 88) (background light)) (:foreground "dark slate blue"))
			   (((class color) (min-colors 88) (background dark)) (:foreground "#A986F7"))
			   (((class color) (min-colors 16) (background light)) (:foreground "Orchid"))
			   (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue"))
			   (((class color) (min-colors 8)) (:weight bold :foreground "blue"))
			   (t (:weight bold))))

 ; comments
 '(font-lock-comment-delimiter-face ((default (:foreground "#AAAEC3" :inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "DimGray"))
			   (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "LightGray"))
			   (((class color) (min-colors 88) (background light)) (:foreground "red"))
			   (((class color) (min-colors 88) (background dark)) (:family "Cartograph CF Italic"
									       :height 165
									       :weight medium
									       :foreground "#8389A8"))
			   (((class color) (min-colors 16) (background light)) (:foreground "red"))
			   (((class color) (min-colors 16) (background dark)) (:foreground "red1"))
			   (((class color) (min-colors 8) (background light)) (:foreground "red"))
			   (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))
			   (t (:slant italic :weight bold))))

 ; Surrounding delimiters
 '(rainbow-delimiters-depth-1-face    ((nil (:foreground "#783FF3"))))
 '(rainbow-delimiters-depth-2-face    ((nil (:foreground "#5980B1"))))
 '(rainbow-delimiters-depth-3-face    ((nil (:foreground "#FFFFFF"))))
 '(rainbow-delimiters-depth-4-face    ((nil (:foreground "#FEB4AF"))))
 '(rainbow-delimiters-depth-5-face    ((nil (:foreground "#DB5764"))))
 '(rainbow-delimiters-depth-6-face    ((nil (:foreground "#65afff"))))
 '(rainbow-delimiters-depth-7-face    ((nil (:foreground "#FFD65C"))))
 '(rainbow-delimiters-depth-8-face    ((nil (:foreground "#D2E9AF"))))
 '(rainbow-delimiters-depth-9-face    ((nil (:foreground "#00E0B4"))))

 '(rainbow-delimiters-unmatched-face  ((nil (:foreground "#ff51eb"))))
 '(rainbow-delimiters-mismatched-face ((nil (:foreground "#ff0a54"))))

 ; constant
 '(font-lock-constant-face ((((class grayscale) (background light))
			     (:underline (:color foreground-color :style line) :weight bold :foreground "LightGray"))
			    (((class grayscale) (background dark))
			     (:underline (:color foreground-color :style line) :weight bold :foreground "Gray50"))
			    (((class color) (min-colors 88) (background light))
			     (:foreground "dark cyan"))
			    (((class color) (min-colors 88) (background dark))
			     (:foreground "#FF862F"))
			    (((class color) (min-colors 16) (background light))
			     (:foreground "CadetBlue"))
			    (((class color) (min-colors 16) (background dark))
			     (:foreground "Aquamarine"))
			    (((class color) (min-colors 8))
			     (:foreground "magenta"))
			    (t (:underline (:color foreground-color :style line) :weight bold))))

 ; Fucntion name
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-doc-markup-face ((t (:inherit (font-lock-constant-face)))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "Blue1"))
				 (((class color) (min-colors 88) (background dark)) (:foreground "#2D6FF9"))
				 (((class color) (min-colors 16) (background light)) (:foreground "Blue"))
				 (((class color) (min-colors 16) (background dark)) (:foreground "LightSkyBlue"))
				 (((class color) (min-colors 8)) (:weight bold :foreground "blue"))
				 (t (:weight bold :inverse-video t))))

 ; Keyword
 '(font-lock-keyword-face ((((class grayscale) (background light)) (:weight bold :foreground "LightGray"))
			   (((class grayscale) (background dark)) (:weight bold :foreground "DimGray"))
			   (((class color) (min-colors 88) (background light)) (:foreground "Purple"))
			   (((class color) (min-colors 88) (background dark)) (:family "Cartograph CF Italic"
									       :foreground "#EE5396"
									       :weight black
									       :slant italic))
			   (((class color) (min-colors 16) (background light)) (:foreground "Purple"))
			   (((class color) (min-colors 16) (background dark)) (:foreground "Cyan"))
			   (((class color) (min-colors 8)) (:weight bold :foreground "cyan"))
			   (t (:weight bold))))

 ; ???
 '(font-lock-negation-char-face ((t (:foreground "cyan"))))

 ; String
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((((class grayscale) (background light)) (:slant italic :foreground "DimGray"))
			  (((class grayscale) (background dark)) (:slant italic :foreground "LightGray"))
			  (((class color) (min-colors 88) (background light)) (:foreground "VioletRed4"))
			  (((class color) (min-colors 88) (background dark)) (:foreground "#F9C747"))
			  (((class color) (min-colors 16) (background light)) (:foreground "RosyBrown"))
			  (((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon"))
			  (((class color) (min-colors 8)) (:foreground "green"))
			  (t (:slant italic))))

 ; Type and class names
 '(font-lock-type-face ((((class grayscale) (background light)) (:weight bold :foreground "Gray90"))
			(((class grayscale) (background dark)) (:weight bold :foreground "DimGray"))
			(((class color) (min-colors 88) (background light)) (:foreground "ForestGreen"))
			(((class color) (min-colors 88) (background dark)) (:foreground "#20AEF1"))
			(((class color) (min-colors 16) (background light)) (:foreground "ForestGreen"))
			(((class color) (min-colors 16) (background dark)) (:foreground "PaleGreen"))
			(((class color) (min-colors 8)) (:foreground "green"))
			(t (:underline (:color foreground-color :style line) :weight bold))))

 ; Variables
 '(font-lock-variable-name-face ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "Gray90"))
				 (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "DimGray"))
				 (((class color) (min-colors 88) (background light)) (:foreground "sienna"))
				 (((class color) (min-colors 88) (background dark)) (:foreground "#1DD8AB"))
				 (((class color) (min-colors 16) (background light)) (:foreground "DarkGoldenrod"))
				 (((class color) (min-colors 16) (background dark)) (:foreground "LightGoldenrod"))
				 (((class color) (min-colors 8)) (:weight light :foreground "yellow"))
				 (t (:slant italic :weight bold))))

 '(font-lock-warning-face ((t (:foreground "#FF006B"
					   :inherit (error)))))

 '(button ((t (:inherit (link)))))

; Links
'(link ((((class color) (min-colors 88) (background light))
	 (:underline (:color foreground-color :style line)
		     :foreground "RoyalBlue3"))
	(((class color) (background light))
	 (:underline (:color foreground-color :style line)
		     :foreground "blue"))
	(((class color) (min-colors 88) (background dark))
	 (:underline (:color foreground-color :style line)
		     :family "Cartograph CF Italic"
		     :foreground "#00FFB2"))
	(((class color) (background dark))
	 (:underline (:color foreground-color :style line)
		     :foreground "red"))
	(t (:inherit (underline)))))

'(link-visited ((default (:inherit (link))) (((class color) (background light))
					     (:foreground "magenta4"))
		(((class color) (background dark)) (:foreground "violet")))))

(provide-theme 'salmon-dragon)
