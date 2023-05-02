import SwiftUI

struct NewChecklistItemView: View {
    
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Adicionar novo item")
            Form {
                ///Texto("Digite o nome do item")
                TextField("Digite o nome do novo item aqui", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Adicionar novo item")
                    }   // Fim do HStack
                }   // Fim do Button
                .disabled(newItemName.count == 0)
            }   // Fim do Form
            Text("Deslize para baixo para cancelar")
        }   // Fim do VStack
        .onAppear() {
            print("NewChecklistItemView apareceu!")
        }   // Fim do .onAppear()
        .onDisappear() {
            print("NewChecklistItemView desapareceu!")
        }   // Fim do .onDisappear()
    }   // Fim do corpo
} // Fim da View

struct NewChecklistItemView_Previews: PreviewProvider {
static var previews: some View {
NewChecklistItemView(checklist: Checklist())
}
}
