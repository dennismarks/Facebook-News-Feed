//
//  FriendRequestController.swift
//  Facebook News Feed
//
//  Created by Dennis M on 2019-09-09.
//  Copyright © 2019 Dennis M. All rights reserved.
//

import UIKit

class FriendsRequestController: UITableViewController {
    
    let headerId = "headerId"
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Friend Requests"

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }

}

