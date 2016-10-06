//  Timothy Ha
//  Info 498 Au2016
//  10.06.16
//
//  main.swift
//  SimpleCalc
//
// a simple calculator app that prompts the user for operands and operations and returns the result
// supports decimals and negative numbers

import Foundation

var count = 0
var sum = 0.0
let oper = ["+", "-", "*", "/", "%", "fact"]

// print results function depending on the type of the passed in parameter
func printResults<T: Comparable>(result: T) {
    print("Result: \(result)")
}

// prompts the user to start the calculation
print("Enter an expression separated by returns:")
var prompt1 = Double(readLine(strippingNewline: true)!)!
var result = 0.0
count += 1
sum += prompt1

var prompt2 = readLine(strippingNewline: true)!

// checks for one of the six basic operations
if oper.contains(prompt2) {
    if prompt2 == "fact" { // factorial
        var factInt = prompt1
        result = 1
        while (factInt >= 2) {
            result *= factInt
            factInt -= 1
        }
    } else { // add, sub, mul, div, mod
        var prompt3 = Double(readLine(strippingNewline: true)!)!
        switch prompt2 {
        case "+":
            result = prompt1 + prompt3
        case "-":
            result = prompt1 - prompt3
        case "*":
            result = prompt1 * prompt3
        case "/":
            result = prompt1 / prompt3
        case "%":
            result = Double(Int(prompt1) % Int(prompt3))
        default:
            break
        }
    }
} else { // count or avg
    var prompt3 = prompt2
    while prompt3 != "count" && prompt3 != "avg" {
        count += 1
        sum += Double(prompt3)!
        prompt3 = readLine(strippingNewline: true)!
    }
    if String(prompt3) == "count" {
        result = Double(count)
    } else { // avg
        result = Double(sum) / Double(count)
    }
}

// prints results
if result == floor(result) {
    printResults(result: Int(result))
} else {
    printResults(result: result)
}
