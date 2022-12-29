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
       randomColor()
    }
    
    @objc func randomColor() {
           self.view.backgroundColor = random()
           
           
       }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    
    @objc  func random() -> UIColor {
           return UIColor(
            red:   .random(in: 0.5...1),
                        green: .random(in: 0.5...1),
                        blue:  .random(in: 0.5...1),
                        alpha: 1.0
           )
       }
}



