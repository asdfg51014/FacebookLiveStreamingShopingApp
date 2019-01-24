//
//  BuyerInformationViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/22.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class BuyerInformationViewController: UIViewController {
    
    let nameReuseId = "NameCell"
    let emailReuseId = "EmailCell"
    let phoneNumberReuserId = "PhoneNumberCell"
    let addressReuseId = "AddressCell"
    
    var userInformation: [String] = []
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var userImageView: UIImageView!
    
    let userDefault = UserDefaults.standard
    
    @IBAction func confirmButton(_ sender: UIButton){
        
    }
    
    @IBAction func skipButton(_ sender: UIButton){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        let nameNib = UINib(nibName: "NameTableViewCell", bundle: nil)
        tableView.register(nameNib, forCellReuseIdentifier: nameReuseId)
        let emailNib = UINib(nibName: "EmailTableViewCell", bundle: nil)
        tableView.register(emailNib, forCellReuseIdentifier: emailReuseId)
        let phoneNumberNib = UINib(nibName: "PhoneNumberTableViewCell", bundle: nil)
        tableView.register(phoneNumberNib, forCellReuseIdentifier: phoneNumberReuserId)
        let addressNib = UINib(nibName: "AddressTableViewCell", bundle: nil)
        tableView.register(addressNib, forCellReuseIdentifier: addressReuseId)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUserImageView()
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
