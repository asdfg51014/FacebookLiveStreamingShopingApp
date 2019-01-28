//
//  CreateCommodityViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/25.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class WarehouseViewController: UIViewController {
    
    let ccvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CCVC")
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var createCommodityButtonOutlet: UIButton!
    
    @IBAction func goBackButton(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createCommodityButton(_ sender: UIButton){
        navigationController?.pushViewController(ccvc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "CreateCommodityTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    


}
