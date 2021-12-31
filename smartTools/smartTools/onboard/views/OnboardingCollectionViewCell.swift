//
//  OnboardingCollectionViewCell.swift
//  smartTools
//
//  Created by Nicholas Forte on 30/12/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    func setUp(_ slide: OnboardSlide) {
        imgView.image = slide.image
        lbTitle.text = slide.title
        lbDescription.text = slide.description
    }
    
}
