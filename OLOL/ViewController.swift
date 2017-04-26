//
//  ViewController.swift
//  OLOL
//
//  Created by User on 2017/04/26.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, TestDelegate {
    
    @IBOutlet weak var testTableView: UITableView!
    
    
    //表示データ
    var dataList = ["","","","","","","",""]
    
    //データを返すメソッド（スクロールなどでページを更新する必要が出るたびに呼び出される）
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for:indexPath) as UITableViewCell
        cell.textLabel?.text = dataList[indexPath.row]
        
        return cell
    }
    
    //データの個数を返すメソッド
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return dataList.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //自作セルをテーブルビューに登録する。
        let testXib = UINib(nibName:"TestTableViewCell", bundle:nil)
        testTableView.register(testXib, forCellReuseIdentifier:"TestCell")
        
    }
    
    //デリゲートメソッド
    func textFieldDidEndEditing(cell: TestTableViewCell, value:String) {
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

