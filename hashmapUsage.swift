




//initialize a hash map (sw dict)
var hashmap = [0 : 0 , 2 : 3]
//insert a new (key, value) pair or updait the value of existed key
hashmap[1] = 1
hashmap[1] = 2
//get the value of a key
print("The value of key 1 is : " , hashmap[1]! )
//delete/remove a key
hashmap.removeValue(forKey: 2)
// check if a key is in the hash map
let keyExists = hashmap[1] != nil
if keyExists{
    print("The key is present in the dictionary")
}else{
    print("The key is not present in the dictionary")
}
//both key and value can have different type in a hashmap
var h = [String: Double]()
h["pi"] = 3.14
//get size of the hash map
print("The size of hash map is: ", hashmap.count)
//iterate the hash map
for (key , value) in hashmap{
    print(" \(key) : \(value)")
}
