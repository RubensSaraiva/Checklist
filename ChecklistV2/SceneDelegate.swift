// Importe a estrutura UIKit que contém classes para criar interfaces gráficas do usuário em aplicativos iOS.
import UIKit
// Importe a estrutura SwiftUI que permite criar interfaces de usuário declarativas para qualquer plataforma da Apple.
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    // Essa função é chamada quando a cena é criada e fornece um local para configurar e anexar a UIWindow `window` à UIWindowScene fornecida `scene`.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Se estiver usando um storyboard, a propriedade `window` será inicializada automaticamente e anexada à cena.
        // Este delegado não implica que a cena ou a sessão de conexão são novas (consulte `application: configurationForConnectingSceneSession` em vez disso).
        
        // Crie a visualização SwiftUI que fornece o conteúdo da janela.
        let contentView = ChecklistView()
        //let contentView = EditChecklistItemView()
        
        // Use um controlador de exibição UIHostingController como controlador de exibição raiz da janela.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    // Essa função é chamada quando a cena está sendo liberada pelo sistema. Isso ocorre logo após a cena entrar em segundo plano ou quando sua sessão é descartada.
    // Libere quaisquer recursos associados a esta cena que possam ser recriados na próxima vez que a cena se conectar.
    // A cena pode se reconectar posteriormente, já que sua sessão não foi necessariamente descartada (consulte `application: didDiscardSceneSessions` em vez disso).
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    // Essa função é chamada quando a cena mudou de um estado inativo para um estado ativo.
    // Use este método para reiniciar quaisquer tarefas que foram pausadas (ou ainda não iniciadas) quando a cena estava inativa.
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    // Essa função é chamada quando a cena mudará de um estado ativo para um estado inativo.
    // Isso pode ocorrer devido a interrupções temporárias (por exemplo, uma chamada telefônica recebida).
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    // Essa função é chamada quando a cena está passando do plano de fundo para o primeiro plano.
    // Use este método para desfazer as alterações feitas ao entrar em segundo plano.
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    // Essa função é chamada quando a cena está passando do primeiro plano para o plano de fundo.
    // Use este método para salvar dados, liberar recursos compartilhados e armazenar informações suficientes de estado específicas da cena
    // para restaurar a cena de volta ao seu estado atual.
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
}
