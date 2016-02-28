//
//  ViewController.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/19/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    //DECLARACAO E INICIALIZAÇAO DOS BUTTONS, LABELS, CAIXAS DE TEXTO
    
    let buttonOk = UIButton(type: UIButtonType.System) as UIButton
    let buttonCadastro = UIButton(type: UIButtonType.System) as UIButton
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
        
        
        //Configuraçoes caixa de texto emailTextField vulgo ENTER EMAIL HERE
        emailTextField.placeholder              = "Email"
        emailTextField.font                     = UIFont.systemFontOfSize(15)
        emailTextField.borderStyle              = UITextBorderStyle.RoundedRect
        emailTextField.autocorrectionType       = UITextAutocorrectionType.No
        emailTextField.keyboardType             = .EmailAddress
        emailTextField.returnKeyType            = UIReturnKeyType.Done
        emailTextField.clearButtonMode          = UITextFieldViewMode.WhileEditing;
        emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        self.view.addSubview(emailTextField)
        
       
         //Configuraçoes caixa de texto passwordTextField vulgo ENTER PASSWORD HERE
        passwordTextField.placeholder = "Senha"
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
        
        labelErroLogin.center = CGPointMake(view.frame.width / 2, view.frame.height / 2 + 200)
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
        self.presentViewController(cadastroVC, animated: true, completion: nil)
    
    }
    
    func yesHandler(actionTarget: UIAlertAction){
        
        self.presentViewController(self, animated: false, completion: nil)
        
    }
    
    // ----------------------------- DECLARACAO DO ALERT QUE CONFIRMA CADASTRO ----------------------
    
    
    let alert = UIAlertController(title: "falha no login, email ou senha incorretos!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    
    
    func okHandler(actionTarget: UIAlertAction){
        
       self.presentViewController(ViewController(), animated: false, completion: nil)
        
    }

    
    // Funcao que checa se o username e senha estao corretos.
    
    func loginAction () {
        
        let eventosVC = ViewEventos()
        let username = self.emailTextField.text!
        let password = self.passwordTextField.text!
        
        for usuarios in usuariosArray {
            if(usuarios.getEmail() == username && usuarios.getSenha() == password) {
                usuarioLogado = Usuario(nome: usuarios.nome, email: usuarios.getEmail(), senha: usuarios.getSenha(), qtdIngresso: 0)
                self.presentViewController(eventosVC, animated: true, completion: nil)
                return
            }
        }
    
        //event handler with predefined function
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: okHandler));
        
        presentViewController(alert, animated: true, completion: nil);

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

