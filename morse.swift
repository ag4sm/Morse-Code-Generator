var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

// Dictionary to hold marse code equivalent for each letter
var letterToMorse: [String:String] = [
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--.."
]

//set empty variable for holding string
var morseText = ""

for element in englishText {
    if let morseChar = letterToMorse["\(element)"] {
        morseText += morseChar + " "//single space
    } else {
        morseText += "   "//three spaces
    }
}

var decodedMessage = ""
var morseCodeArray = [String]()
var currMorse = "" //holds current morse character

for char in secretMessage {
    if char != " " {
        currMorse.append(char)
    } else {
        switch currMorse {
        case "": 
            currMorse += " "
        case " ":
            morseCodeArray.append(" ")
            currMorse = ""
        default: 
            morseCodeArray.append(currMorse)
            currMorse = ""
        }
    }
}

morseCodeArray.append(currMorse)
print(morseCodeArray)

var morseToLetter = [String:String]()

for (letter, morseChar) in letterToMorse {
    morseToLetter[morseChar] = letter
}

for morseValue in morseCodeArray {
    if let letterChar = morseToLetter[morseValue]{
        decodedMessage += letterChar
    } else {
        decodedMessage += " " // adds space between words
    }
}

print(decodedMessage)