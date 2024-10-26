import SwiftUI
import SwiftData

struct NewJournal: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext // Add this line to access the model context

    @State private var journalTitle = ""
    @State private var journalContent = ""
    
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: Date())
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
                
                Text(currentDate)
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
                        // Create new JournalEntry and insert it into the context
                        let newEntry = JournalEntry(title: journalTitle, content: journalContent, date: Date())
                        
                        modelContext.insert(newEntry) // Insert the new entry into the model context

                        // Save the journal entry
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
#Preview {
    NewJournal()
}
