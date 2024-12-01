//
//  ViewController.swift
//  Counter
//
//  Created by Dmitry Batorevich on 23.11.2024.
//

import UIKit

class ViewController: UIViewController {
    private var counterValue: Int = 0
    private var pushDateTime: String = ""
    
    @IBOutlet weak var textViewTiming: UITextView!
    
    @IBOutlet weak var counterValueLabel: UILabel!
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy:hh:mm:ss"
        pushDateTime = dateFormatter.string(from: Date())
        if counterValue > 0 {
            textViewTiming.insertText("\n\(pushDateTime) Значение счётчика уменьшено на единицу")
            counterValue -= 1
            counterValueLabel.text = "Значение счётчика: \(counterValue)"} else if counterValue == 0 {
                textViewTiming.insertText("\n\(pushDateTime) Попытка уменьшить значение счётчика меньше 0")
                return}
    }
   
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy:hh:mm:ss"
        pushDateTime = dateFormatter.string(from: Date())
        textViewTiming.insertText("\n\(pushDateTime) Значение счётчика увеличено на единицу")
            counterValue += 1
            counterValueLabel.text = "Значение счётчика: \(counterValue)"
    }
    
    @IBAction func buttonResetDidTap(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy:hh:mm:ss"
        pushDateTime = dateFormatter.string(from: Date())
        textViewTiming.text = "История изменений:"
        textViewTiming.insertText("\n\(pushDateTime) Значение сброшено")
        
        counterValue = 0
        counterValueLabel.text = String("Значение счётчика: \(counterValue)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        
        //dateFormatter.dateStyle = .medium
        //dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = "dd.MM.yyyy:hh:mm:ss"
        pushDateTime = dateFormatter.string(from: Date())
        textViewTiming.isEditable = false
        textViewTiming.insertText("История изменений:")
    }


}

