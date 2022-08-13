//
//  HistoryViewController.swift
//  INFO6125Project2
//
//  Created by Sampath Bandara on 2022-08-08.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var records: [MoneyRecord] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadDefaultRecord()
    
        loadFromDB()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    //This is only testing to see if we can add record directly on this screen
    @IBAction func addButtonTapped(_ sender: Any) {
    }
//    private func loadDefaultRecord(){
//        records.append(moneyRecord(type: "expense", category: "grocery", value: 0, date:"12-08-2022"))
//    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func loadFromDB (){
        guard let context = getCoreContext() else{
            return
        }
        let request = MoneyRecord.fetchRequest()
        do{
            try records = context.fetch((request))
            
        }catch{
            print(error)
        }
        
    }
    
    private func getCoreContext()->NSManagedObjectContext?{
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
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

//struct moneyRecord {
//    let type: String
//    let category: String
//    let value: Int
//    let date: String
//}

extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyRecordCell", for: indexPath)
        let item = records[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "$"+(item.value ?? "0")
        content.secondaryText = (item.type ?? "default") + " | " + (item.category ?? "default") + " | " + (item.date ?? "default")
        cell.contentConfiguration = content
        return cell
    }
    
    
}

extension HistoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertController = UIAlertController(title: "Delete Record", message: "Are you sure you want to delete this record?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.records.remove(at: indexPath.row)
            tableView.reloadData()
        }))
        self.present(alertController, animated: true)
    }
    
    
}
