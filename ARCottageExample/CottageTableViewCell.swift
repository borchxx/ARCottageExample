//
//  CottageTableViewCell.swift
//  ARCottageExample
//
//  Created by admin on 4/21/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CottageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var imageCottage: UIImageView!
    @IBOutlet weak var nameCottageLanbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainContentView.layer.cornerRadius = 15
        mainContentView.layer.masksToBounds = true
    }
    
    func createCell(nameImage: String){
        imageCottage.image = UIImage(named: nameImage)
        nameCottageLanbel.text = nameImage
    }
}
