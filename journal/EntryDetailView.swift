import SwiftUI

struct EntryDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext // Core Data context for potential edits/deletes
    @Environment(\.dismiss) var dismiss // For dismissing this view (after delete)

    @ObservedObject var entry: GratitudeEntry // The specific entry passed from ContentView

    @State private var showingEditSheet = false // State for showing edit sheet
    @State private var showingDeleteConfirmation = false // State for showing delete confirmation alert

    var body: some View {
        ScrollView { // Use ScrollView for potentially long entries
            VStack(alignment: .leading, spacing: 10) {
                Text(entry.timestamp ?? Date(), formatter: detailedItemFormatter) // Display formatted date
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(entry.text ?? "No Content") // Display the full entry text
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading) // Ensure text aligns left and fills width==
            }
            .padding()
        }
        .navigationTitle("Gratitude Entry")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        showingEditSheet = true
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    Button(role: .destructive) { // Destructive role for delete button
                        showingDeleteConfirmation = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle") // More options icon
                }
            }
        }
        .sheet(isPresented: $showingEditSheet) {
            EditEntryView(entry: entry) // Pass the entry to the edit view
                .environment(\.managedObjectContext, viewContext)
        }
        .alert("Delete Entry", isPresented: $showingDeleteConfirmation) {
            Button("Delete", role: .destructive) {
                deleteEntry()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to delete this gratitude entry?")
        }
    }

    private func deleteEntry() {
        viewContext.delete(entry) // Delete the entry from context
        do {
            try viewContext.save() // Save changes
            dismiss() // Dismiss the detail view after deletion
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

// Formatter for more detailed date/time display
private let detailedItemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full // e.g., "Saturday, June 22, 2025"
    formatter.timeStyle = .short // e.g., "9:41 AM"
    return formatter
}()

// Helper for Preview, since EntryDetailView needs an actual GratitudeEntry
struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a temporary Core Data context for preview
        let context = PersistenceController.preview.container.viewContext
        let newEntry = GratitudeEntry(context: context)
        newEntry.timestamp = Date()
        newEntry.text = "Preview Gratitude: I am grateful for the sunshine today and a productive coding session."

        return NavigationView {
            EntryDetailView(entry: newEntry)
                .environment(\.managedObjectContext, context)
        }
    }
}

// MARK: - Edit Entry View (Nested for simplicity in this example, could be a separate file)
struct EditEntryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss

    @ObservedObject var entry: GratitudeEntry // The entry to be edited
    @State private var editedText: String // State for the text field in edit mode

    init(entry: GratitudeEntry) {
        self.entry = entry
        _editedText = State(initialValue: entry.text ?? "") // Initialize state with existing text
    }

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $editedText)
                    .padding()
                    .frame(minHeight: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(8)

                Spacer()

                Button(action: saveEdit) {
                    Text("Save Changes")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(editedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(editedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .navigationTitle("Edit Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveEdit() {
        let trimmedText = editedText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }

        entry.text = trimmedText // Update the entry's text
        entry.timestamp = Date() // Optionally update timestamp on edit (good practice)

        do {
            try viewContext.save()
            dismiss()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
