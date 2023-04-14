import dracula.draw
c.hints.selectors["code"] = [
    # Selects all code tags whose direct parent is not a pre tag
    ":not(pre) > code",
    "pre"
]

### Load existing settings made via :set
config.load_autoconfig()

### Font
c.fonts.default_family = 'UbuntuMono Nerd Font'
c.fonts.default_size = '14pt'

c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/easylistdutch.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']

### File Selection with LF
config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['lfpick', '{}'])
config.set("fileselect.multiple_files.command", ['lfpick', '{}'])
config.set("fileselect.folder.command", ['lfselect', '{}'])

### Open Videos in mpv if possible
# config.bind('f', 'hint links spawn --detach urlhandler {hint-url}')
# config.bind('F', 'hint links spawn --detach urlhandler -t {hint-url}')
config.bind('gi', 'spawn --detach urlhandler {url:pretty}')
config.bind('gI', 'spawn --detach urlhandler -t {url:pretty}')
config.bind('i', 'hint inputs --first')
config.bind('I', 'hint inputs')
config.bind('<Ctrl+e>', 'edit-text', 'insert')
config.bind('<Ctrl+e>', 'edit-command', 'command')
config.bind('<Ctrl+i>', 'mode-enter normal ;; hint inputs', 'insert')
config.bind('j', 'scroll-page 0 0.5', 'normal')
config.bind('k', 'scroll-page 0 -0.5', 'normal')


### Insert Movement keys
config.bind('<Ctrl+h>', 'fake-key <right>', 'insert')
config.bind('<Ctrl+j>', 'fake-key <down>', 'insert')
config.bind('<Ctrl+k>', 'fake-key <up>', 'insert')
config.bind('<Ctrl+l>', 'fake-key <left>', 'insert')
config.bind('<Enter>', 'fake-key -g <enter>;; later 0.3s mode-leave', 'insert')

### Prompt Movement keys
config.bind('<Ctrl+h>', 'rl-unix-filename-rubout', 'prompt')
config.bind('<Ctrl+j>', 'prompt-item-focus next', 'prompt')
config.bind('<Ctrl+k>', 'prompt-item-focus prev', 'prompt')
config.bind('<Ctrl+l>', 'fake-key -g /', 'prompt')

config.bind(';c', 'hint code userscript code_select.py')
### Load theme
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})


