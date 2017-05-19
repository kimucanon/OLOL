//
//  TestViewController.swift
//  OLOL
//
//  Created by User on 2017/04/30.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var meaningTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = #colorLiteral(red: 0.3071770208, green: 0.6086728457, blue: 0.7646534974, alpha: 1)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TestViewController.DismissKeyboard))
        view.addGestureRecognizer(tap)
        
       
    }
    
    func DismissKeyboard(){
        view.endEditing(true)
    }

    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
