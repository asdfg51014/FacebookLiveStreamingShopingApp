//
//  CreateCommodityViewControllerExtensions.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/25.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import UIKit

extension WarehouseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WarehouseTableViewCell
        
        return cell
    }
    
    
}

extension WarehouseViewController {
    
    
    
}
