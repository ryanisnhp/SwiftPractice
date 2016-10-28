//: Playground - noun: a place where people can play

import UIKit

//Nháûp vaìo mäüt maíng báút kyì sau âoï sao cheïp sang mäüt maíng khaïc våïi âiãöu kiãûn caïc pháön tæí leí âæåüc xãúp âáöu daîy cuía maíng. Sau âoï âæa maíng sao cheïp lãn maìn hçnh.
class AddArray {
    
    private var inputs: [Int] = []
    
    init(inputs: [Int]) {
        self.inputs = inputs
    }
    
    private var output: [Int] {
        var outputs = self.inputs
        var saveIndex = 0
        var temp = 0
        for i in 0..<outputs.count {
            if outputs[i] % 2 == 1 {
                var index = i
                if index > saveIndex {
                    repeat {
                        temp = outputs[index]
                        outputs[index] = outputs[index - 1]
                        outputs[index - 1] = temp
                        index = index - 1
                    } while (index > saveIndex)
                }
                saveIndex = saveIndex + 1
            }

        }
        return outputs
    }
    
}

let members = AddArray(inputs: [1, 2, 2, 3, 4, 6, 7, 743,2, 32,3, 32,5])
members.output
members.inputs
