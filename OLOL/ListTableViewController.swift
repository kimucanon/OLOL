//
//  ListTableViewController.swift
//  OLOL
//
//  Created by User on 2017/05/03.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit



class ListTableViewController: UITableViewController {
    
    @IBOutlet var ListTableView: UITableView!
    
    
//○    var wordArray : [String] = []
//○
//○    var titleArray : [String] = []
//○
//○    let saveData = UserDefaults.standard
//○
//○    let titlesavedata = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//○        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        //UserDefaultsの値を取得し、titleItemに代入
        if UserDefaults.standard.object(forKey: "titleList") != nil {
            print("titleList")
            titleItem = UserDefaults.standard.object(forKey: "titleList") as! [String]
            print(titleItem)
        }
        
        
    }
    
    
    
    

    @IBAction func backToPink(segue: UIStoryboardSegue) {
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
    }

    
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "say",sender: nil)
    }


    
    
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        performSegue(withIdentifier: "say", sender: self)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 100
//    }
    
    //Tableに表示する行数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleItem.count
    }

    
    
    
    //テーブル（リスト）を下に引っ張って更新
    override func viewWillAppear(_ animated: Bool) {
//        super .viewWillAppear(animated)
//        if titlesavedata.array(forKey: "TITLE") != nil {
//        titleArray = titlesavedata.array(forKey: "TITLE") as! [String]
//        
//        print(titleArray)
//        
//    }
//        tableView.reloadData()
        
        ListTableView.reloadData()
    }

    
    

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
//
//        
//        return cell
//    }
    
    
    //各行へ値を表示する関数
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")as! ListTableViewCell
        cellValue .listLabel?.text = titleItem[indexPath.row]
        return cellValue
    }
        
    
    
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
