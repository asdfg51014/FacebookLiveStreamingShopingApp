//
//  SellerMenuViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/25.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class SellerMenuViewController: UIViewController {
    
    let wvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WVC")
    
    @IBAction func goBackButton(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func warehouseButton(_ sender: UIButton){
        navigationController?.pushViewController(wvc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
