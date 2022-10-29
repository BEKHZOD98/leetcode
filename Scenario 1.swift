/*
The first scenario to use a hash map is that we "need more information"
rather than only the key. Then we can "build a mapping relationship between key and information"
by hash map


! create an empty dictionary
var emptyDictionary = [Int: String]()


var classificationNumbers = [0: "apple", 1: "banana", 2: "painapple"]
print("keys: values")
for(key, value) in classificationNumbers{
    print(key,value)
}
*/
//var hashmap = Hashable 

var nums = [2,7,11,5], target = 9
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for(key , value) in nums{
            var tempInt = key + key
            if(tempInt == target){
                return nums[key]
            }
        }
        
        
    }