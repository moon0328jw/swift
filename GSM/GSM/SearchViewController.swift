//
//  SearchViewController.swift
//  GSM
//
//  Created by 문주원 on 2020/11/05.
//

import UIKit
import Alamofire
import Kingfisher

class SearchViewController: UIViewController {
    
    var model: AppstoreModel?
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let term = "kakao"
    }
    
    func apiCall(term: String) {
        let url = "https://itunes.apple.com/search?term=\(term)&entity=software&country=kr"
        let encodingURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        AF.request(encodingURL).responseData(completionHandler: { data in
            guard let data = data.data else { return }
            self.model = try? JSONDecoder().decode(AppstoreModel.self, from: data)
            print(self.model)
            self.tableView.reloadData()
        })
    }
    
    @IBAction func searchTextFieldEditingChanged(_ sender: UITextField) {
        apiCall(term: sender.text!)
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AppstoreItemTableViewCell()
        cell.updateConstraintsIfNeeded()
        
        cell.titleLabel.text = model?.results[indexPath.row].trackName
        
        let thumbnailImageURL = model?.results[indexPath.row].artworkUrl100
        let url = URL(string: thumbnailImageURL!)
        cell.thumbnailImageView.kf.setImage(with: url)
        return cell
    }
}
