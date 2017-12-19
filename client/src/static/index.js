// pull in desired CSS/SASS files
require('./styles/main.scss');

const MoneyClicker = require('../elm/Main');
const app = MoneyClicker.Main.embed(document.getElementById('main'));

app.ports.saveGameToLocalStorage.subscribe(model => {
    localStorage.setItem("savegame", JSON.stringify(model));
});

