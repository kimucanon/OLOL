//
//  ViewController.swift
//  OLOL//
//  Created by User on 2017/04/26.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var testTableView: UITableView!
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue){
        
    }
    
    
    //表示データ
    var dataList : [String] = []
    
    //データを返すメソッド（スクロールなどでページを更新する必要が出るたびに呼び出される）
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for:indexPath) as! TestTableViewCell
        //        cell.textLabel?.text = dataList[indexPath.row]
        //        cell.plusButton.isHidden = true
        
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
    }
    
    //デリゲートメソッド
    private func textFieldDidEndEditing(cell: TestTableViewCell, value:String) {
        //変更されたセルのインデックスを取得する。
        let index = testTableView.indexPathForRow(at: cell.convert(cell.bounds.origin, to:testTableView))
        
        //データを変更する。
        dataList[index!.row] = value
        print(dataList)
    }
    
       
    
    
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
}

