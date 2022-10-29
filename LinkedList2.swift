/*Node create a new Swift file in Sources directory and name it node.swift*/
public class Node<Value>{
    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}
extension Node: CustomStringConvertible{

    public var description: String{
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> " + String(describing:next) + " "
    }
}


    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)

    node1.next = node2
    node2.next = node3

    print(node1)
/*
As far as practicality goes, the current method of building lists leaves a lot to be desired. 
You can easily see that building long lists this way is impractical. 
A common way to alleviate this problem is to build a LinkedList that manages the Node objects. You’ll do just that!
*/




                                /*Linked List
                                
    In the Sources directory, create a new file and name it linkedlist.swift.
Add the following to the file:
                               
                                */

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() {}
    
    public var isEmpty: Bool {
        head == nil
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
// A linked list has the concept of a head and tail. which refers to the first and last nodes of the list respectively:
/*
                    
                    
                        Adding values to the list
    
    As mentioned before you are going to provide an interface to manage the NODE objects.
You will first take care of adding values. There are 3 ways to add values to a linked list, 
each having their own unique performance characteristics:

1. Push: Adds a value at the front of the list.
2. Append: Adds a value at the end of the list.
3. Insert(after:): Adds a value after a particular node of the list.

You will implement each off these in the next section and analyze their performance
characteristics.

                                PUSH OPERATIONS
    Adding a value at the front ofthe list isknown as a push operation. This is also
known as head-first insertion. The code for it's deliciously simple.

*/
public mutating func push(_ value: Value){
    head = Node(value: value, next: head)
    if tail == nil{
        tail = head
    }//In the case in which you're pushing into an empty list. the new node is both the head and tail of the list.
}
//example test 1
public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }

    public mutating func push(_ value: Value){
    head = Node(value: value, next: head)
    if tail == nil{
        tail = head
    }//In the case in which you're pushing into an empty list. the new node is both the head and tail of the list.
}
}

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print(list)