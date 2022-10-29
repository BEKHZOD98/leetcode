class Calculator{
    //non-static method
    func multiply(_ num1: Int, _ num2: Int) -> Int{
        return num1 * num2
    }
    //static method
    static func add(_ num1: Int, _ num2: Int) -> Int{
        return num1 + num2
    }
}
//create an instance(obj) of the calculator class
var obj = Calculator()

//call static method
var result2 = Calculator.add(2, 2)
print("static method res2: \(result2)")

//call non-static method
var result1: Int = obj.multiply(2, 2)
print("non-static method res1: \(result1)")
/*
We can also create methods that can be accessed without creating objects

Calculator.add() calls static method using the class name
obj.multiply() calls non static method using the object of the class

A static method is of class type (associated with class rather than object), so we
are able to access them using class names.

Similarly we can also create static methods inside a struct. static methods inside a struct are
of struct type, so we use the struct name to access them: 
*/
struct calc{
    static func add(_ num1: Int, _ num2: Int) -> Int{
        return num1 + num2
    }
}
var result = calc.add(3, 3)
print("res:",result)