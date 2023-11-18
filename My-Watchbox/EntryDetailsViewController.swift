//
//  EntryDetailsViewController.swift
//  My-Watchbox
//
//  Created by Audrey Lam on 11/16/23.
//

import UIKit

class EntryDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //navigationItem.largeTitleDisplayMode = .never
        print("ENTRY IS:::: \(String(describing: entry))")
      
        if let entry = entry {
            titleLabel.text = entry.title
            ratingLabel.text = "Rating: \(entry.rating) / 5"
            noteTextView.text = entry.note
        } else {
            // entry is nil
            print("Error: no entry :(")
            dismiss(animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
