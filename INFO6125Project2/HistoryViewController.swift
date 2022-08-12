//
//  HistoryViewController.swift
//  INFO6125Project2
//
//  Created by Sampath Bandara on 2022-08-08.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var records: [moneyRecord] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultRecord()
        tableView.dataSource = self
    }
    //This is only testing to see if we can add record directly on this screen
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    private func loadDefaultRecord(){
        records.append(moneyRecord(type: "expense", category: "grocery", value: 0, date:"12-08-2022"))
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
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

struct moneyRecord {
    let type: String
    let category: String
    let value: Int
    let date: String
}

extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyRecordCell", for: indexPath)
        let item = records[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "$"+String(item.value)
        content.secondaryText = item.type + " | " + item.category + " | " + item.date
        cell.contentConfiguration = content
        return cell
    }
    
    
}
