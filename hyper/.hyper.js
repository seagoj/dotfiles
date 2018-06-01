let fonts = [
    "SauceCodePro Nerd Font",
    "Source Code Pro for Powerline",
    "Sauce Code Powerline",
    "Anonymous Pro",
    "Anonymice Powerline",
    "Menlo",
    "DejaVu Sans Mono",
    "Lucida Console",
    "monospace"
];

module.exports = {
    config: {
        fontSize: 10,

        fontFamily: fonts.join(', '),

        fontWeight: "normal",

        fontWeightBold: 600,

        // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
        cursorShape: 'BLOCK',

        css: `
            .hyper_main { border: none; }
            .terms_terms { margin-top: 0px; }
        `,

        // custom css to embed in the terminal window
        termCSS: `
            x-screen * { font-weight: 600; }
            x-screen a {
                text-decoration: underline;
            }
            x-screen a.hover { text-decoration: none; }
            x-screen { border: none; }
        `,

        padding: '0px',

        shell: 'zsh',

        hyperclean: {
            hideTabs: true
        },

        hyperlinks: {
            defaultBrowser: true
        },

        // for advanced config flags please refer to https://hyperterm.org/#cfg
    },

    plugins: [
        'hyperclean',
        'hyperfontuhd',
        'hyperlinks',
        'hyperterm-sourcerer',
        'hyperterm-themed-scrollbar',
        'hyperterm-paste',
        'gitrocket'
    ],

    localPlugins: [
    ],
};
