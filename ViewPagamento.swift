//
//  ViewPagamento.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/23/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ViewPagamento: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerTextField = UITextField(  frame: CGRect(x: 35, y: 400,
                                        width: 250, height: 40 ) )
    
    var data = [ "MasterCard" , "Visa" , "Amex" ]
    var picker = UIPickerView()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.addSubview(pickerTextField)
        pickerTextField.borderStyle = UITextBorderStyle.RoundedRect
        picker.delegate = self
        picker.dataSource = self
        pickerTextField.inputView = picker
        
        // Do any additional setup after loading the view.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = data[row]
    }
    
    func pickerView( pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String?{
        return data[row]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
