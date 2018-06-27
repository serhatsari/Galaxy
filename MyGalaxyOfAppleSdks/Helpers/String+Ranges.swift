//
//  String+Ranges.swift
//  MyGalaxyOfAppleSdks
//
//  Created by Serhat Sarı on 27.06.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
    func ranges<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var ranges: [Range<Index>] = []
        var start: Index = startIndex
        
        while let range = range(of: string, options: options, range: start..<endIndex) {
            ranges.append(range)
            start = range.upperBound
        }
        
        return ranges
    }
}
