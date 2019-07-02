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
        
        tableView.sectionHeaderHeight = 26
        
        tableView.register(FriendRequestHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! FriendRequestHeader
        return header
    }

}

class FriendRequestHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "FRIEND REQUESTS"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(white: 0.4, alpha: 1)
        return label
    }()
    
    let bottomBorderWidth: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(229, green: 231, blue: 235)
        return view
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(bottomBorderWidth)
        
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: bottomBorderWidth)
        
        addConstraintsWithFormat("V:|[v0][v1(0.5)]|", views: nameLabel, bottomBorderWidth)
        
    }
    
}
