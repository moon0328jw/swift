//
//  MealViewController.swift
//  gsmHungry
//
//  Created by 문주원 on 2020/12/07.
//

import UIKit
import Alamofire

class MealViewController: UIViewController {

    @IBOutlet weak var breakfastView: UIView!
    @IBOutlet weak var lunchView: UIView!
    @IBOutlet weak var dinnerView: UIView!
    @IBOutlet weak var allergieView: UIView!
    @IBOutlet weak var breakfastText: UILabel!
    @IBOutlet weak var lunchText: UILabel!
    @IBOutlet weak var dinnerText: UILabel!
    @IBOutlet weak var allergieText: UILabel!
    var model: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breakfastView.layer.cornerRadius = 10
        lunchView.layer.cornerRadius = 10
        dinnerView.layer.cornerRadius = 10
        allergieView.layer.cornerRadius = 10
        callApi()
    }
    
    func callApi() {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        var current_date_string = formatter.string(from: Date())
        
        let URL = "https://open.neis.go.kr/hub/mealServiceDietInfo?"+"KEY=564c3c66714c4385a7688ead9d8d19b7&Type=json&pIndex=1&pSize=3&ATPT_OFCDC_SC_CODE=F10&SD_SCHUL_CODE=7380292&MLSV_YMD=\(current_date_string)"
        
        let encodingURL = URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        AF.request(encodingURL).responseData(completionHandler: { data in
            guard let data = data.data else { return }
            self.model = try? JSONDecoder().decode(Welcome.self, from: data)
            let breakfastMenu = self.model?.mealServiceDietInfo[1].row![0].ddishNm.replacingOccurrences(of: "<br/>", with: "\n")
            let lunchMenu =  self.model?.mealServiceDietInfo[1].row![1].ddishNm.replacingOccurrences(of: "<br/>", with: "\n")
            let dinnerMenu = self.model?.mealServiceDietInfo[1].row![2].ddishNm.replacingOccurrences(of: "<br/>", with: "\n")
            
            self.breakfastText.text = breakfastMenu
            self.lunchText.text = lunchMenu
            self.dinnerText.text = dinnerMenu
            self.allergieText.text = "①난류 ②우유 ③메밀 ④땅콩 ⑤대두 ⑥밀 ⑦고등어 ⑧게 ⑨새우 ⑩돼지고기\n ⑪복숭아 ⑫토마토 ⑬아황산염 ⑭호두 ⑮닭고기 ⑯쇠고기 ⑰오징어 ⑱조개류"
        })
    }
}
