//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var testTableView: UITableView!
    
    //データ
    let dataList = ["月刊コロコロコミック（小学館）",
        "コロコロイチバン！（小学館）",
        "最強ジャンプ（集英社）",
        "Vジャンプ（集英社）",
        "週刊少年サンデー（小学館）",
        "週刊少年マガジン（講談社）",
        "週刊少年ジャンプ（集英社）",
        "週刊少年チャンピオン（秋田書店）",
        "月刊少年マガジン（講談社）",
        "月刊少年チャンピオン（秋田書店）",
        "月刊少年ガンガン（スクウェア）", 
        "月刊少年エース（KADOKAWA）",
        "月刊少年シリウス（講談社）",
        "週刊ヤングジャンプ（集英社）",
        "ビッグコミックスピリッツ（小学館）",
        "週刊ヤングマガジン（講談社）"]
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //データを返すメソッド
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCellWithIdentifier("TestCell", forIndexPath:indexPath) as UITableViewCell
        
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
    
    
    //データの個数を返すメソッド
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return dataList.count
    }

}

