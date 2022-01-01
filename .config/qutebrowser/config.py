import dracula.draw

### Load existing settings made via :set
config.load_autoconfig()

### Font
c.fonts.default_family = 'UbuntuMono Nerd Font'
c.fonts.default_size = '14pt'

### File Selection with LF
config.set("fileselect.handler", "external")
config.set("fileselect.folder.command", ['lfpick', '{}'])
config.set("fileselect.single_file.command", ['lfpick', '{}'])
config.set("fileselect.multiple_files.command", ['lfpick', '{}'])

### Open Videos in mpv if possible
# config.bind('f', 'hint links spawn --detach urlhandler {hint-url}')
# config.bind('F', 'hint links spawn --detach urlhandler -t {hint-url}')
# config.bind('gi', 'spawn --detach urlhandler {url:pretty}')
# config.bind('gI', 'spawn --detach urlhandler -t {url:pretty}')

### Load theme
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})


