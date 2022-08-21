//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var explanationLAbel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        showResult()
    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func showResult() {
        var answersFrequency : [AnimalType: Int] = [:]
        let answersTypes = answers.map{ $0.type }

        for answer in answersTypes {
            answersFrequency[answer] = (answersFrequency[answer] ?? 0) + 1
        }

        let sortedAnswers = answersFrequency.sorted(by: { $0.value > $1.value } )
        
        let mostCommonAnswer = sortedAnswers.first!.key // Вот здесь не знаю как мягко опционал извлечь
        
        resultLabel.text = "Вы - \(mostCommonAnswer.rawValue)"
        explanationLAbel.text = mostCommonAnswer.definition
    }
    
}

