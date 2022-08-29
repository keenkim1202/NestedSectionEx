//
//  Section.swift
//  NestedTableviewEx
//
//  Created by KEEN KIM on 2022/08/26.
//

import Foundation

struct Section {
    let title: String
    let subSection: [SubSection]
}

struct SubSection {
    let subSection: String
    let items: [String]
    var isExpanded: Bool = false
}

