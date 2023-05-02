
// Importe a estrutura UIKit que contém classes para criar interfaces gráficas do usuário em aplicativos iOS.
import UIKit

// A classe AppDelegate fornece o ponto de entrada para o aplicativo e gerencia o ciclo de vida do aplicativo.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    // Esta função é chamada quando o aplicativo é lançado e fornece um local para personalização adicional após o lançamento do aplicativo.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    // Esta função é chamada quando uma nova sessão de cena está sendo criada. Use esta função para selecionar uma configuração para criar a nova cena.
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    // Esta função é chamada quando o usuário descarta uma sessão de cena. Use esta função para liberar quaisquer recursos específicos das cenas descartadas, pois eles não retornarão.
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
}

