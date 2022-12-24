//
//  ItemSelectionVC.swift
//  Rock Paper Scissors
//
//  Created by Mustafa Adnan Tatlıcı on 24.12.2022.
//

import UIKit

class ItemSelectionVC: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var timer: Timer!
    var items: [UIImage] = item.allValues
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        for button in buttons {
            button.layer.cornerRadius = 8 
              }

    }
    
    
    
    func startTimer() {
       timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomItem), userInfo: nil , repeats: true)
    }

    
    
    @objc func showRandomItem() {
        itemImage.image = items.randomElement() ?? UIImage(named: "scissors")
       
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}



