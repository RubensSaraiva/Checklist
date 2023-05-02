
import SwiftUI

struct ChecklistView: View {

    // Observa as mudanças no objeto "checklist"
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false

    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { index in
                    // Passa uma binding para a linha de lista "RowView"
                    RowView(checklistItem: self.$checklist.items[index])
                } // Fim do ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            } // Fim da lista
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible=true}){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Adicionar Item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Checklist")
            //.onAppear() {
            //    self.checklist.printChecklistContents()
            //}
        } // Fim do NavigationView
        // Abre a tela para adicionar um novo item de checklist
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            NewChecklistItemView(checklist: self.checklist)
        }
        .onAppear() {
            print("ChecklistView apareceu!")
        }   // Fim do .onAppear()
        .onDisappear() {
            print("ChecklistView desapareceu!")
        }   // Fim do .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            // Salva a lista de itens de checklist antes de o aplicativo entrar em segundo plano
            self.checklist.saveChecklistItems()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)){
            _ in print("didEnterBackgroundNotification")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)){
            _ in print("willEnterForegroundNotification")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)){
            _ in print("didBecomeActiveNotification")
        }
    } // Fim do body
} // Fim do ContentView

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
ChecklistView()
}
}

