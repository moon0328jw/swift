//
//  AppstoerModel.swift
//  GSM
//
//  Created by 문주원 on 2020/11/12.
//

import Foundation
struct AppstoreModel: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let artworkUrl100: String
    let trackName: String
}
