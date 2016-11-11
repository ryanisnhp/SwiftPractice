//
//  Predictions.swift
//  AlamofireDemo
//
//  Created by Lam Le Van on 11/11/16.
//  Copyright © 2016 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

private let kPredictions = "predictions"
private let kDescription = "description"
private let kID = "id"
private let kMatchedSubstrings = "matched_substrings"
private let kLength = "length"
private let kOffset = "offset"
private let kPlaceID = "place_id"
private let kReference = "reference"
private let kStructuredFormatting = "structured_formatting"
private let kMainText = "main_text"
private let kMainTextMatchedSubstrings = "main_text_matched_substrings"
private let kTerms = "terms"
private let kType = "types"
private let kValue = "value"
private let kSecondaryText = "secondary_text"

class Predictions: Mappable {
    
    var place: [Place] = []
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        place <- map[kPredictions]
    }
}

struct Place: Mappable {
    
    var description: String?
    var id: String?
    var placeID: String?
    var type: [String] = []
    var machedSubstring: [MachedSubstring] = []
    var structedFormatString: StructedFormatString?
    var terms: [Terms] = []
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        description <- map[kDescription]
        id <- map[kID]
        machedSubstring <- map[kMatchedSubstrings]
        placeID <- map[kPlaceID]
        structedFormatString <- map[kStructuredFormatting]
        terms <- map[kTerms]
        type <- map[kType]
    }
}

struct MachedSubstring: Mappable {
    
    var length: Int?
    var offset: Int?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        length <- map[kLength]
        offset <- map[kOffset]
    }
}

struct StructedFormatString: Mappable {
    
    var mainTextMatchedSubstrings: [MainTextMatchedSubstrings] = []
    var secondaryText: String?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        mainTextMatchedSubstrings <- map[kMainTextMatchedSubstrings]
        secondaryText <- map[kSecondaryText]
    }
}

struct MainTextMatchedSubstrings: Mappable {
    
    var length: Int?
    var offset: Int?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        length <- map[kLength]
        offset <- map[kOffset]
    }
}

struct Terms: Mappable {
    
    var offset: Int?
    var value: String?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        offset <- map[kOffset]
        value <- map[kValue]
    }
}
