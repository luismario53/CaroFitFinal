//
//  ViewController2.swift
//  CaroFit
//
//  Created by labcisco on 12/18/18.
//  Copyright © 2018 labcisco. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var pass: String!

    @IBOutlet weak var imageLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLogo.image = UIImage(named: "logotipo")!.imageWithSize(CGSize(width: 300, height: 120))
        // Do any additional setup after loading the view.
    }

    @IBAction func loginUser(_ sender: Any) {
            performSegue(withIdentifier: "homeSeguey", sender: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
