//
//  BookmarkManager.swift
//  JournalAppTest
//
//  Created by Sumayah Alqahtani on 23/04/1446 AH.
//

import Foundation

struct BookmarkManager {
    static func saveBookmarkState(entryId: String, isBookmarked: Bool) {
        UserDefaults.standard.set(isBookmarked, forKey: entryId)
    }

    static func loadBookmarkState(entryId: String) -> Bool {
        return UserDefaults.standard.bool(forKey: entryId)
    }
}
