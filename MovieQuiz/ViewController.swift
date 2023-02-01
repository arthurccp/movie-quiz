//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Arthur Silva on 01/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viSoundBar: UIView!
    @IBOutlet weak var siMusic: UISlider!
    @IBOutlet var btOption: [UIButton]!
    @IBOutlet weak var ivQuiz: UIImageView!
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        quizManager.checkAnswer(sender.title(for: .normal)!)
        getNewQuiz()
    }
    
        var quizManager: QuizManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        quizManager = QuizManager()
        getNewQuiz()
    }
    
    func getNewQuiz(){
        let round = quizManager.generateRandomQUiz()
        for i in 0..<round.options.count {
            btOption[i].setTitle(round.options[i].name, for: .normal)
        }
    }

    @IBAction func changeMusicTime(_ sender: Any) {
        
        
    }
    @IBAction func showHideSoundBar(_ sender: Any) {
    }
    
    @IBAction func changeMusicStatus(_ sender: Any) {
    }
}

