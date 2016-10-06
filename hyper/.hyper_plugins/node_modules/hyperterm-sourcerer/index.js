exports.decorateConfig = (config) => {
  return Object.assign({}, config, {
    foregroundColor: '#c2c2b0',
    backgroundColor: '#222222',
    cursorColor: 'rgba(177, 214, 49, 0.5)',
    borderColor: '#222222',
    borderColor: 'yellow',
    colors: {
      black: '#111111',
      red: '#aa4450',
      green: '#719611',
      yellow: '#cc8800',
      blue: '#6688aa',
      magenta: '#8f6f8f',
      cyan: '#528b8b',
      white: '#d3d3d3',
      lightBlack: '#181818',
      lightRed: '#ff6a6a',
      lightGreen: '#b1d631',
      lightYellow: '#ff9800',
      lightBlue: '#90b0d1',
      lightMagenta: '#8181a6',
      lightCyan: '#87ceeb',
      lightWhite: '#c1cdc1'
    },
  });
}
