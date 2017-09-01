exports.decorateConfig = config => {
	const { screen } = require('electron')
	const { width, height } = screen.getPrimaryDisplay().workAreaSize;

	return Object.assign({}, config, {
		fontSize: width >= 3500 ?
			config.fontSizeUHD || 12 :
			config.fontSize
	});
}
