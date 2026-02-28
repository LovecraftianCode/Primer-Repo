//Pagina fuente de palabras en latin: https://web.archive.org/web/20071219155115/http://users.adelphia.net/~florusc/latine/latinePage14.html

let dic =["abbatia", "acardiotrophia", "abbreviatio", "acatalepsia", "abbreviatio","abductio","Abellinensis","abiatio","abiogensis","Aboa",
        "abortus","abstractio","abusive","academia","acatalepticus","accelerare","acceleratio","acceleratorium","acceptus","accordeon","accusator",
        "acephalus","acetonium","achne","automatum","autonomia","autoplaustrum", "autoraeda laophorica", "avis Canaria", "avolare", "avolatio", "azimutum",
        "azoicus", "azotum", "Aztecus", "Babel", "babelicus", "baccalaureatus", "baccalaureus", "bacchanalia", "bacilliformis", "bacillum nicotianum", "bacterium Salmonenis",
        "badiolus", "bahaismus", "bahaistes", "bakelitis","ballatio", "ballipedium", "balneae pensiles","balneatrix","balneotherapia","brevio",
        "bronchitis", "bronchopneumonia","bryologia", "Buddhismus", "Buddhista", "bulgula nummaria","bulimus","buphthalmia", "burculum","butyrificium", 
        "cabbalista", "caccabus", "cacophonia", "cactaceae", "cactus", "cadaverum", "caeliscalpium", "caeneathesis", "caenozoicus", "cafaeina", "cafaeopola", 
        "cafaeum", "calceamenta cummea", "calceamentarium", "calchaemia", "caleidoscopium", "calligraphia", "calomelanum"
    ]

function generateLatinWord() {
    const randomIndex = Math.floor(Math.random() * dic.length);
    return dic[randomIndex];
}

function generateLatinphrase(wordCount) {
    let phrase = '';
    for (let i = 0; i < wordCount; i++) {
        phrase += generateLatinWord() + ' ';
    }
    return phrase.trim();
}

function repeatLatinPhrase(phrase, times) {
    let phrases = [];
    let repeatedPhrase = generateLatinWord();
    for (let i = 0; i < times; i++) {
        phrases.push(`${phrase} ${repeatedPhrase}`);
        repeatedPhrase = generateLatinWord();
    }
    return phrases;
}

let latinPhrase = generateLatinphrase(2);
console.log("Generated Latin phrase: " + latinPhrase);

console.log(repeatLatinPhrase(generateLatinWord(), 10));
