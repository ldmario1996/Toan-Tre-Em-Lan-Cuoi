//
//  VMP3.swift
//  Toan tre em lai
//
//  Created by Thang Le on 7/15/16.
//  Copyright © 2016 Thang Le. All rights reserved.
//

import UIKit

class VMP3: UIViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelZing: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            imageLogo.alpha = 0
            labelZing.alpha = 0
            labelTop.alpha = 0
            self.navigationController?.navigationBarHidden = true
            // Do any additional setup after loading the view, typically from a nib.
        }
        override func viewWillAppear(animated: Bool) {
            
            super.viewWillAppear(animated)
            UIView.animateWithDuration(4, animations: {self.imageLogo!.alpha = 1 })
            {  (finished) in
                UIView.animateWithDuration(3, animations: {
                    self.labelZing!.center = CGPointMake(self.imageLogo!.center.x
                        , 60)
                    self.labelZing!.alpha = 1
                }){
                    (finished) in
                    UIView.animateWithDuration(2, animations: {self.labelTop!.center = CGPointMake(self.labelTop!.center.x
                        , 600)
                        self.labelTop!.alpha = 1}){(finished) in
                            let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewLogin") as! VLogin
                            self.navigationController?.pushViewController(mainView, animated: true)
                            
                    }
                    }
                }
            }
        }
    


    