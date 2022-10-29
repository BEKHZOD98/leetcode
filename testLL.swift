public class Node<Value> {

    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}
extension Node: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

public struct LinkedList<Value>{

    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() {}

    public var isEmpty: Bool {
        head == nil
    }
    //adding values to the list with push method
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}

var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)

print(list)
