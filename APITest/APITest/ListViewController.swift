//
//  ListViewController.swift
//  APITest
//
//  Created by 문주원 on 2020/10/13.
//

import UIKit

class ListViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        //1. 호핀 api 호출 위한 url 생성
        let url = "http://115.68.183.178:2029/hoppin/movies?order=releasedateasc&count=10&page=1&version=1&genreId="
        let apiURL: URL! = URL(string: url)
        
        //2. rest api 호출
        let apidata = try! Data(contentsOf: apiURL)
        
        //3. 데이터 전송 결과 로그로 출력
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result = \(log)")
        
        //4. json 객체 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            //5. 데이터 구조에 따라 차례대로 캐스팅하여 읽어옴
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            //6.Iterator 처리 하면서 API 데이터를 MovieVO 객체에 저장
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as? NSString)?.doubleValue)
                
                self.list.append(mvo)
            }
        } catch { }
    }
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        let title = cell.viewWithTag(101) as? UILabel
        let desc = cell.viewWithTag(102) as? UILabel
        let opendate = cell.viewWithTag(103) as? UILabel
        let rating = cell.viewWithTag(104) as? UILabel
        
        title?.text = row.title
        desc?.text = row.description
        opendate?.text = row.opendate
        rating?.text = "\(row.rating!)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다")
    }
}
