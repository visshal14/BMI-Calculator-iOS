//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Vishal Pal 

import UIKit

class ViewController: UIViewController {

    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    var bmi:Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSilderChanged(_ sender: UISlider) {
        
        heightLabel.text = "\(String(format:"%.2f",sender.value)) m" 
    }
     
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(String(format:"%.0f",sender.value)) Kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
       
        calculatorBrain.calculateBMI(height:height,weight:weight)
//         bmi = weight / (height * height)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        if segue.identifier == "goToResult"{
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.bmiValue = calculatorBrain.getBMIValue()
            destinationVc.advice = calculatorBrain.getAdvice()
            destinationVc.color = calculatorBrain.getColor()
        }
    }
    
}

