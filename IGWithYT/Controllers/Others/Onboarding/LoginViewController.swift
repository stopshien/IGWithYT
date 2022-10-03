//
//  LoginViewController.swift
//  IGWithYT
//
//  Created by 沈庭鋒 on 2022/9/21.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController {

    struct Constants{
        static let conerRadius = 8.0
    }
    
    
    private let userNameEmailTextField : UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "UserName or Email..." //默認顯示在字串欄中的文字
        textField.returnKeyType = .next
        textField.leftViewMode = .always //靠左
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) //靠左的詳細畫面設定
        textField.autocapitalizationType = .none //設定鍵盤自動大小寫的屬性
        textField.autocorrectionType = .no //設定是否有自動修改的提示
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.conerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor

        return textField
        
        /*
         通常使用在設置cornerRadius不能達到圓角效果的控件上，如UIImageView、UILabel等。
         需要先設置maskToBounds = true 方可使用cornerRadius
         */
    }()
    
    private let passwordTextField : UITextField = {
        
        let textField = UITextField()
        textField.isSecureTextEntry = true //(隱藏密碼)
        textField.placeholder = "Password..." //默認顯示在字串欄中的文字
        textField.returnKeyType = .continue
        textField.leftViewMode = .always //靠左
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) //靠左的詳細畫面設定
        textField.autocapitalizationType = .none //設定鍵盤自動大小寫的屬性
        textField.autocorrectionType = .no //設定是否有自動修改的提示
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.conerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor

       
        return textField
    }()
    
    private let loginButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.conerRadius
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    
    private let termsButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Terms of Servies", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
        
    }()
    private let privacyButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel , for: .normal)
        return button
        
    }()
    private let createAccountButten : UIButton = {
        let button = UIButton()
        
        button.setTitle("New User? Create an Acccount", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        return button
        
    }()
    
    
    
    private let headerView : UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        let backgroundView = UIImageView(image: UIImage(named: "gradient"))
        view.addSubview(backgroundView)
        
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        createAccountButten.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)


        addSubViews()
        view.backgroundColor = .systemBackground
        
        
    }
    
    override func viewDidLayoutSubviews() {
        //assign frames
        headerView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height/3)
        userNameEmailTextField.frame = CGRect(x: 25, y: headerView.bottom + 40, width: view.width - 50, height: 52)
        passwordTextField.frame = CGRect(x: 25, y: userNameEmailTextField.bottom + 10, width: view.width - 50 ,height: 52)
        loginButton.frame = CGRect(x: 25, y: passwordTextField.bottom + 10, width: view.width - 50, height: 52)
        createAccountButten.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: view.width - 50 , height: 52)
        termsButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 100, width: view.width - 20, height: 52)
        privacyButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 50, width: view.width - 20, height: 52)

        
        configureHeadView()
    }
    
    private func configureHeadView(){
        guard headerView.subviews.count == 1 else{return}
        
        guard let backgroundView = headerView.subviews.first else{return}
        backgroundView.frame = view.bounds
        
        //add logo
        let imageView = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4, y: view.safeAreaInsets.top,
                                 width: headerView.width/2, height: headerView.height - view.safeAreaInsets.top)
        
   
        
    }
    
    private func addSubViews(){
        
        view.addSubview(userNameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButten)
        view.addSubview(headerView)
      
    }
 
    

     @objc private func didTapLoginButton(){
         
         passwordTextField.resignFirstResponder()
         userNameEmailTextField.resignFirstResponder()
         
         guard let userNameMail = userNameEmailTextField.text, !userNameMail.isEmpty,
               let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else{return}
     }
    
     @objc private func didTapTermsButton(){
         
         guard let url = URL(string: "https://zh-tw.facebook.com/help/instagram/581066165581870") else{return}
         
         let vc = SFSafariViewController(url: url)
         present(vc, animated: true)
         
     }
     @objc private func didTapPrivacyButton(){
         
         guard let url = URL(string: "https://privacycenter.instagram.com/policy") else{return}
         
         let vc = SFSafariViewController(url: url)
         present(vc, animated: true)
     }
     @objc private func didTapCreateAccountButton(){
         
         let vc = RegistrationViewController()
         present(vc, animated: true)
         
     }

     

}

extension LoginViewController : UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameEmailTextField{
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField{

            didTapLoginButton() //要使用Firebase才能夠使用

        }
        return true
    }

}
