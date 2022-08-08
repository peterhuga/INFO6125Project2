//
//  ViewController.swift
//  INFO6125Project2
//
//  Created by Jianwei Wang on 2022-07-24.
//
// A team work by Jianwei and Sampath for project 2 of INFO6125 course of MAP Program at Fanshawe College

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var dollorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sfImageConfig()
        // Do any additional setup after loading the view.
        
    }
    
    private func sfImageConfig(){
        let config = UIImage.SymbolConfiguration(scale: .large)
        dollorImageView.preferredSymbolConfiguration = config
        dollorImageView.image = UIImage(systemName: "dollarsign.circle")
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
