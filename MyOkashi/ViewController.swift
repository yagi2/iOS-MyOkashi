//
//  ViewController.swift
//  MyOkashi
//
//  Created by Itsuki Aoyagi on 2021/06/08.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchText.delegate = self
        searchText.placeholder = "お菓子の名前を入力してください"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if let searchWord = searchBar.text {
            print(searchWord)
            searchOkashi(keyword: searchWord)
        }
    }
    
    func searchOkashi(keyword: String) {
        guard let keywordEncode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let requestUrl = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keywordEncode)&max=10&order=r") else {
            return
        }
        
        print(requestUrl)
    }
}
