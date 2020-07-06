import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

# Font
c.fonts.default_family = 'BreezeSans'
c.fonts.default_size = '13pt'

# Improved find
config.bind('f', 'hint links spawn --detach urlhandler {hint-url}')
config.bind('F', 'hint links spawn --detach urlhandler -t {hint-url}')
config.bind('gi', 'spawn --detach urlhandler {url:pretty}')
config.bind('gI', 'spawn --detach urlhandler -t {url:pretty}')

# Load theme
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})


