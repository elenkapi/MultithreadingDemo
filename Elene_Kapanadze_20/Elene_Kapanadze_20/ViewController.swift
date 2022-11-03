//
//  ViewController.swift
//  Elene_Kapanadze_20
//
//  Created by Ellen_Kapii on 09.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker =  UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        view.addSubview(datePicker)
        return datePicker
    }()
    
    
    private lazy var calculateButton: UIButton = {
        let calculateButton =  UIButton()
        calculateButton.backgroundColor = .black
        calculateButton.setTitle("Calculate Prime Numbers", for: .normal)
        calculateButton.titleLabel?.textAlignment = .center
        view.addSubview(calculateButton)
        return calculateButton
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDatePicker()
        addCalculateButton()
        addCalculateButtonTap()
    }
    
    
    
    //MARK: - Adding constraints private funcs
    
    private func addDatePicker() {
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: datePicker,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 60)
        
        let leftConstraint = NSLayoutConstraint(item: datePicker,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 10)
        
        let rightConstraint = NSLayoutConstraint(item: datePicker,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: -10)
        
        
        let height = NSLayoutConstraint(item: datePicker,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 200)
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint, height])
        
        
        
    }
    
    
    private func addCalculateButton() {
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: calculateButton,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: datePicker,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 40)
        
        let leftConstraint = NSLayoutConstraint(item: calculateButton,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 10)
        
        let rightConstraint = NSLayoutConstraint(item: calculateButton,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: -10)
        
        
        let height = NSLayoutConstraint(item: calculateButton,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 50)
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint, height])
        
        
        
    }
    
    
    //MARK: add tap to button
    
    private func addCalculateButtonTap() {
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func calculateButtonTapped()  {
        
        calculateButton.setTitle("Calculating...", for: .normal)
        calculateButton.alpha = 0.75
        calculateButton.isUserInteractionEnabled = false
        
        
        DispatchQueue.global().async {
            var numbers = [Int]()
            var primeNumbers = [Int]()
            var currentNumber = 0
            
            for number in 0...10000 {
                currentNumber = number
                
                var count = 0
                
                if currentNumber > 1 {
                    numbers.append(currentNumber)
                    for num in numbers {
                        if currentNumber % num == 0 {
                            count += 1
                        }
                    }
                    if count == 1 {
                        primeNumbers.append(currentNumber)
                        print(currentNumber)
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.calculateButton.alpha = 1.0
                self.calculateButton.isUserInteractionEnabled = true
                self.calculateButton.setTitle("Calculate Prime Numbers", for: .normal)
            }
        }
    }
}
