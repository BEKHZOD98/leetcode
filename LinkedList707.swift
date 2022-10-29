struct MyLinkedList{
    class Node{
    var value: Int
    var next: Node?

    init(_ value: Int, next: Node?){
        self.value = value
        self.next = next
    }
}
    var head: Node?
    var tail: Node?
    //init(_ head: Node?){
    //    self.head = head
    // }
    init(){ }
    mutating func addAtHead(_ val: Int) {
        
        head = Node(val, next: head) // HEAD 8
        if tail == nil{   //tali = nill
            tail = head    // tail -> head 8
        }
       
    }
    
    mutating func addAtTail(_ val: Int) {
        let node = Node(val , next: nil)  // 9
        
        tail!.next = node   // tail?.next = nil <-- 9
        //tail = node   // tail = 5    node -> tail
        tail = tail!.next  // traversal 
        //print(tail?.next?.value)
    }
    //func node(at index: Int){
    //    var currentIndex = 0
    //    var currentNode = head

    //    while currentNode != nil && currentIndex < index {
            
    //        currentNode = currentNode?.next //traversal
    //        currentIndex += 1
    //    }
    //    return currentNode
    
    mutating func addAtIndex(_ index: Int, _ val: Int) -> Int {
       
       return 1
    }
    










    mutating func deleteAtIndex(_ index: Int) {
        
    }
    mutating  func get(_ index: Int) -> Int{
        var curIndex = 0
        var cur = head
        while cur != nil && curIndex < index{
        cur = cur!.next
        curIndex += 1
        }
        print(cur!.value)
        let cur2 = cur!.value
        return cur2
    }
    mutating  func display(){
        var cur = head
        var s = ""
        while cur != nil{
        s += String(cur!.value) + " ----> "
        cur = cur!.next
        } 
        print(s)
    }
}
//var test = MyLinkedList()

var sol1 = MyLinkedList()
//sol1.addAtHead(6)
sol1.addAtHead(5)
//sol1.addAtHead(7)
sol1.addAtHead(8)

sol1.addAtTail(9)
print(sol1.get(1))
sol1.display()

//print(sol1.tail?.value)
/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */