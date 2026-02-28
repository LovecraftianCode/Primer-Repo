let dic =["abbatia", "acardiotrophia", "abbreviatio", "acatalepsia", "abbreviatio","abductio","Abellinensis","abiatio","abiogensis","Aboa",
        "abortus","abstractio","abusive","academia","acatalepticus","accelerare","acceleratio","acceleratorium","acceptus","accordeon","accusator",
        "acephalus","acetonium","achne","automatum","autonomia","autoplaustrum", "autoraeda laophorica", "avis Canaria", "avolare", "avolatio", "azimutum",
        "azoicus", "azotum", "Aztecus", "Babel", "babelicus", "baccalaureatus", "baccalaureus", "bacchanalia", "bacilliformis", "bacillum nicotianum", "bacterium Salmonenis",
        "badiolus", "bahaismus", "bahaistes", "bakelitis","ballatio", "ballipedium", "balneae pensiles"
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


let latinPhrase = generateLatinphrase(2);
console.log("Generated Latin phrase: " + latinPhrase);
