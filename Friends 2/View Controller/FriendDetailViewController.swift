//
//  FriendDetailViewController.swift
//  Friends 2
//
//  Created by Ilgar Ilyasov on 10/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    var friend: Friend?
    var delegate: NavigationControllerDelegate?
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    @IBAction func swipeToDismiss(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            delegate?.interactionController = UIPercentDrivenInteractiveTransition()
            navigationController?.popViewController(animated: true)
        case .changed:
            let translation = sender.translation(in: view)
            let percentage = abs(translation.x / view.bounds.width)
            delegate?.interactionController?.update(percentage)
        case .ended:
            if sender.velocity(in: view).x > 1.0 {
                delegate?.interactionController?.finish()
            } else {
                delegate?.interactionController?.cancel()
            }
            
            delegate?.interactionController = nil
        default:
            break
        }
    }
    
    private func updateViews() {
        guard let friend = friend, isViewLoaded else { return }
        
        title = friend.name
        nameLabel.text = friend.name
        aboutLabel.text = friend.about
        friendImageView.image = friend.image
    }
    
}
