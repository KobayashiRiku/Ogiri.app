//
//  TimeLineViewController.swift
//  Ogiri
//
//  Created by kobayashi on 2019/10/08.
//  Copyright © 2019 kobayashi riku. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TimeLineViewController:
        UIViewController{
//      UITableViewDelegate,
//      UITableViewDataSource {


    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var timeLineTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        timeLineTableView.delegate = self
//        timeLineTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //認証状態をリッスン
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          
            
            
        }
        
    }

    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1

    }


//    //セクションの中のセルの数(必須)
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//
//
//    }
//
//    //セルをどうやって構築するか(必須)
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//
//    }



}