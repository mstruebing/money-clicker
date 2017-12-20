// pull in desired CSS/SASS files
require('./styles/main.scss');

const MoneyClicker = require('../elm/Main');

const saveGame = JSON.parse(localStorage.getItem('savegame'));

const app = MoneyClicker.Main.embed(document.getElementById('main'), saveGame);

app.ports.saveGameToLocalStorage.subscribe(model => {
    localStorage.setItem("savegame", JSON.stringify(model));
});
