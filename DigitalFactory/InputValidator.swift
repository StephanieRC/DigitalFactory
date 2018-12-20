//
//  InputValidator.swift
//  DigitalFactory
//
//  Created by stephanie Cappello on 12/16/18.
//  Copyright © 2018 stephanie Cappello. All rights reserved.
//

import Foundation

class InputValidator{
    
    func operatorValid(exp: String, operation: String)->(String){
        let regexNumber = try? NSRegularExpression(pattern: "[0-9]", options: [])
        let regexParenthesis = try? NSRegularExpression(pattern: "[)]", options: [])
        if exp.count > 0{
            let matchesNumber = regexNumber?.numberOfMatches(in: String(exp.suffix(1)), options: [], range: NSRange(location: 0, length: 1))
            let matchesParenthesis = regexParenthesis?.numberOfMatches(in: String(exp.suffix(1)), options: [], range: NSRange(location: 0, length: 1))
            if ((matchesNumber ?? 0)>0) || ((matchesParenthesis ?? 0)>0){
                return exp+operation
            }else{
                return exp
            }
        }else{
            return "0\(operation)"
        }
    }
    
    func trigValid(exp: String, trig: String)->(String){
        let regexNumber = try? NSRegularExpression(pattern: "[0-9]", options: [])
        let regexTrig = try? NSRegularExpression(pattern: "(sin)|(cos)|(tan)", options: [])
        let regexParenthesis = try? NSRegularExpression(pattern: "[)]", options: [])
        
        if exp.count > 0{
            let matchesSufNumber = regexNumber?.numberOfMatches(in: String(exp.suffix(1)), options: [], range: NSRange(location: 0, length: 1))
            let matchesSufParenthesis = regexParenthesis?.numberOfMatches(in: String(exp.suffix(1)), options: [], range: NSRange(location: 0, length: 1))
            if ((matchesSufNumber ?? 0)>0) || ((matchesSufParenthesis ?? 0)>0){
                let matchesPreNumber = regexNumber?.numberOfMatches(in: String(exp.prefix(1)), options: [], range: NSRange(location: 0, length: 1))
                let matchesTrig = regexTrig?.numberOfMatches(in: String(exp.prefix(1)), options: [], range: NSRange(location: 0, length: 1))
                if ((matchesPreNumber ?? 0)>0) || ((matchesTrig ?? 0)>0){
                    return "\(trig)(\(exp))"
                }
            }
        }
        return exp
    }
    
    func decimalValid(exp: String) -> (String) {
        if exp.count > 0{
            let regexNumber = try? NSRegularExpression(pattern: "[0-9]", options: [])
            let matchesSufNumber = regexNumber?.numberOfMatches(in: String(exp.suffix(1)), options: [], range: NSRange(location: 0, length: 1))
            if ((matchesSufNumber ?? 0)>0){
                let lastOpIndex = lastIndexOfOperator(exp: exp)
                let lastNum = exp.suffix(lastOpIndex)
                if !lastNum.contains("."){
                    return "\(exp)."
                }
            }
        }
        return exp
    }
    
    private func lastIndexOfOperator(exp: String)->(Int){
        var indexReturned = 0
        guard let lastIndexOfAdd = exp.lastIndex(of: "+") else { return 0 }
        guard let lastIndexOfMinus = exp.lastIndex(of: "-") else { return 0 }
        guard let lastIndexOfMul = exp.lastIndex(of: "*") else { return 0 }
        guard let lastIndexOfDiv = exp.lastIndex(of: "/") else { return 0 }
        
        if (lastIndexOfAdd>lastIndexOfMinus && lastIndexOfAdd>lastIndexOfMul && lastIndexOfAdd>lastIndexOfDiv){
            indexReturned = lastIndexOfAdd.encodedOffset
        }
        if (lastIndexOfMinus>lastIndexOfAdd && lastIndexOfMinus>lastIndexOfMul && lastIndexOfMinus>lastIndexOfDiv){
            indexReturned = lastIndexOfMinus.encodedOffset
        }
        if (lastIndexOfMul>lastIndexOfAdd && lastIndexOfMul>lastIndexOfMinus && lastIndexOfMul>lastIndexOfDiv){
            indexReturned = lastIndexOfMul.encodedOffset
        }
        if (lastIndexOfDiv>lastIndexOfAdd && lastIndexOfDiv>lastIndexOfMinus && lastIndexOfDiv>lastIndexOfMul) {
            indexReturned = lastIndexOfDiv.encodedOffset
        }
        return indexReturned
    }
}
