#!/usr/bin/env xcrun swift
func make_list(int: Int ,intHigh: Int)-> Array<Int> {
    return Array(int...intHigh)
}

typealias ReturnType = (Array<Int>) -> (Array<Int>)

func makeRemove(modVal: Int) -> ReturnType {
    let returnFunction: ReturnType = { (array: Array<Int>) in
        let modArray = array.filter{ word in return (word % modVal) != 0}
        return modArray
    }

    return returnFunction
}

func filter(array: Array<Int>) -> (Array<Int>){
    let removeVal = makeRemove(modVal: array[0])
    var outArray:Array<Int> = removeVal(array)
    outArray.insert(array[0], at:0)
    return outArray

}
func filter2(array: Array<Int>) -> (Array<Int>){
    var outArray:Array<Int> = []
    var workArray:Array<Int> = array
    while workArray.isEmpty == false{
        outArray.append(workArray[0])
        workArray = filter(array:workArray)
        workArray.removeFirst()
    }
    return outArray


}

let obj1 = makeRemove(modVal:2)

print(obj1(make_list(int:1,intHigh:10)))
print(filter(array:make_list(int:2,intHigh:10)))
print(filter2(array:make_list(int:2,intHigh:10)))
