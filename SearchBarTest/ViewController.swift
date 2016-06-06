//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var testTableView: UITableView!
    @IBOutlet weak var testSearchBar: UISearchBar!
    
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
    
    //検索結果配列
    var searchResult = [String]()
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート先を自分に設定する。
        testSearchBar.delegate = self
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        testSearchBar.enablesReturnKeyAutomatically = false
        
        //検索結果配列にデータをコピーする。
        searchResult = dataList
    }
    
    
    
    //データを返すメソッド
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCellWithIdentifier("TestCell", forIndexPath:indexPath) as UITableViewCell
        cell.textLabel?.text = searchResult[indexPath.row]
        return cell
    }
    
    
    
    //データの個数を返すメソッド
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return searchResult.count
    }
    
    
    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //キーボードを閉じる。
        testSearchBar.endEditing(true)
    }
    
    
    //テキスト変更時の呼び出しメソッド
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //検索結果配列を空にする。
        searchResult.removeAll()
        
        if(testSearchBar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            searchResult = dataList
        } else {
            //検索文字列を含むデータを検索結果配列に追加する。
            for data in dataList {
                if data.containsString(searchText) {
                    searchResult.append(data)
                }
            }
        }
        
        //テーブルを再読み込みする。
        testTableView.reloadData()
    }
    
}
