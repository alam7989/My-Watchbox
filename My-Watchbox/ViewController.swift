//
//  ViewController.swift
//  My-Watchbox
//
//  Created by Audrey Lam on 11/16/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var entry_list = [Entry]() // initialized with a default value of an empty array
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide top cell separator
        tableView.tableHeaderView = UIView()

        // Set table view data source
        // Needed for standard table view setup:
        //    - tableView(numberOfRowsInSection:)
        //    - tableView(cellForRowAt:)
        // Also for swipe to delete row:
        //    - tableView(_:commit:forRowAt:)
        tableView.dataSource = self

        // Set table view delegate
        // Needed to detect row selection: tableView(_:didSelectRowAt:)
        tableView.delegate = self
    }
    
    // prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        let selectedEntry = entry_list[selectedRow]
        guard let detailViewController = segue.destination as? EntryDetailsViewController else { return }
        detailViewController.entry = selectedEntry
    }

} // END OF CLASS




// An extension to group all table view data source related methods
extension ViewController: UITableViewDataSource {

    // The number of rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entry_list.count
    }

    // Create and configure a cell for each row of the table view (i.e. each task in the tasks array)
    // 1. Dequeue a Task cell.
    // 2. Get the task for the associated row.
    // 3. Configure the cell with the task and add the code to be run when the complete button is tapped...
    //    i. Save the task passed back in the closure.
    //    ii. Refresh the tasks list to reflect the updates with the saved task.
    // 4. Return the configured cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as! EntryCellTableViewCell
        // 2.
        let entry = entry_list[indexPath.row]
        cell.titleLabel.text = entry.title
        cell.ratingLabel.text = "Rating: \(entry.rating) / 5"
        // 3.
//        cell.configure(with: entry, onCompleteButtonTapped: { [weak self] task in
//            // i.
//            task.save()
//            // ii.
//            self?.refreshTasks()
//        })
//        // 4.
        return cell
    }

    // Enable "Swipe to Delete" functionality. The existence of this data source method enables the default "Swipe to Delete".
    // 1. Handle the "delete" case:
    // 2. Remove the associated task from the tasks array.
    // 3. Save the updated tasks array.
    // 4. Tell the table view to delete the associated row.
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        // 1.
//        if editingStyle == .delete {
//            // 2.
//            tasks.remove(at: indexPath.row)
//            // 3.
//            Task.save(tasks)
//            // 4.
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
}

// MARK: - Table View Delegate Methods

// An extension to group all table view delegate related methods
extension ViewController: UITableViewDelegate {
    
    // The table view delegate method called when a row is selected.
    // In this case, the user has tapped an existing task row and we want to segue them to the Compose View Controller to edit the associated task.
    // 1. Deselect the row so the row doesn't stay in the slected state. (This is just a design preference in this case).
    // 2. Get the task associated with the selected row.
    // 3. Perform the segue to the Compose View Controller (i.e. "ComposeSegue") passing in the selected task for the sender.
    //    - The sender can be any type and you can use it however you want. In this case we pass in the selected task so we can have easy access to it when preparing for navigation to the Compose View Controller when preparing for the segue in prepare(for:sender)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1.
        tableView.deselectRow(at: indexPath, animated: false)
        // 2.
        let selectedEntry = entry_list[indexPath.row]
        // 3.
        performSegue(withIdentifier: "ComposeSegue", sender: selectedEntry)
    }
    
}
    

