//
//  ViewController.swift
//  Prework
//
//  Created by Chelsea Chu on 11/24/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    var isDefaultStatusBar = true

        // 2
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return isDefaultStatusBar ? .default : .lightContent
        }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    
          setTheme(isDark: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColorTheme.dark : ColorTheme.light

            view.backgroundColor = theme.viewControllerBackgroundColor


            billAmountTextField.tintColor = theme.accentColor
  

          //  billAmount.textColor = theme.primaryTextColor
            totalLabel.textColor = theme.primaryTextColor

            tipAmountLabel.textColor = theme.outputTextColor
        /*
            totalAmountLabel.textColor = theme.outputTextColor
         */
        isDefaultStatusBar = theme.isDefaultStatusBar
            setNeedsStatusBarAppearanceUpdate()
    }
    /*
    @IBAction func themeToggled(_ sender: UISwitch) {
        @IBAction func darkMode(_ sender: Any) {
        }
        setTheme(isDark: sender.isOn)
    }
     */
    
    @IBAction func darkMode(_ sender: UISwitch) {
    
        setTheme(isDark: sender.isOn)
    }

}

