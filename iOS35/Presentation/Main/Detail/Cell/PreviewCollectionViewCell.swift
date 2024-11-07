//
//  PreviewCollectionViewCell.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "preview")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
