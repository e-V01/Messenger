//
//  ViewController.swift
//  Messenger
//
//  Created by Y K on 18.07.2023.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DatabaseManager.shared.test()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
            validateAuth()
    }
    
//        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        
        private func validateAuth() {
            if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    

}

