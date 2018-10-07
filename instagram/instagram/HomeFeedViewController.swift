//
//  HomeFeedViewController.swift
//  instagram
//
//  Created by Chris Q. on 10/1/18.
//  Copyright © 2018 Chris Q. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground(block: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                print("Successful logout")
                self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            }
        })
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

