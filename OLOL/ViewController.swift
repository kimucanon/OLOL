//
//  ViewController.swift
//  OLOL//
//  Created by User on 2017/04/26.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, TestDelegate {
    
    @IBOutlet weak var testTableView: UITableView!
    
    
       
    @IBAction func unwindToTop(segue: UIStoryboardSegue){
        
    }
    
    var wordArray = [String]()
    
    let saveData = UserDefaults.standard
    
    
//    @IBAction func tourokuButton() {
//        let wordDictionary = [testTextField.text!]
//    }
    
    
    
    //表示データ
    var dataList : [String] = []
    
    //データを返すメソッド（スクロールなどでページを更新する必要が出るたびに呼び出される）
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for:indexPath) as! TestTableViewCell
        //        cell.textLabel?.text = dataList[indexPath.row]
        //        cell.plusButton.isHidden = true
        cell.delegate = self
        
        //一番下のセルにplusボタンを表示
        if indexPath.row == dataList.count {
            cell.plusButton.isHidden = false
        } else {
            cell.textLabel?.text = dataList[indexPath.row]
            cell.plusButton.isHidden = true
        }
        
        
        return cell
    }
    
    
    //データの個数を返すメソッド
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return dataList.count + 1
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        // [indexPath.row] から画像名を探し、UImage を設定
    //            self.performSegue(withIdentifier: "toTestViewController",sender: nil)
    //
    //    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toTestViewController",sender: nil)
    }
    
    
    
    
    
    //削除ボタン
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataList.remove(at: indexPath.row)
            testTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        testTableView.delegate = self
        testTableView.dataSource = self
        
        //自作セルをテーブルビューに登録する。
        let testXib = UINib(nibName:"TestTableViewCell", bundle:nil)
        testTableView.register(testXib, forCellReuseIdentifier:"TestCell")
        
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [String];()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    
    }
    
    
    func addCell(cell: TestTableViewCell, value: String) {
        //配列(dataList)に入力した単語（value）を追加
        dataList.append(value)
        saveData.set(dataList, forKey: "WORD")
        
        //testTableViewを更新(reload)
        testTableView.reloadData()
        
    }
    
    
    
    

//    //デリゲートメソッド
//    private func textFieldDidEndEditing(cell: TestTableViewCell, value:String) {
//        //変更されたセルのインデックスを取得する。
//        let index = testTableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to:testTableView))
//        
//        //データを変更する。
//        dataList[index!.row] = value
//        print(dataList)
//    }
//    
//    
//    func textFieldDidEndEditing(_ textField:UITextField){
//
//    
//    }
    
//    //デリゲートメソッド
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool
//    {
//        //キーボードを閉じる。
//        textField.resignFirstResponder()
//        
//        // Update Table Data
//        testTableView.beginUpdates()
////        testTableView.insertRowsAtIndexPaths([
////            NSIndexPath(forRow: dataList.count-1, inSection: 0)
////            ], withRowAnimation: .Automatic)
//        testTableView.endUpdates()
//        
//        
//        
//        return true
//    }
    
    
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
}

