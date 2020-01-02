//
//  SignUpViewController.swift
//  Ogiri
//
//  Created by kobayashi on 2019/08/26.
//  Copyright © 2019 kobayashi riku. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseFirestore


class SignUpViewController:
      UIViewController,
      UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var emailText: String?
    var passwordText: String?
//    let db = Firestore.firestore()  //匿名ユーザーのドキュメントを追加するために定義(これで匿名ユーザーをTLで取得できるようになる)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    @IBAction func emailEditChanged(_ sender: UITextField) {
        
        self.emailText = sender.text
        self.validate()
        
    }
    
    
    @IBAction func passwordEditChanged(_ sender: UITextField) {
        
        self.passwordText = sender.text
        self.validate()
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        //メアドとパスでアカウント作成
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                
                // エラー
                
            }
            
            //navigationControllerで画面遷移
            let UserNameVC = self.storyboard?.instantiateViewController(withIdentifier: "unvc")  as! UserNameViewController
            
            //値渡し
            UserNameVC.emailText2 = self.emailText
            self.navigationController?.pushViewController(UserNameVC, animated: true)
            
        }
        
    }
    
    
    
    
    
    
    @IBAction func play(_ sender: Any) {
        
        //匿名ログイン
        Auth.auth().signInAnonymously() { (authResult, error) in

            let anonymousUser = authResult?.user
            print(anonymousUser as Any)
            
//            var ref: DocumentReference? = nil
//
//            // ログインされていること確認する
//            guard let userID = Auth.auth().currentUser?.uid else { fatalError() }
//
//                ref = self.db.collection("users").document(userID)
//
//                //TLで匿名ユーザーのみを取得するために「"Anonymous": true」というフィールドを追加
//                ref?.setData (["Anonymous": true], merge: true) { error in
//
//                    if let error = error {
//                        print("Error setData document: \(error)")
//                    } else {
//                        print("Document successfully setData")
//                    }
//                }
        }
        
        //navigationControllerで画面遷移
//        let PlayVC = self.storyboard?.instantiateViewController(withIdentifier: "playvc")  as! PlayViewController
//
//        self.navigationController?.pushViewController(PlayVC, animated: true)
        
        //テスト
        let tabbarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarControllerID")  as! UITabBarController
        tabbarController.selectedIndex = 1
        self.navigationController?.pushViewController(tabbarController, animated: true)
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        //navigationControllerで画面遷移
        let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginvc")  as! LoginViewController
        
        self.navigationController?.pushViewController(LoginVC, animated: true)
        
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
    
    //UserNameViewControllerに値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let userNameVC = segue.destination as! UserNameViewController
        
        userNameVC.emailText2 = emailTextField.text
        userNameVC.passwordText2 = passwordTextField.text
        
    }
    
    
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    //リターンでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
    }
    
    func getUsers() {
        
        
        
    }
    
}
