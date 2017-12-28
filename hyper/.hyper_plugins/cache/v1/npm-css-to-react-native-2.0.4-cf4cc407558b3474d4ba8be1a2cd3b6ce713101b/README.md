# css-to-react-native

Converts CSS text to a React Native stylesheet object.

```css
font-size: 18px;
line-height: 24px;
color: red;
```

```js
{
  fontSize: 18,
  lineHeight: 24,
  color: 'red',
}
```

Converts all number-like values to numbers, and string-like to strings.

Automatically converts indirect values to their React Native equivalents.

```css
text-shadow-offset: 10px 5px;
font-variant: small-caps;
transform: translate(10px, 5px) scale(5);
```

```js
{
  textShadowOffset: { width: 10, height: 5 },
  fontVariant: ['small-caps'],
  // Fixes backwards transform order
  transform: [
    { translateY: 10 },
    { translateX: 10 },
    { scale: 5 },
  ]
}
```

Also allows shorthand values.

```css
font: bold 14px/16px "Helvetica";
margin: 5px 7px 2px;
```

```js
{
  fontFamily: 'Helvetica',
  fontSize: 14,
  fontWeight: 'bold',
  fontStyle: 'normal',
  fontVariant: [],
  lineHeight: 16,
  marginTop: 5,
  marginRight: 7,
  marginBottom: 2,
  marginLeft: 7,
}
```

Shorthands will only accept values that are supported in React, so `background` will only accept a colour, `backgroundColor`

#### Shorthand Notes

`border{Top,Right,Bottom,Left}` shorthands are not supported, because `borderStyle` cannot be applied to individual border sides.

# API

The API is mostly for implementors. However, the main API may be useful for non-impmentors. The main API is,

```js
import transform from 'css-to-react-native';
// or const transform = require('css-to-react-native').default;

transform([
  ['font', 'bold 14px/16px "Helvetica"'],
  ['margin', '5px 7px 2px'],
  ['border-left-width', '5px'],
]); // => { fontFamily: 'Helvetica', ... }
```

For implementors, there is also,

```js
import { getPropertyName, getStylesForProperty } from 'css-to-react-native';

getPropertyName('border-width'); // => 'borderWidth'
getStylesForProperty('borderWidth', '1px 0px 2px 0px'); // => { borderTopWidth: 1, ... }
```

Should you wish to opt-out of transforming certain shorthands, an array of property names in camelCase can be passed as a second argument to `transform`.

```js
transform([['border-radius', '50px']], ['borderRadius']);
// { borderRadius: 50 } rather than { borderTopLeft: ... }
```

This can also be done by passing a third argument, `false` to `getStylesForProperty`.

## License

Licensed under the MIT License, Copyright © 2016 Jacob Parker and Maximilian Stoiber.

See [LICENSE.md](./LICENSE.md) for more information.