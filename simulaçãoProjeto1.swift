//MainViewController.swift"

import UIKit

enum Generofilme: String {
    case terror
    case comédia
    case acao
    case infantil
}

var listagenero:[Generofilme] = []

func addGen(_ genero: Generofilme) {
   listagenero.append(genero)
}

func listarGeneros(){
    print("Gêneros de filmes:")
    for genero in listagenero{
        print("- \(genero.rawValue.capitalized)")
    }
}

//simulaçao  aplicativo iOS programaticamente
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

// simulação  tela inicial
class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Lista de Gêneros"
        
        let listarGenerosButton = UIButton(type: .system)
        listarGenerosButton.setTitle("Listar Gêneros", for: .normal)
        listarGenerosButton.addTarget(self, action: #selector(listarGenerosButtonPressed), for: .touchUpInside)
        
        let adicionarGeneroButton = UIButton(type: .system)
        adicionarGeneroButton.setTitle("Adicionar Gênero", for: .normal)
        adicionarGeneroButton.addTarget(self, action: #selector(adicionarGeneroButtonPressed), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [listarGenerosButton, adicionarGeneroButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func listarGenerosButtonPressed() {
        listarGeneros()
    }
    
    @objc func adicionarGeneroButtonPressed() {
        adicionarGenero(.ficcaoCientifica)
        print("Gênero adicionado: Ficção Científica")
        listarGeneros()
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        return true
    }
}






