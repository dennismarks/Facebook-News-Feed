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
        tableView.separatorColor = UIColor.rgb(229, green: 231, blue: 235)
        
        tableView.register(FriendRequestHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(FriendRequestCell.self, forCellReuseIdentifier: cellId)
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FriendRequestCell
        
        if indexPath.row % 3 == 0 {
            cell.nameLabel.text = "Mark Zuckerberg"
            cell.profileImage.image = UIImage(named: "zuckprofile")
        } else if indexPath.row % 3 == 1 {
            cell.nameLabel.text = "Steve Jobs"
            cell.profileImage.image = UIImage(named: "steve_profile")
        } else {
            cell.nameLabel.text = "Mahatma Gandhi"
            cell.profileImage.image = UIImage(named: "gandhi_profile")
        }
        
        cell.imageView?.backgroundColor = UIColor.black
        
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

class FriendRequestCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckprofile")
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Name"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = UIColor.rgb(87, green: 143, blue: 255)
        button.layer.cornerRadius = 2
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .normal)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return button
    }()
    
    func setupViews() {
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        addConstraintsWithFormat("H:|-16-[v0(52)]-8-[v1]|", views: profileImage, nameLabel)
        addConstraintsWithFormat("H:|-76-[v0(80)]-8-[v1(80)]", views: confirmButton, deleteButton)
        
        addConstraintsWithFormat("V:|-4-[v0]-4-|", views: profileImage)
        addConstraintsWithFormat("V:|-8-[v0]-8-[v1(24)]-8-|", views: nameLabel, confirmButton)
        addConstraintsWithFormat("V:[v0(24)]-8-|", views: deleteButton)
        
    }
    
}
