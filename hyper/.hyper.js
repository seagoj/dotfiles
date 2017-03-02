let semibold = 600;
let blue = '#6688aa';
let systemDefaultShell = '';
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

		fontFamily: fonts.join(','),

		// `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
		cursorShape: 'BLOCK',

		// custom css to embed in the main window
		css: `
			.main_mmu { border: none; }
			.terms_terms { margin-top: 0px; }
		`,

		// custom css to embed in the terminal window
		termCSS: `
			x-screen * { font-weight: ` + semibold + `; }
			x-screen a {
				color: ` + blue + `;
				text-decoration: underline;
			}
			x-screen a.hover { text-decoration: none; }
			x-screen { border: none; }
		`,

		padding: '0px',

		shell: systemDefaultShell,

		hyperclean: {
			hideTabs: true
		},

		hypertype: false,

		// for advanced config flags please refer to https://hyperterm.org/#cfg
	},

	plugins: [
		// 'hyperclean',
		'hyperfontuhd',
		'hyperlinks',
		'hyperterm-sourcerer',
		'hyperterm-themed-scrollbar',
	],

	localPlugins: [
		'hypertype',
	],
};
