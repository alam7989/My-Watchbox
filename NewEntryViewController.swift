//
//  NewEntryViewController.swift
//  My-Watchbox
//
//  Created by Audrey Lam on 11/16/23.
//

import UIKit

class NewEntryViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        // Dismiss the NewEntryViewController.
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        // 1.
        guard let title = titleField.text,
              !title.isEmpty
        else {
            // i.
            presentAlert(title: "Oops...", message: "Make sure to add a title!")
            // ii.
            return
        }
        // 2.
        var task: Task
        // 3.
        if let editTask = taskToEdit {
            // i.
            task = editTask
            // ii.
            task.title = title
            task.note = noteField.text
            task.dueDate = datePicker.date
        } else {
            // 4.
            task = Task(title: title,
                        note: noteField.text,
                        dueDate: datePicker.date)
        }
        // 5.
        onComposeTask?(task)
        // 6.
        dismiss(animated: true)
    }
    
}
