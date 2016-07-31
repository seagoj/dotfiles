module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 10,

    // font family with optional fallbacks
    fontFamily: '"Source Code Pro for Powerline", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // custom css to embed in the main window
    css: `
        .hyperterm_main { border: none; }
    `,

    // custom css to embed in the terminal window
    termCSS: `
      ix-screen a { color: blue; }
      x-screen a.hover { text-decoration: none; }
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    // padding: '12px 14px',
    padding: '0px',

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for advanced config flags please refer to https://hyperterm.org/#cfg

    hyperclean: {
      hideTabs: true
    },

    hypertype: false
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperclean',
    'hyperlinks',
    // 'hypertype', // uncomment after PR is accepted
    'sourcerer-hyperterm'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    'hypertype' // remove after PR is accepted
  ]
};
