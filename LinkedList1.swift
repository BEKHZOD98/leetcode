/*cozmos98
Linked list is also a linear ds.
23_->6_->15_-> () this is singly linked list
What are Singly Linked lists? 

Value Pointer -> Value Pointer -> Value Pointer -> nil
    node            node            node

As you can see each element in the linked list is actually a separate(alohida)
object while all the objects are "linked together by the reference field(mos yozublar maydon)"
in each element.
There are two linked list: the example above is a singly linked list and here is an
example of double linked list:
()-> _23_->_6_->_15_->
We will introduce more in later chapters.
    * Understand the structure of singly linked list and doubly linked list
    * Implement traversal(o'tish),insertion,deletion in a singly or doubly linked list
    * Analyze the complexity of different operation in a singly or doubly linked l
    * Use two - pointer technique(fast-pointer-slow-pointer technique) in the linked list
    * Solve classic problems such as reverese a linked list
    * Analyze the complexity of the algorithms you designed
    * Accumulate experience in designing and debugging.
*/
/*
                        Introduction - Singly Linked list
    Each node in a singly-linked list contains not only the value but also "reference field(mosyozublar maydoni)"
to link to the next node. By this way, the singly-linked list organizes all the nodes in a sequence.
Barcha tugunlar ketmaketlikda tashkil qilinadi.
23_->6_->15_-> ()
The blue arrows show how nodes in a singly linked list are combined together 
                !NODE!
Node - must be defined as a class. It needs to be a reference type , one that will not
work in a struct. The node class has 2 properties:
Node bu class tipida aniqlanadi , struct emasm
    * value: a generic data type that stores the actual value of the node
    * next: a reference/pointer(aloqador korsatkich) that points to the next node.
*/
class Node<T> {
    var value: T
    var next: Node<T>?

    init(value: T, next: Node<T>? = nil){
        self.value = value
        self.next = next
    }
}
/*Linked list
Unlike Node , a Linked list is a value type. It's defined as a struct. By defaul
a linked list has three basic properties:
    head: the first node of the list
    tail: the last node of the list
    isEmpty: whether or not the list is empty(royhat bosh yoki yoq)

Of course, you can add additional properties based on our needs, such as:
    count: the number of nodes in the list.
    description: text that describes the list.
*/
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {head == nil}

    init(){}
}
/*
    Unlike Stacks and Queues, a Linked List doesn't contain a collection of data
that you can call and use directly(toridan tori). All nodes in the list must be
linked to the next available node if one exists(agar mavjud bolsa keyingi node bn boglanadi).
If we mess up a node in the middle of the list, the list is going to be broken. 


!Diqqat

            * PUSH *
    By pushing data to a list , we are adding data in the front of the list. This means
the current head will be replaced with the new node, and the new node will become the head
the head of the list.
*/
struct LinkedList<T>{
    
    var head: Node<T>?
    var tail: Node<T>?
    var isEmpty: Bool {head == nil}
/// menimcha(*aniq) tepada head va tailni aniqlanadi

    mutating func push(_ value: T){
        head = Node(value: value, next: head)

        if tail == nil {
            tail = head
        }
    }
}
/*
    By calling push(_ value: T), we create a new node with the value, and have the new pointed to 
the old head.We then replace the head with the new node, so the old head becomes the second node of the list.

                * Append *
Similar to push, by appending data to a list, we add data to the end of the list.
This means the current tail will be replaced with the new node, the new node will become the new tail.

*/
struct LinkedList<T>{
    
    var head: Node<T>
    var tail: Node<T>
    var isEmpty: Bool {head == nil}

    mutating func append(_ value:T){
        let node = Node(value: value)
        tail?.next = node
        tail = node
    }
}

/*
Index(Indices) don't subscribe to Linked List, so we are not able to read data the collection in the same way as arrays.
To return data from an index, we need to use a loop

*/
struct LinkedList<T>{
    var head: Node<T>
    var tail: Node<T>
    var isEmpty: Bool {head == nil}

    func node(at index: Int) -> Node<T>?{
        var currentIndex = 0
        var currentNode = head
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
}
/*
            *Insert*
As I said previously, indices don't subscribe to LL. They have no idea about position
All they know is which node is linked to which. In order to tell the LL to insert a node
at a specific position, we need to find the node that's linked to the position. We need to use the 
node(at index:Int) -> Node<T> function above.
*/
struct LinkedList<T>{
    var head: Node<T>
    var tail: Node<T>
    var isEmpty: Bool {head == nil}

    func insert(_ value: T, after index: Int){
        guard let node = node(at: index) else {return} 
        //First, we must find the node that’s at the given position.

        node.next = Node(value: value, next: node.next) 
        //We have next pointed to the new node, and the new node pointed to the original next node

    }
}
/*
                    *Pop*
    By popping data, we remove the head from the list, so the second node will
then become the head.

*/
struct LinkedList<T>{
    var head: Node<T>
    var tail: Node<T>
    var isEmpty: Node<T>

    mutating func pop() -> T?{
        defer {
            head = head?.next

            if isEmpty{
                tail = nil
            }
        }
        return head?.value 
    }
}
// We return the value of the old head and replace the old head with the next node
// So the second node becomes the head.

/*
                    *Remove Last*
    Similar to pop(), this removes the tail of the list, so this second last node
will become the tail.
*/
struct LinkedList<T>{
    var head: Node<T>
    var tail: Node<T>
    var isEmpty:Node<T>

    mutating func removeLast() -> T?{
        guard let head = head else{return nill}
        guard let head.next != nil else { return pop() }

        var previouslyNode = head
        var currentNode = head

        while let next =  currentNode.next{
            previouslyNode = currentNode
            currentNode = next
        }
        previouslyNode.next = nil
        tail.previouslyNode
        return currentNode.value
    }
}
/*
                    *Remove after*
    But unlike pop(), removing the tail is a little bit more complicated since the
    tail doesn't know wich is the previous node. We need to iterate through the 
    list to find to the node before the tail and make it the tail.

    if head nil, meaning that the list is empty, we have nothing to remove
    then return nil
    if head.next is null ,meaning that there is only one node in the list , then
    remove the head.


                    @Remove@
Similar to insert(_ value: T, after index: Int) , we need to find the linked node since 
the list has no idea about positioning.It’s kind of tricky to remove a node at a given index,
so we basically just skip one node, and point to the node after that one.

There are the basic properties and function that a singly linked list normally has.
ofcourse, you can add add-ons on top of these.
*/
struct LinkedList<T>{
    var head: Node<T>?
    var tail: Node<T>?

    func node(at index: Int) -> Node<T>?{
        var currentIndex = 0
        var currentNode = head
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }

    mutating func remove(after index: Int) -> T? {
        guard let node = node(at: index) else{ return nil}

        defer {
            if node.next === tail {
                tail = node
            }

            node.next = node.next?.next
        }

        return node.next?.value
    }
}