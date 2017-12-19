// pull in desired CSS/SASS files
require('./styles/main.scss');

var Elm = require('../elm/Main');
Elm.Main.embed(document.getElementById('main'));
