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
        
        tableView.dataSource = self
        
        tableView.delegate = self
    }
    
    
    // Refresh the tasks list each time the view appears in case any tasks were updated on the other tab.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshEntries()
    }
    
    
    // When the "New" button is tapped, perform the segue with id, "ComposeSegue".
    @IBAction func didTapNewTaskButton(_ sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    // Prepare for navigation to the New Entry View Controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // The segue ID was set in the storyboard.
        if segue.identifier == "ComposeSegue" {
            // Get the New Entry View Controller so we can configure it ahead of navigation
            // Since the segue is actually hooked up to the navigation controller that manages the NewEntryViewController, we need to access the navigation controller first
            if let composeNavController = segue.destination as? UINavigationController,
               // then get the actual NewEntryViewController via the navigation controller's `topViewController` property
               let composeViewController = composeNavController.topViewController as? NewEntryViewController {
                // Save the new entry and Refresh the tasks list
                composeViewController.onComposeEntry = { [weak self] entry in
                    entry.save()
                    self?.refreshEntries()
                }
            }
        }
        // get the EntryDetails View Controller so we can configure it ahead of navigation
        if segue.identifier == "DetailsSegue"{
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            let selectedEntry = entry_list[selectedRow]
            guard let detailViewController = segue.destination as? EntryDetailsViewController else { return }
            detailViewController.entry = selectedEntry
        }
    }
    
    
    // Refresh all entries
    private func refreshEntries() {
        var entries = Entry.getEntries() // Get the current saved entries
        // Sort the entries list alphabetically
        entries.sort { lhs, rhs in
            return lhs.title < rhs.title
        }

        self.entry_list = entries // Update the main entry_list array with the refreshed and sorted entries
//        emptyStateLabel.isHidden = !tasks.isEmpty // Hide the "empty state label" if there are tasks present
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic) // Reload the table view data to reflect any updates to the entry_list array
    }
    

} // END OF CLASS




// An extension to group all table view data source related methods
extension ViewController: UITableViewDataSource {

    // The number of rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entry_list.count
    }

    // Create and configure a cell for each row of the table view (i.e. each task in the tasks array)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a Task cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as! EntryCellTableViewCell
        // Get the task for the associated row
        let entry = entry_list[indexPath.row]
        cell.titleLabel.text = entry.title
        cell.ratingLabel.text = "Rating: \(entry.rating) / 5"
        // Configure the cell with the task and add the code to be run when the complete button is tapped
        cell.configure(with: entry)
        return cell
    }

    // Enable "Swipe to Delete" functionality. The existence of this data source method enables the default "Swipe to Delete".
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        // Handle the "delete" case
        if editingStyle == .delete {
            entry_list.remove(at: indexPath.row) // Remove the associated entry from the entry_list array
            Entry.save(entry_list) // Save the updated entry_list array
            tableView.deleteRows(at: [indexPath], with: .automatic) // Tell the table view to delete the associated row
        }
    }
}

// MARK: - Table View Delegate Methods

// An extension to group all table view delegate related methods
extension ViewController: UITableViewDelegate {
    
    // The table view delegate method called when a row is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row so the row doesn't stay in the slected state (just a design preference in this case)
        tableView.deselectRow(at: indexPath, animated: false)
        // Get the task associated with the selected row
        let selectedEntry = entry_list[indexPath.row]
        // Perform the segue to the New Entry View Controller (i.e. "DetailsSegue") passing in the selected task for the sender
        // The sender can be any type and you can use it however you want. In this case we pass in the selected task so we can have easy access to it when preparing for navigation to the Compose View Controller when preparing for the segue in prepare(for:sender)
        performSegue(withIdentifier: "DetailsSegue", sender: selectedEntry)
    }
    
}
    

