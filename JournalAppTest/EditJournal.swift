//
//  EditJournal.swift
//  JournalAppTest
//
//  Created by Sumayah Alqahtani on 22/04/1446 AH.
//
import SwiftUI
import SwiftData

struct EditJournal: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext

    @Binding var journalEntry: JournalEntry
    @State private var journalTitle: String
    @State private var journalContent: String
    
    // Format the date for display
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: journalEntry.date)
    }

    init(journalEntry: Binding<JournalEntry>) {
        self._journalEntry = journalEntry
        self._journalTitle = State(initialValue: journalEntry.wrappedValue.title)
        self._journalContent = State(initialValue: journalEntry.wrappedValue.content)
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    if journalTitle.isEmpty {
                        Text("Title")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(Color(hex: "#3E3E3E"))
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                    TextField("", text: $journalTitle)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }

                // Display the date
                Text(formattedDate)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: "#A39A9A"))
                    .padding(.horizontal, 20)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $journalContent)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .regular))
                        .padding(.horizontal)
                        .background(Color.black)
                        .cornerRadius(8)
                        .padding(.top, 10)
                        .frame(maxHeight: .infinity)
                        .scrollContentBackground(.hidden)
                    if journalContent.isEmpty {
                        Text("Type your Journal...")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(Color(hex: "#4F4F4F"))
                            .padding(.horizontal)
                            .padding(.vertical, 20)
                    }
                }

                Spacer()
            }
            .background(Color.black)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color(hex: "#A499FF"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        journalEntry.title = journalTitle
                        journalEntry.content = journalContent
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color(hex: "#A499FF"))
                }
                
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}

//#Preview {
//    EditJournal()
//}
