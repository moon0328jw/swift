//
//  VideoCollectionViewCell.swift
//  Tiktok
//
//  Created by 문주원 on 2021/04/28.
//

import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    var player: AVPlayer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: <#type#> ) {
        
    }
}
