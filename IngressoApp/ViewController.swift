//
//  ViewController.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/19/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         //DECLARACAO E INICIALIZAÇAO DOS BUTTONS, LABELS, CAIXAS DE TEXTO
        
        let buttonOk = UIButton(type: UIButtonType.System) as UIButton
        let buttonCadastro = UIButton(type: UIButtonType.System) as UIButton
        let labelLogin = UILabel(frame: CGRectMake(50, 50, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let labelSenha = UILabel(frame: CGRectMake(50, 100, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let sampleTextField = UITextField(frame: CGRectMake(100, 100, 250, 40))
        let sampleTextField2 = UITextField(frame: CGRectMake(100, 150, 250, 40))
        
        //Configuraçoes caixa de texto SAMPLETEXTFIELD vulgo ENTER EMAIL HERE
        sampleTextField.placeholder              = "Enter email here"
        sampleTextField.font                     = UIFont.systemFontOfSize(15)
        sampleTextField.borderStyle              = UITextBorderStyle.RoundedRect
        sampleTextField.autocorrectionType       = UITextAutocorrectionType.No
        sampleTextField.keyboardType             = .EmailAddress
        sampleTextField.returnKeyType            = UIReturnKeyType.Done
        sampleTextField.clearButtonMode          = UITextFieldViewMode.WhileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.view.addSubview(sampleTextField)
        
       
         //Configuraçoes caixa de texto SAMPLETEXTFIELD2 vulgo ENTER PASSWORD HERE
        sampleTextField2.placeholder = "Enter password here"
        sampleTextField2.font = UIFont.systemFontOfSize(15)
        sampleTextField2.borderStyle = UITextBorderStyle.RoundedRect
        sampleTextField2.autocorrectionType = UITextAutocorrectionType.No
        sampleTextField2.keyboardType = UIKeyboardType.Default
        sampleTextField2.returnKeyType = UIReturnKeyType.Done
        sampleTextField2.secureTextEntry = true
        sampleTextField2.clearButtonMode = UITextFieldViewMode.WhileEditing;
        sampleTextField2.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.view.addSubview(sampleTextField2)
        
       
        //Configuraçoes LABE LLOGIN
        labelLogin.center = CGPointMake((view.frame.width / 2) - 120, (view.frame.height / 4) - 50)
        labelLogin.textAlignment = NSTextAlignment.Center
        labelLogin.text = "Login:"
        labelLogin.textColor = UIColor.blackColor()
        self.view.addSubview(labelSenha)
        
        //Configuraçoes LABEL SENHA
        labelSenha.center = CGPointMake((view.frame.width / 2) - 120, (view.frame.height / 4))
        labelSenha.textAlignment = NSTextAlignment.Center
        labelSenha.text = "Senha:"
        labelSenha.textColor = UIColor.blackColor()
        self.view.addSubview(labelLogin)
        
        //Configuraçoes BUTTON OK
        buttonOk.frame = CGRectMake(0,0,
                                    view.frame.width * 0.487923, view.frame.width * 0.169082)
        buttonOk.center = CGPointMake(view.frame.width / 2, view.frame.height - 150)
        buttonOk.backgroundColor = UIColor(red: 132 / 255, green: 183 / 255, blue: 211 / 255, alpha: 1)
        buttonOk.setTitle("Ok", forState: UIControlState.Normal)
        buttonOk.addTarget(self,action: "okAction:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonOk.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonOk)
     
        //Configuraçoes BUTTON SENHA
        buttonCadastro.frame = CGRectMake(view.frame.width * 0.229469, view.frame.width * 0.966184,
                                          view.frame.width * 0.471014, view.frame.width * 0.169082)
        buttonCadastro.center = CGPointMake(view.frame.width / 2, view.frame.height - 50)
        buttonCadastro.backgroundColor = UIColor.blueColor()
        buttonCadastro.setTitle("Cadastrar", forState: UIControlState.Normal)
        buttonCadastro.addTarget(self,action: "cadastroAction:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCadastro.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonCadastro)
        buttonCadastro.imageView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func okAction(sender: UIButton!) {
        
       self.presentViewController(ViewEventos(), animated: true, completion: nil)
        
    }
    
    func cadastroAction (sender: UIButton!) {
        
        self.presentViewController(ViewCadastro(), animated: true, completion: nil)

    }


}

