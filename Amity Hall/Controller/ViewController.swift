//
//  ViewController.swift
//  Amity Hall
//
//  Created by Nel Toms on 8/2/18.
//  Copyright © 2018 Parko Inc. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let allQuestions = TriviaBank()
    var questionNumber : Int = 0
    var score : Int = 0
    var greenButt : AnyObject!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        checkAnswer()
        textFieldShouldReturn(textField: textField)
    }

    
    
    @IBAction func answerPressed(_ sender: AnyObject){
      
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self as? UITextFieldDelegate
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        progressLabel.text = String(questionNumber) + "/13"
        
        nextQuestion()

    }
    
    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    func startOver() {
        
        questionNumber = 0
        score = 0
        
        updateUI()
    }

    func checkAnswer() {

        let correctAnswer = allQuestions.list[questionNumber].answer.lowercased().split(separator: " ")
        print(correctAnswer)
        let typedAnswer = textField.text!.lowercased().split(separator: " ")
        
        if typedAnswer.isEmpty {
            let myAlert = UIAlertController(title: "Alert", message: "Please enter an answer", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
        }
        if (typedAnswer == correctAnswer){
            ProgressHUD.showSuccess("Answer Submitted")
            
            score += 1
        }
        else {

            ProgressHUD.showSuccess("Answer Submitted")
        }
 
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }
}

//        func eval() -> [NSTextCheckingResult] {
//            if let regex = try? NSRegularExpression(pattern: "#[a-z0-9]+", options: .caseInsensitive) {
//                let string = textField.text
//
//                return regex.matches(in: string!, options: [], range: NSRange(location: 0, length: (string!.count)))
//            }
//            return []
//        }
//        print(eval())


