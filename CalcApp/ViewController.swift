//
//  ViewController.swift
//  CalcApp
//
//  Created by Jagannathan, Imaya Kumar on 12/25/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }

    func clearAll()
    {
        workings=""
        calculatorWorkings.text=""
        calculatorResults.text=""
    }
    
    func addtoWorkings(value:String){
        workings = workings + value
        calculatorWorkings.text  = workings
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    
    @IBAction func percentTap(_ sender: Any) {
        addtoWorkings(value: "%")
    }
    
    
    
    @IBAction func sevenTap(_ sender: Any) {
        addtoWorkings(value: "7")
    }
    
    
    @IBAction func eightTap(_ sender: Any) {
        addtoWorkings(value: "8")
    }
    
    
    @IBAction func nineTap(_ sender: Any) {
        addtoWorkings(value: "9")
    }
    
    
    @IBAction func fourTap(_ sender: Any) {
        addtoWorkings(value: "4")
    }
    
    
    @IBAction func fiveTap(_ sender: Any) {
        addtoWorkings(value: "5")
    }
    
    
    @IBAction func sixTap(_ sender: Any) {
        addtoWorkings(value: "6")
    }
    
    
    @IBAction func oneTap(_ sender: Any) {
        addtoWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addtoWorkings(value: "2")
    }
    
    
    @IBAction func threeTap(_ sender: Any) {
        addtoWorkings(value: "3")
    }
    
    
  
    
    
    @IBAction func periodTap(_ sender: Any) {
        addtoWorkings(value: ".")
    }
    
    
    @IBAction func zeroTap(_ sender: Any) {
        addtoWorkings(value: "0")
    }
    
    
    @IBAction func multiplyTap(_ sender: Any) {
        addtoWorkings(value: "*")
    }
    
    
    @IBAction func plusTap(_ sender: Any) {
    addtoWorkings(value: "+")
    }
    
    
    
    @IBAction func equaltoTap(_ sender: Any) {
        if(validInput()){
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "Come on now...", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        for index in funcCharIndexes{
            if(index == 0 || index == workings.count-1){
                return false;
            }
            
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char:Character) -> Bool{
        if(char == "*")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == ".")
        {
            return true
        }
        return false;
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)

        }
    }
    
    @IBAction func deleteTap(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text=workings
        }
    }
    
    

    
    
    @IBAction func divisionTap(_ sender: Any) {
        addtoWorkings(value: "/")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addtoWorkings(value: "-")
    }
    
    
}

