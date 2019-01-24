//
//  IdentityViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/21.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class IdentityViewController: UIViewController {
    
    let bivc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BIVC")
    
    
    @IBAction func sellerButton(_ sender: UIButton){
        
    }
    
    @IBAction func buyerButton(_ sender: UIButton){
        navigationController?.pushViewController(bivc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("IdentityViewController viewDidLoad")
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        print("identityViewController viewdidload")
    }
    
}
