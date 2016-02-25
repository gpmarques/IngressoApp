//
//  ViewController.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/19/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    
    let emailTextField = UITextField(frame: CGRectMake(38, 280, 300, 40))
    let passwordTextField = UITextField(frame: CGRectMake(38, 335, 300, 40))
    let labelErroLogin = UILabel(frame: CGRectMake(0,0, 300, 40))
    let logo = UIImageView(frame: CGRectMake(68,115,240,89))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)

        
        
        //CONFIGURACOES IMAGE LOGO 
        logo.image = UIImage(named: "TicketsLogo.png")
        self.view.addSubview(logo)
        
        
        self.navigationController?.navigationBarHidden = true
        
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
       
        
        //Configuraçoes BUTTON LOGIN
        buttonOk.frame = CGRectMake(38, 424, 300, 40)
        buttonOk.backgroundColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        buttonOk.setTitle("LOGIN", forState: UIControlState.Normal)
        buttonOk.addTarget(self,action: "loginAction", forControlEvents: UIControlEvents.TouchUpInside)
        buttonOk.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonOk)
     
        //Configuraçoes BUTTON CADASTRO
        buttonCadastro.frame = CGRectMake(0, 0,300, 40)
        buttonCadastro.center = CGPointMake(view.frame.width / 2, view.frame.height/2 + 250)
        buttonCadastro.backgroundColor = self.view.backgroundColor
        buttonCadastro.setTitle("Cadastre-se", forState: UIControlState.Normal)
        buttonCadastro.addTarget(self, action: "cadastroAction", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCadastro.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonCadastro)
        
        // Do any additional setup after loading the view, typically from a nib.
        // teste picker view
    
    }

    
    func cadastroAction () {
        
        let cadastroVC = ViewCadastro()
        //let cadastroVC = ViewPagamento()
        self.presentViewController(cadastroVC, animated: true, completion: nil)
    
    }
    
    func yesHandler(actionTarget: UIAlertAction){
        
        self.presentViewController(self, animated: false, completion: nil)
        
    }
    
    // Funcao que checa se o username e senha estao corretos.
    
    func loginAction () {
        
        let eventosVC = ViewEventos()
        let username = self.emailTextField.text!
        let password = self.passwordTextField.text!
        
        for usuarios in usuariosArray {
            if(usuarios.getEmail() == username && usuarios.getSenha() == password) {
                usuarioLogado.nome = usuarios.nome
                usuarioLogado.setSenha(password)
                usuarioLogado.setEmail(username)
                self.presentViewController(eventosVC, animated: true, completion: nil)
                return
            }
        }
    
                labelErroLogin.text = "Usuário e senha inválidos"
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

