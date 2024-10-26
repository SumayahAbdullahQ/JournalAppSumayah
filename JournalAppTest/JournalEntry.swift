//
//  JournalEntry.swift
//  JournalAppTest
//
//  Created by Sumayah Alqahtani on 21/04/1446 AH.
//

import SwiftData
import Foundation

@Model
class JournalEntry {
    var title: String
    var content: String
    var date: Date

    init(title: String, content: String, date: Date, bookmarked: Bool = false) {
        self.title = title
        self.content = content
        self.date = date
    }
}
