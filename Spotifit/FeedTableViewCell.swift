//
//  FeedTableViewCell.swift
//  Spotifit
//
//  Created by KagurazakaX on 6/1/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var playlistName: UILabel!
    
    @IBOutlet weak var playlistAuthor: UILabel!
    
    @IBOutlet weak var bpmValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
