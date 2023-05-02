
import SwiftUI

struct EditChecklistItemView: View {
    // Propriedades
    // ==========
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form {
            TextField("Nome", text: $checklistItem.name)
            Toggle("Concluído", isOn: $checklistItem.isChecked)
        }   // Fim do Form
        .onAppear() {
            print("EditChecklistItemView apareceu!")
        }   // Fim do .onAppear()
        .onAppear() {
            print("EditChecklistItemView desapareceu!")
        }   // Fim do .onAppear()
    }   // Fim do body
} // Fim da estrutura

struct EditChecklistItemView_Previews: PreviewProvider {
static var previews: some View {
EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Item de amostra")))
}
}
