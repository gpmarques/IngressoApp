//
//  ViewController.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/19/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var loginAndPassword = ["Loginteste" : "senhateste"]
    
    let emailTextField = UITextField(frame: CGRectMake(25, 200, 325, 40))
    let passwordTextField = UITextField(frame: CGRectMake(25, 250, 325, 40))
    let labelErroLogin = UILabel(frame: CGRectMake(0,0, 300, 40))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         //DECLARACAO E INICIALIZAÇAO DOS BUTTONS, LABELS, CAIXAS DE TEXTO
        
        let buttonOk = UIButton(type: UIButtonType.System) as UIButton
        let buttonCadastro = UIButton(type: UIButtonType.System) as UIButton
//        let labelLogin = UILabel(frame: CGRectMake(50, 50, view.frame.width * 0.471014, view.frame.width * 0.169082))
//        let labelSenha = UILabel(frame: CGRectMake(50, 100, view.frame.width * 0.471014, view.frame.width * 0.169082))
        
        //Configuraçoes caixa de texto emailTextField vulgo ENTER EMAIL HERE
        emailTextField.placeholder              = "username"
        emailTextField.font                     = UIFont.systemFontOfSize(15)
        emailTextField.borderStyle              = UITextBorderStyle.RoundedRect
        emailTextField.autocorrectionType       = UITextAutocorrectionType.No
        emailTextField.keyboardType             = .EmailAddress
        emailTextField.returnKeyType            = UIReturnKeyType.Done
        emailTextField.clearButtonMode          = UITextFieldViewMode.WhileEditing;
        emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.view.addSubview(emailTextField)
        
       
         //Configuraçoes caixa de texto passwordTextField vulgo ENTER PASSWORD HERE
        passwordTextField.placeholder = "password"
        passwordTextField.font = UIFont.systemFontOfSize(15)
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.autocorrectionType = UITextAutocorrectionType.No
        passwordTextField.keyboardType = UIKeyboardType.Default
        passwordTextField.returnKeyType = UIReturnKeyType.Done
        passwordTextField.secureTextEntry = true
        passwordTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.view.addSubview(passwordTextField)
        
        // Configuracoes label de erro login
        
        labelErroLogin.center = CGPointMake(view.frame.width / 2, view.frame.height / 2 + 5)
        labelErroLogin.textAlignment = NSTextAlignment.Center
        labelErroLogin.textColor = UIColor.blackColor()
        labelErroLogin.text = " "
        self.view.addSubview(labelErroLogin)
       
        //Configuraçoes LABE LOGIN
//        labelLogin.center = CGPointMake((view.frame.width / 2) - 120, (view.frame.height / 4) - 50)
//        labelLogin.textAlignment = NSTextAlignment.Center
//        labelLogin.text = "Login:"
//        labelLogin.textColor = UIColor.blackColor()
//        self.view.addSubview(labelSenha)
        
        //Configuraçoes LABEL SENHA
//        labelSenha.center = CGPointMake((view.frame.width / 2) - 120, (view.frame.height / 4))
//        labelSenha.textAlignment = NSTextAlignment.Center
//        labelSenha.text = "Senha:"
//        labelSenha.textColor = UIColor.blackColor()
//        self.view.addSubview(labelLogin)
        
        //Configuraçoes BUTTON LOGIN
        buttonOk.frame = CGRectMake(0 , 0,
                                    view.frame.width * 0.487923, view.frame.width * 0.169082)
        buttonOk.center = CGPointMake(view.frame.width / 2, view.frame.height/2 + 100)
        buttonOk.backgroundColor = self.view.backgroundColor
        buttonOk.setTitle("Login", forState: UIControlState.Normal)
        buttonOk.addTarget(self,action: "loginAction", forControlEvents: UIControlEvents.TouchUpInside)
        buttonOk.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonOk)
     
        //Configuraçoes BUTTON SENHA
        buttonCadastro.frame = CGRectMake(view.frame.width * 0.229469, view.frame.width * 0.966184,
                                          view.frame.width * 0.471014, view.frame.width * 0.169082)
        buttonCadastro.center = CGPointMake(view.frame.width / 2, view.frame.height/2 + 150)
        buttonCadastro.backgroundColor = self.view.backgroundColor
        buttonCadastro.setTitle("Cadastrar", forState: UIControlState.Normal)
        buttonCadastro.addTarget(self, action: "cadastroAction", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCadastro.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonCadastro)
        
        // Do any additional setup after loading the view, typically from a nib.
        // teste picker view
    
    }

    
    func cadastroAction () {
        
        let cadastroVC = ViewCadastro()
        self.navigationController?.pushViewController(cadastroVC, animated: true)
    
    }
    
    func yesHandler(actionTarget: UIAlertAction){
        
        self.presentViewController(self, animated: false, completion: nil)
        
    }
    
    // Funcao que checa se o username e senha estao corretos.
    
    func loginAction () {
        
        let eventosVC = ViewEventos()
        let username = self.emailTextField.text!
        let password = self.passwordTextField.text!
        
        
        if ( loginAndPassword[username] == password ) {
            
        
            self.presentViewController(eventosVC, animated: true, completion: nil)
            
        
        } else {
            
 
                labelErroLogin.text = "Usuário e senha inválidos"
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

