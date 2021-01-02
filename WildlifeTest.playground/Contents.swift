import UIKit

/*

Escribir una función que dados 2 inputs: un array de letras y un array de palabras, imprima por pantalla las palabras que pueden escribirse con esas letras.

Ejemplo:

  letters = ["r", "o", "a", "z", "g", "m", "u", "a", "p", "t"]
  words = ["arroz", "gamuza", "zapato"]

  output = gamuza, zapato

*/

// { a: 1
//  r: 2
//  o: 1
//  z: 1
// }

// {
//   r: 1
//   a: 2
  
// }
import Foundation


// chequear si esta en letters... podria usar un dict
func getWords(_ letters: [Character], _ words: [String]) -> [String]? {

  var dictLetters = [Character: Int]()
  
  
  for letter in letters {
    if let count = dictLetters[letter] {
      dictLetters[letter] = count + 1
    } else {
      dictLetters[letter] = 1
    }
  }
  
  //print(dictLetters)
  
  // por cada word buscar coincidencias en letters.
  
   for word in words {
    
     var dictWord = [Character: Int]()
     for character in word {
        if let count = dictWord[character] {
          dictWord[character] = count + 1
        } else {
          dictWord[character] = 1
        }
     }
     
     var isOk = true
     for key in dictWord.keys {
       // si la key(letra) esta en el dictionario de las letras... y si el valor es igual o mayor
       // continuar... y sino break .
       
       if  (dictLetters[key] != nil) {
         if !( (dictLetters[key]!) >= (dictWord[key]!)) {
            isOk = false
         }
       } else { isOk = false }
      //print("key: \(key)  \(dictWord[key]!) ")
     }
     
     if (isOk) {
             print( "\(word) : esta palabra si")
     }
     
     // buscar si esa palabra coincide con el otro dic y sumar a un array final de resultad
   }
  //
  return nil
}


_ = getWords(["o", "a","r", "z", "g", "m", "u", "a", "p", "t"], ["arroz", "gamuza", "zapato"])

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}

