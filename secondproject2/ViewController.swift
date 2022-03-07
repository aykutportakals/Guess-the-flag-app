//
//  ViewController.swift
//  secondproject2
//
//  Created by Mikail Baykara on 2.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestion = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia" , "france" , "germany" , "ireland" , "italy" , "monaco" , "nigeria" , "poland" , "russia" , "spain" , "uk" , "us"]
        
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

       // button1.layer.borderColor = UIColor(displayP3Red: 0.3, green: 0.2, blue: 0.8, alpha: 0.2).cgColor
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        
        askQustion(action: nil)
        
    }

    func askQustion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = " \(askedQuestion + 1). Which one is \(countries[correctAnswer].uppercased())'s flag?  Score :\(score) "
        

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        
        var ac = UIAlertController()
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score+=1
            askedQuestion+=1
            ac = UIAlertController(title: title, message: "Your score  \(score)", preferredStyle: .alert)

        }
        else{
            title = "Wrong"
            score-=1
            askedQuestion+=1
            ac = UIAlertController(title: "\(title), that is the flag of \(countries[sender.tag].uppercased())", message: "Your score  \(score)", preferredStyle: .alert)
        }
        
        if askedQuestion % 10 == 0 {
           let ac2 = UIAlertController(title: "The End", message:"Your total score is \(score)", preferredStyle: .alert)
            ac2.addAction(UIAlertAction(title: "New Game", style: .default, handler: askQustion))
            present (ac2, animated: true)
            score = 0
        }
        
        if askedQuestion == 10 {
            askedQuestion-=10
        }
            
        
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQustion))
        present (ac, animated: true)

    }
    
    
}

