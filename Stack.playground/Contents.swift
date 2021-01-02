import UIKit
import XCTest
import Foundation
// Stack
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

extension Stack: CustomStringConvertible {
    var description: String {
        return storage
            .map { "\($0)"}
            .joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}


final class StackTestCase: XCTestCase {
    var stack = Stack<Int>()
    
    override func setUp() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
    }
    
    func test_push() {
        XCTAssertEqual(stack.description, "1 2 3 4")
    }
    
    func test_pop() {
        XCTAssertEqual(stack.pop(), 4)
    }
    
    func test_peek() {
        XCTAssertEqual(stack.peek(), 4)
    }
    
    func test_isEmpty() {
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_initWithArray() {
        let array = [1, 2, 3, 4]
        XCTAssertEqual(stack, Stack(array))
    }
    
    func test_arrayLiteral() {
        let stack: Stack = ["blueberry", "plain", "potato"]
        XCTAssertEqual(stack, ["blueberry", "plain", "potato"])
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
StackTestCase.defaultTestSuite.run()
