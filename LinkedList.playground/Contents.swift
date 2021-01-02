import UIKit

class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
    var head: Node?
    func isEmpty () -> Bool { return self.head?.value != nil  }
    
    func insert (value: Int) {
        // empty list
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
        // iterate over the nodes until we reach the last one
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        // at the last item we can add the new Node
        current?.next = Node(value: value, next: nil)
    }
    
    
    func delete(value: Int) {
        if head?.value == value {
            head = head?.next
        }
        
        var prev: Node?
        var current = head
        // iteraciones:
        // current = 1 -> prev: 1 current: 2
        // current = 2 -> no entra ...
        while current != nil && current?.value != value {
            prev = current
            current = current?.next
        }
        
        prev?.next = current?.next
    }
    
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 && head != nil else { return nil }
        
        var counter = 1
        var current = head
        
        while current != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        
        return current
    }
    
    func insertInOrder(value: Int) {
        // the array is empty or the value is lower than the head
        if head == nil || head!.value >= value {
            let newNode = Node(value: 1, next: head)
            head = newNode
            return
        }
        //  2 4 5 -> 3
        var currentNode: Node? = head
        // 1
        // 2
        while currentNode?.next != nil && (currentNode?.next?.value)! < value {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = Node(value: value, next: currentNode?.next)
    }
    
    func displayListItems() {
        print("")
        var current = head
        while current != nil {
            print(current!.value)
            current = current?.next
        }
    }
}


let sampleList = LinkedList()
// 1 -> 2 -> 3 -> nil
sampleList.insert(value: 1)
sampleList.insert(value: 2)
sampleList.insert(value: 3)
sampleList.displayListItems()



//class Photo {
//    let id: String
//    let url: String
//    var order: Int
//
//    init(id: String, url: String, order: Int) {
//        self.id = id
//        self.url = url
//        self.order = order
//    }
//}
//
//
//var photos: [Photo] = [
//    Photo(id: "A", url: "/path/to/photo/A.png", order: 4),
//    Photo(id: "B", url: "asd", order: 1),
//    Photo(id: "C", url: "Aasd", order: 3),
//    Photo(id: "D", url: "@!", order: 2),
//    Photo(id: "E", url: "@!", order: 5),
//]
//
//func changeOrder(photoId: String, orderToInsert: Int) {
//    // buscar la posicion en la que esta la foto con ese id
//    guard let photoToInsert = photos.first(where: { $0.id == photoId }) else { return }
//    // guardar obj Photo de esa posicion
//    for photo in photos {
//        // lo movia hacia un orden menor
//         if (photoToInsert.order > orderToInsert) {
//            if (photo.order < photoToInsert.order && photo.order >= orderToInsert) {
//                photo.order += 1
//            }
//        } else {
//
//            if (photo.order > photoToInsert.order && photo.order <= orderToInsert) {
//                photo.order -= 1
//            }
//        }
//
//        // lo muevo a un order mayor
//    }
//
//    photoToInsert.order = orderToInsert
//}
//
//
//changeOrder(photoId: "D", orderToInsert: 2)
//print(photos.map{ "id: \( $0.id) order: \($0.order)"})
