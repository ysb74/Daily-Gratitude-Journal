import SwiftUI

struct AddEntryView: View {
    @Environment(\.managedObjectContext) private var viewContext // Core Data context
    @Environment(\.dismiss) var dismiss // For dismissing the sheet

    @State private var newEntryText: String = "" // State for the text field input

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $newEntryText) // Multi-line text input
                    .padding()
                    .frame(minHeight: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding()
                    .background(Color(.systemBackground)) // Ensure background is visible
                    .cornerRadius(8) // Rounded corners for the text editor itself

                Spacer()

                Button(action: saveEntry) {
                    Text("Save Entry")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(newEntryText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.blue) // Disable button if text is empty
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(newEntryText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) // Disable button
            }
            .navigationTitle("New Gratitude")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss() // Dismiss the sheet without saving
                    }
                }
            }
        }
    }

    private func saveEntry() {
        // Trim whitespace and check if the entry is effectively empty
        let trimmedText = newEntryText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return } // Prevent saving empty entries

        let newEntry = GratitudeEntry(context: viewContext) // Create a new Core Data object
        newEntry.timestamp = Date() // Set current timestamp
        newEntry.text = trimmedText // Set the text from input

        do {
            try viewContext.save() // Save to Core Data
            dismiss() // Dismiss the sheet
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
