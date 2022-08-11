//
//  ViewController.swift
//  INFO6125Project2
//
//  Created by Jianwei Wang on 2022-07-24.
//
// A team work by Jianwei and Sampath for project 2 of INFO6125 course of MAP Program at Fanshawe College

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var budgetText: UILabel!
    
    @IBOutlet weak var savingText: UILabel!
    
    @IBOutlet weak var dollorImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sfImageConfig()
        //Do any additional setup after loading the view.
        
    }
    @IBAction func onBudgetButtonTapped(_ sender: UIButton) {
        
        var budgetTextField: UITextField?
        let alertController = UIAlertController(
            title: "Budget",
            message: "Please enter your budget for this month",
            preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(
            title: "Confirm", style: .default) {
                (action) -> Void in
                
                if let budget = budgetTextField?.text {
                    print(" Budget = \(budget)")
                    self.budgetText.text = "$ \(budget)"
                } else {
                    print("No Budget Entered")
                }
                
            }
        alertController.addTextField {
                (txtBudget) -> Void in
                budgetTextField = txtBudget
                budgetTextField!.placeholder = "$CAD"
            }
        alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    private func sfImageConfig(){
        let config = UIImage.SymbolConfiguration(scale: .large)
        dollorImageView.preferredSymbolConfiguration = config
        dollorImageView.image = UIImage(systemName: "banknote")
    }
    
    @IBAction func historyButtonTapped(_ sender: UIButton) {
        goNextScreen(screen: "goToHistory")
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        goNextScreen(screen: "goToAdd")
    }
    
    @IBAction func mapButtonTapped(_ sender: UIButton) {
        goNextScreen(screen: "goToMap")
    }
    
    private func goNextScreen(screen: String){
        
        performSegue(withIdentifier: screen, sender: self)
    }
}
