//
//  FriendsTableViewController.swift
//  Friends 2
//
//  Created by Ilgar Ilyasov on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let delegate = NavigationControllerDelegate()
    let friendController = FriendController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = delegate
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        let friend = friendController.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name
        cell.imageView?.image = friend.image
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendSegue" {
            let destinationVC = segue.destination as! FriendDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let friend = friendController.friends[indexPath.row]
            
            delegate.sourceCell = tableView.cellForRow(at: indexPath)
            destinationVC.friend = friend
            destinationVC.delegate = delegate
        }
    }
    
}
