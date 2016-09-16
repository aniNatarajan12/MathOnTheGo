// Playground - noun: a place where people can play

import UIKit

var answerChosen:[Int] = [0]
var answerSoFar = 2

var i = 0
if answerChosen[0] == 0{
    answerChosen.insert(1, atIndex: 0)
    answerSoFar = 1
}
else {
    answerSoFar = 1
    
    var breaker = true
    while(breaker){
        if answerSoFar/Int(pow(Double(10),Double(i))) == 0{
            breaker = false
        }
        else{
            i++
        }
    }
    answerSoFar = Int(pow(Double(10),Double(i))) + 1
}

func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

var quotes:[String] = [" ","32"," twetwer","44347"]
quotes.count
quotes.append("heloo")
quotes.count
quotes[randomInt(0, quotes.count-1)]

var randone = Int()
var randtwo = Int()

var level = 13
var review = 0
var stage = 0
var firstHalf = true

while(level>6){
    stage++
    level -= 6
}

if(stage%2==1){
    firstHalf = false
}

if(firstHalf){
    randone = randomInt(1, 9) + 10*(stage/2)
    randtwo = level%6 + 10*(stage/4)
}

if(!firstHalf){
    randone = randomInt(1, 9) + 10*(stage/2)
    randtwo = level%6 + 5 + 10*(stage/4)
}

if(level%6==0){
    randone = randomInt(1, 9) + 10*(stage/2)
    if(firstHalf){
        randtwo = randomInt(1, 5) + 10*(stage/4)
    }
    else{
        randtwo = randomInt(6, 10) + 10*(stage/4)
    }
}
