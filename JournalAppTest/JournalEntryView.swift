//
//  JournalEntryView.swift
//  JournalAppTest
//
//  Created by Sumayah Alqahtani on 21/04/1446 AH.
//

import SwiftUI

struct JournalEntryView: View {
    var journalEntry: JournalEntry
    @State private var isBookmarked = false // State to track bookmark status
    init(journalEntry: JournalEntry) {
        self.journalEntry = journalEntry
        _isBookmarked = State(initialValue: BookmarkManager.loadBookmarkState(entryId: journalEntry.title)) // Or use an ID
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Journal Entry Title
                Text(journalEntry.title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(Color(hex: "#D4C8FF")) // Title color as per the design
                
                Spacer() // Pushes bookmark to the right
                
                // Bookmark Icon (tap to toggle)
                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(isBookmarked ? Color(hex: "#D4C8FF") : Color(hex: "#D4C8FF"))
                    .font(.system(size: 24, weight: .regular))
                    .onTapGesture {
                        isBookmarked.toggle() // Toggle bookmark state on tap
                        BookmarkManager.saveBookmarkState(entryId: journalEntry.title, isBookmarked: isBookmarked)
                    }
            }

            // Journal Entry Date
            Text(journalEntry.date.formatted(date: .numeric, time: .omitted)) // Adjust date formatting if needed
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(hex: "#9F9F9F")) // Date color
            
            // Journal Entry Content Preview
            Text(journalEntry.content)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(Color(hex: "#FFFFFF"))
//                .lineLimit(3) // Show only the first 3 lines for a preview
//                .truncationMode(.tail) // Cut off content if too long
        }
        .frame(maxWidth: .infinity, alignment: .leading) // Ensure it takes full width
        .padding()
        .background(Color(hex: "#171719"))
        .cornerRadius(10)
        
    }
}

//#Preview {
//    JournalEntryView()
//}
