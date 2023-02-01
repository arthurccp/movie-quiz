//
//  QuizManager.swift
//  MovieQuiz
//
//  Created by Arthur Silva on 01/02/23.
//

import Foundation


typealias Round = (quiz: Quiz, options: [QuizOption])

class QuizManager {
    let quizes: [Quiz]
    let quizOptions: [QuizOption]
    var round: Round?
    var score: Int
    
    init() {
        score = 0
        guard let quizesURL = Bundle.main.url(forResource: "quizes", withExtension: "json") else {return}
        do {
            let quizesData = try Data(contentsOf: quizesURL)
            quizes = try JSONDecoder().decode([Quiz].self, from: quizesData)
            let quizOptionsURL = Bundle.main.url(forResource: "options", withExtension: "json")!
            let quizesOptionsData = try! Data(contentsOf: quizOptionsURL)
            quizOptions = try! JSONDecoder().decode([QuizOption].self, from: quizesData)
        } catch {
            print(error.localizedDescription)
            quizes = []
            quizOptions = []
        }
    }
    
    func generateRandomQUiz() -> Round {
        let quizIndex = Int(arc4random_uniform(UInt32(quizes.count)))
        let quiz = quizes[quizIndex]
        var indexes: Set<Int> = [quizIndex]
        while indexes.count < 4 {
            let index = Int(arc4random_uniform(UInt32(quizes.count)))
            indexes.insert(index)
        }
        let options = indexes.map({quizOptions[$0]})
        round = (quiz, options)
        return round!
    }
    
    func checkAnswer(_ answer: String){
        guard let round = round else {return}
        if answer == round.quiz.name{
            score += 1
            print("Acertouuuuuuuu")
        }
    }
}

struct Quiz: Codable {
    let name: String
    let number: Int
}

struct QuizOption: Codable {
    let name: String
}
