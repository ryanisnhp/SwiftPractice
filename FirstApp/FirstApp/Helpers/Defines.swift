//
//  Defines.swift
//  FirstApp
//
//  Created by Le Van Lam on 5/7/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

enum Size {
    case iPhone6Plus
    case iPhone6
    case iPhone5
    case iPhone4
}

extension Size {
    
    var width: CGFloat {
        switch self {
        case .iPhone6Plus: return 414.0
        case .iPhone6: return 375.0
        case .iPhone5: return 320.0
        case .iPhone4: return 320.0
        }
    }

    var height: CGFloat {
        switch self {
        case .iPhone6Plus: return 736.0
        case .iPhone6: return 667.0
        case .iPhone5: return 568.0
        case .iPhone4: return 480.0
        }
    }
    enum screen {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
        static let maxLength = max(screen.width, screen.height)
        static let minLength = min(screen.width, screen.height)
        static let halfWidth = screen.width / 2.0
        static let halfHeight = screen.height / 2.0
        static let oneThirdScreenWidth = screen.width / 3.0
        static let quarterScreenWidth = screen.width / 4.0
    }
}

enum Device {
    case iPhone4OrLess
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPad
    case iPadRetina
}

extension Device {
    var type: Bool {
        switch self {
        case .iPhone4OrLess:
            return UIDevice.current.userInterfaceIdiom == .phone && Size.screen.maxLength < 568.0
        case .iPhone5:
            return UIDevice.current.userInterfaceIdiom == .phone && Size.screen.maxLength == 568.0
        case .iPhone6:
            return UIDevice.current.userInterfaceIdiom == .phone && Size.screen.maxLength == 667.0
        case .iPhone6Plus:
            return UIDevice.current.userInterfaceIdiom == .phone && Size.screen.maxLength == 736.0
        case .iPad:
            return UIDevice.current.userInterfaceIdiom == .pad && Size.screen.maxLength == 1024.0
        case .iPadRetina:
            return UIDevice.current.userInterfaceIdiom == .pad && Size.screen.maxLength == 2048.0
        }
    }
    
    static func equal(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: String.CompareOptions.numeric) == ComparisonResult.orderedSame
    }
    
    static func greaterThan(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: String.CompareOptions.numeric) == ComparisonResult.orderedDescending
    }
    
    static func greaterThanOrEqual(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: String.CompareOptions.numeric) != ComparisonResult.orderedAscending
    }
    
    static func lessThan(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: String.CompareOptions.numeric) == ComparisonResult.orderedAscending
    }
    
    static func lessThanOrEqual(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: String.CompareOptions.numeric) != ComparisonResult.orderedDescending
    }
}
