import Foundation

class Checklist: ObservableObject {
    
    //Inicialização
    init() {
        loadChecklistItems()
    }
    /*@Published var items = [
     ChecklistItem(name: "Passear com o cachorro", isChecked: false),
     ChecklistItem(name: "Escovar os dentes", isChecked: false),
     ChecklistItem(name: "Passear com o cachorro", isChecked: true),
     ChecklistItem(name: "Treino de futebol", isChecked: false),
     ChecklistItem(name: "Passear com o cachorro", isChecked: true)
     ]*/
    
    @Published var items: [ChecklistItem] = []
    
    // Métodos
    func printChecklistContents(){
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet){
        items.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
    
    // Persistência de dados
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory = paths[0]
        print("O diretório de documentos é: \(directory)")
        return directory
    }
    
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Checklist.plist")
        print("O caminho do arquivo de dados é: \(filePath)")
        return filePath
    }
    
    // Salvar o arquivo
    func saveChecklistItems() {
        print("Salvando os itens da lista de verificação")
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            print("Itens da lista de verificação salvos")
        }
        catch {
            print("Erro ao codificar a lista de itens: \(error.localizedDescription)")
        }   // Fim do try
    }   // Fim da função
    
    // Carregar o arquivo
    func loadChecklistItems(){
        print("Carregando os itens da lista de verificação")
        
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ChecklistItem].self, from: data)
                print("Itens da lista de verificação carregados")
            }
            catch {
                print("Erro ao decodificar a lista de itens: \(error.localizedDescription)")
            }   // Fim do catch
        }   // Fim do if
    }   // Fim da função
}
