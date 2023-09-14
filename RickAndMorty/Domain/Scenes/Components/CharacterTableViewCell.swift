//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Felipe Lima on 13/09/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
