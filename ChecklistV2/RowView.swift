import SwiftUI

struct RowView: View {
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)){
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "⬛️")
            }   // Fim do HStack
        }   // Fim do NaviationLink
    }   // Fim da View
}

struct RowView_Previews: PreviewProvider {
static var previews: some View {
RowView(checklistItem: .constant(ChecklistItem(name: "item de exemplo")))
}
}
