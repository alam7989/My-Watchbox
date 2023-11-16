//
//  EntryCellTableViewCell.swift
//  My-Watchbox
//
//  Created by Audrey Lam on 11/16/23.
//

import UIKit

class EntryCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // The entry associated with the cell
    var entry: Entry!
    
    // Initial configuration of the task cell
        // 1. Set the main task property
        // 2. Update the UI for the given task
    func configure(with entry: Entry) {
        // 1.
        self.entry = entry
        // 2.
        update(with: entry)
    }
    
    // Update the UI for the given task
        // The complete button's image has already been configured in the storyboard for default and selected states.
        // 1. Set the title and note labels
        // 2. Hide the note label if task.note property is empty. (This just helps the title label align with the completed button when there's no note)
        // 3. Set the text color based on the task completed state
        // 4. Set the "Completed" button's selected state based on the task's completed state.
        // 5. Set the button's tint color based on the task's completed state. (blue if complete, system gray if not)
    private func update(with entry: Entry) {
        // 1.
        titleLabel.text = entry.title
        ratingLabel.text = "Rating: \(entry.rating) / 5"
    }

}
