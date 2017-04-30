//
//  TestTableViewCell.swift
//  OLOL
//
//  Created by User on 2017/04/26.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit

//デリゲート先に適用してもらうプロトコル
protocol TestDelegate {
    func textFieldDidEndEditing(cell:TestTableViewCell, value:String)
}


class TestTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var testTextField: UITextField!
   
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var plusButton: UILabel!
  
    
    var delegate:TestDelegate! = nil
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //テキストフィールドのデリゲート先を自分に設定する。
    testTextField.delegate = self    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //デリゲートメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //キーボードを閉じる。
        textField.resignFirstResponder()
        return true
    }
    
    
    //デリゲートメソッド
    //func textFieldDidEndEditing(_ textField: UITextField) {
        //テキストフィールドから受けた通知をデリゲート先に流す。
        //self.delegate.textFieldDidEndEditing(cell: self, value:textField.text!)
   // }
    
}
