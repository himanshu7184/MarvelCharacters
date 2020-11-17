//
//  CharactersTableViewCell.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 16/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import UIKit
import SDWebImage

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.addShadow()
    }

    func setCharacters(character: MarvelCharacters) {
        characterImage.sd_setImage(with: URL(string: character.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        characterName.text = character.name
        characterDescription.text = character.description
    }
    
}
