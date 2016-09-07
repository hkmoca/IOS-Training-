//: Playground - noun: a place where people can play

import UIKit




var noParametersOrReturn: () -> () = {

    print("you you no parameters")

}

noParametersOrReturn()


var noParameterAndOneReturn: () -> String = {
    return "String value"

}

noParameterAndOneReturn()

var oneParameterAndReturn: (String) -> String = { name -> String in
    
    return "Hi, " + name

}

oneParameterAndReturn("Hk")

var multipleParametersAndOneReturn: (String, String) -> String = { (firstName, lastName) -> String in
    
    var fullName = firstName + " " + lastName
    return fullName


}

multipleParametersAndOneReturn("Hk", "Moreno")



var oneParameterAndMultipleReturn: ([Int]) -> (even: [Int], odd: [Int]) = { numbers -> ([Int], [Int]) in
    var evenNumber = [Int]()
    var oddNumber = [Int]()
    
    for number in numbers {
        number % 2 == 0 ? evenNumber.append(number) : oddNumber.append(number)
    }

        return (evenNumber, oddNumber)
}


oneParameterAndMultipleReturn([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,10,20])





var noParametersOrRetunrII = {
    print("I´m inferring")

}
noParametersOrRetunrII()

var noParameterAndOneReturnII = {
    return "I´m returning and inferring"

}

noParameterAndOneReturnII()

var onePArameterAndReturnII = { (name: String) -> String in
    return "hello again " + name
}

onePArameterAndReturnII("hk")

var multiplePArametersAndOneReturnII = { (firstName: String, lastName: String) -> String in
    return firstName + " " + lastName
}

multiplePArametersAndOneReturnII("Hk", "Moreno")

var oneParameterAndMultipleReturnII = { (numbers: [Int]) -> (even:[Int], odd:[Int]) in
    var evenNumber = [Int]()
    var oddNumber = [Int]()
    
    for number in numbers {
        number % 2 == 0 ? evenNumber.append(number) : oddNumber.append(number)
    }
    
    return (evenNumber, oddNumber)

}

oneParameterAndMultipleReturnII([1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20]).odd



let gameScores = [45,76,87,34,23456,56,456,224,35788,765]

func sortDescending (i: Int, j: Int) -> Bool {
    return i > j
}

let gameScoreSorted = gameScores.sort(sortDescending)

// Refactor using a closure
let gameScoresSortedWithClosure = gameScores.sort({
    (i: Int, j: Int) -> Bool in
    return i > j
})

let gameScoresSortedInferred = gameScores.sort({ i, j in i > j})
gameScoresSortedInferred

let gamesScoresSortedShortI = gameScores.sort({ return $0 > $1})
let gamesScoresSortedShortII = gameScores.sort(>)




















