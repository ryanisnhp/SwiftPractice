//
//  SwiftMergeSort.swift
//  SwiftMergeSort
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

/*
 The merge sort algorithm works as follows:
 1. Split in half
 2. Keep splitting
 3. Merge
 */

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [T] = []
    
    //1
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex = leftIndex + 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex = rightIndex + 1
        } else {
            orderedArray.append(leftElement)
            leftIndex = leftIndex + 1
            orderedArray.append(rightElement)
            rightIndex = rightIndex + 1
        }
    }
    //2
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex = leftIndex + 1
    }
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex = rightIndex + 1
    }
    return orderedArray
}

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}
