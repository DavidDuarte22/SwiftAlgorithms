import UIKit

// Crear un algoritmo que arme un torneo con equipos
struct Stack<Element: Equatable>: Equatable {
    // Storage
    private var storage: [Element] = []
    // Empty
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init() { }
    
    init(_ elements: [Element]) {
        storage = elements
    }
    // Push
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    // Pop
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    // Peek
    func peek() -> Element? {
        return storage.last
    }
}

struct Match {
    let local: String
    let visitante: String
    let ronda: Int
    
    func getWinner() -> String {
        return Int.random(in: 0...2) == 1 ? local : visitante
    }
}

var matchHistory = [ Match ] ()
var ronda = 1
func getGanador(equipos: Stack<String>) -> String? {
    var equiposArray = equipos
    // asegurarnos que hay una cantidad par
    var arrayNuevaRonda = Stack<String>()
    while !equiposArray.isEmpty {
        guard let equipo1 = equiposArray.pop(), let equipo2 = equiposArray.pop() else { break }
        
        let match = Match(local: equipo1, visitante: equipo2, ronda: ronda)
        
        arrayNuevaRonda.push(match.getWinner())
        matchHistory.append(match)
    }
    

    if !arrayNuevaRonda.isEmpty {
        ronda += 1
        getGanador(equipos: arrayNuevaRonda)
    }
    
    return arrayNuevaRonda.peek()
}


//let equipos = ["River", "Gimnasia", "Independiente", "Los pirlos", "Segurola", "Habanna", "Racing", "Boca"]
var equipos = Stack<String>()

equipos.push("River")
equipos.push("Gimnasia")
equipos.push("Independiente")
equipos.push("Los pirlos")
equipos.push("Segurola")
equipos.push("Habanna")
equipos.push("Racing")
equipos.push("Boca")


print(getGanador(equipos: equipos))
matchHistory.map({
                    print("---------- \n",
                          "Ronda: \($0.ronda)",
                          "equipo1: \($0.local)",
                          "equipo2: \($0.visitante)"
                )})
