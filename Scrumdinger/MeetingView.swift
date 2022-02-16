//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Shawn Shivdat on 2/15/22.
//

import SwiftUI
import CoreData

struct MeetingView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack{

                ProgressView(value: 5, total: 15)
                HStack {
                    VStack(alignment: .leading){
                        Text("Seconds Elapsed")
                            .font(.caption)
                        Label("300", systemImage: "hourglass.bottomhalf.fill")
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("Seconds Remaining")
                            .font(.caption)
                        Label("600", systemImage: "hourglass.tophalf.fill")
                    }
                }
                .accessibilityElement(children:.ignore)
                .accessibilityLabel("Time remaining")
                .accessibilityValue("10 minutes")
                Circle()
                    .strokeBorder(lineWidth: 24)
                HStack{
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action:{}) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                    
                }
                .padding()
            }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
