//
//  SignUpViewController.swift
//  Ogiri
//
//  Created by kobayashi riku on 2019/08/26.
//  Copyright © 2019 kobayashi riku. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController:
      UIViewController,
      UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var emailText: String?
    var passwordText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
//        //未入力の状態で「次へ」を押せなくする
//        nextButton.isEnabled = false
        
    }
 
    

//    //テキストフィールがタップされ、入力可能になったあと
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        nextButton.isEnabled = false
//
//    }



//    //キーボードを閉じたあと
//    func textFieldDidEndEditing(_ textField:UITextField){
//
//        if emailTextField.text != "" && passwordTextField.text != "" {
//
//                            nextButton.isEnabled = true
//
//                    }else{
//
//                            nextButton.isEnabled = false
//
//                      }
//
//    }
    
    @IBAction func emailEditChanged(_ sender: UITextField) {
        
        self.emailText = sender.text
        self.validate()
        
    }
    
    
    @IBAction func passwordEditChanged(_ sender: UITextField) {
        
        self.passwordText = sender.text
        self.validate()
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        //メアドとパスをアプリ内に保存
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
//            if error != nil{
//
//                print(error as Any)
//
//
//            }else{
//
//                // 次の画面へ遷移
//                self.performSegue(withIdentifier: "toUserNameVC", sender: nil)
//
//            }
            
        }
        
    }
    
    
    
    
    
    
    @IBAction func play(_ sender: Any) {
        
        Auth.auth().signInAnonymously() { (authResult, error) in

            let anonymousUser = authResult?.user
            print(anonymousUser)

        }
        
    }
    
    func validate() {
        
        // nilの場合は「次へ」を非活性に
            guard let emailTxt = self.emailText,
                  let passTxt = self.passwordText else {
                    
                    self.nextButton.isEnabled = false
                      return
                      
            }
        
            // 文字数が0の場合(""空文字)registButtonを非活性に
            if emailTxt.count == 0 || passTxt.count == 0 {
              
                self.nextButton.isEnabled = false
                return
              
            }
            
            // nilでないかつ0文字以上はregistButtonを活性に
            self.nextButton.isEnabled = true
        
    }
    
    
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    //リターンでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
    }
    
    
}
