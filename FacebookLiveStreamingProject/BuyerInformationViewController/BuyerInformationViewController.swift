//
//  BuyerInformationViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/22.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class BuyerInformationViewController: UIViewController {
    
    let phoneNumberReuserId = "PhoneNumberCell"
    let addressReuseId = "AddressCell"
    let userDefault = UserDefaults.standard
    let activityProperty = ActivityView()
    var userInformation: [String] = []
    let url = Url.url
    
    var countryCode: [String] = []
    var phoneCode: [Int] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func confirmButton(_ sender: UIButton){
        
    }
    
    @IBAction func skipButton(_ sender: UIButton){
        
    }
    
    @IBAction func goBackButton(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        let phoneNumberNib = UINib(nibName: "PhoneNumberTableViewCell", bundle: nil)
        tableView.register(phoneNumberNib, forCellReuseIdentifier: phoneNumberReuserId)
        let addressNib = UINib(nibName: "AddressTableViewCell", bundle: nil)
        tableView.register(addressNib, forCellReuseIdentifier: addressReuseId)
        getUserInformation()
        startActivityAnmation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUserImageView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

