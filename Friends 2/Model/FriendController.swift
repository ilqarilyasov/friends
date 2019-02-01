//
//  FriendController.swift
//  Friends 2
//
//  Created by Ilgar Ilyasov on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FriendController {
    
    init() {
        create()
    }
    
    private(set) var friends: [Friend] = []
    
    private func create() {
        let friend = Friend(name: "Mark", image: UIImage(named: "Mark")!, about: "iOS developer")
        friends.append(friend)
    }
}
