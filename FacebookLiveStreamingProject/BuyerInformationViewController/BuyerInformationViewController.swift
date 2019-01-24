//
//  BuyerInformationViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/22.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class BuyerInformationViewController: UIViewController {
    
    var userInformation: [String] = []
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBAction func confirmButton(_ sender: UIButton){
        
    }
    
    @IBAction func skipButton(_ sender: UIButton){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUserImageView()
    }
    
}

extension BuyerInformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BuyerInformationTableViewCell
        
        cell.textLabel?.text = "123"
        return cell
    }
    
    
    
    
}


extension BuyerInformationViewController {
    
    func setUserImageView(){
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.borderColor = UIColor.lightGray.cgColor
        userImageView.layer.borderWidth = 3
    }
    
//    func getUserInformation(){
//        Requests.getRequset(api: <#T##String#>, header: <#T##[String : String]#>, callBack: <#T##([String : Any]) -> Void#>)
//    }
    
}
