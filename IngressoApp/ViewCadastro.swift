//
//  ViewCadastro.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/22/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.

// ------------------------------------------------- TELA DE CADASTRO ---------------------------------------------------------------

import UIKit

class ViewCadastro: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()


        let buttonSalvar = UIButton(type: UIButtonType.System) as UIButton
        let labelNome = UILabel(frame: CGRectMake(50, 50, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let labelLogin = UILabel(frame: CGRectMake(50, 50, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let labelSenha = UILabel(frame: CGRectMake(50, 100, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let labelConfirmarSenha = UILabel(frame: CGRectMake(50, 100, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let labelCadastro = UILabel(frame: CGRectMake(50, 100, view.frame.width * 0.471014, view.frame.width * 0.169082))
        let nomeTextField = UITextField(frame: CGRectMake(100, 100, 250, 40))
        let loginTextField = UITextField(frame: CGRectMake(100, 150, 250, 40))
        let senhaTextField = UITextField(frame: CGRectMake(100, 100, 250, 40))
        let confirmarTextField = UITextField(frame: CGRectMake(100, 150, 250, 40))
        
        
        
        

        
        //Configuraçoes caixa de texto nomeTextField vulgo ENTER PASSWORD HERE
        nomeTextField.placeholder = "Enter your name here"
        nomeTextField.font = UIFont.systemFontOfSize(15)
        nomeTextField.borderStyle = UITextBorderStyle.RoundedRect
        nomeTextField.autocorrectionType = UITextAutocorrectionType.No
        nomeTextField.keyboardType = UIKeyboardType.Default
        nomeTextField.returnKeyType = UIReturnKeyType.Done
        nomeTextField.secureTextEntry = false
        nomeTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        nomeTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        nomeTextField.center = CGPointMake(view.frame.width/2 + 50, (view.frame.height/6) - 20)
        
        loginTextField.placeholder = "Enter your email here"
        loginTextField.font = UIFont.systemFontOfSize(15)
        loginTextField.borderStyle = UITextBorderStyle.RoundedRect
        loginTextField.autocorrectionType = UITextAutocorrectionType.No
        loginTextField.keyboardType = UIKeyboardType.Default
        loginTextField.returnKeyType = UIReturnKeyType.Done
        loginTextField.secureTextEntry = false
        loginTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        loginTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        loginTextField.center = CGPointMake(view.frame.width/2 + 50, (view.frame.height/6)+50)
        
        senhaTextField.placeholder = "Enter your password"
        senhaTextField.font = UIFont.systemFontOfSize(15)
        senhaTextField.borderStyle = UITextBorderStyle.RoundedRect
        senhaTextField.autocorrectionType = UITextAutocorrectionType.No
        senhaTextField.keyboardType = UIKeyboardType.Default
        senhaTextField.returnKeyType = UIReturnKeyType.Done
        senhaTextField.secureTextEntry = true
        senhaTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        senhaTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        senhaTextField.center = CGPointMake(view.frame.width/2 + 50, (view.frame.height/6)+120)
        
        confirmarTextField.placeholder = "Confirm your password"
        confirmarTextField.font = UIFont.systemFontOfSize(15)
        confirmarTextField.borderStyle = UITextBorderStyle.RoundedRect
        confirmarTextField.autocorrectionType = UITextAutocorrectionType.No
        confirmarTextField.keyboardType = UIKeyboardType.Default
        confirmarTextField.returnKeyType = UIReturnKeyType.Done
        confirmarTextField.secureTextEntry = true
        confirmarTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        confirmarTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        confirmarTextField.center = CGPointMake(view.frame.width/2 + 50, (view.frame.height/6)+165)
        
        //configuraçoes dos labels
        labelNome.center = CGPointMake(view.frame.width/2 - 120, (view.frame.height/6)-20)
        labelNome.textAlignment = NSTextAlignment.Center
        labelNome.text = "Nome:"
        labelNome.textColor = UIColor.blackColor()
        
        labelLogin.center = CGPointMake(view.frame.width/2 - 120, (view.frame.height/6)+50)
        labelLogin.textAlignment = NSTextAlignment.Center
        labelLogin.text = "Login:"
        labelLogin.textColor = UIColor.blackColor()
        
        labelSenha.center = CGPointMake(view.frame.width/2 - 120, (view.frame.height/6)+120)
        labelSenha.textAlignment = NSTextAlignment.Center
        labelSenha.text = "Senha:"
        labelSenha.textColor = UIColor.blackColor()
        
        
        labelCadastro.center = CGPointMake(view.frame.width/2, (view.frame.height/8) - 40)
        labelCadastro.textAlignment = NSTextAlignment.Center
        labelCadastro.text = "CADASTRO"
        labelCadastro.textColor = UIColor.blackColor()

        
        //Configuraçoes Buttons
        buttonSalvar.frame = CGRectMake(0,0,
            view.frame.width * 0.487923, view.frame.width * 0.169082)
        buttonSalvar.center = CGPointMake(view.frame.width / 2, view.frame.height - 150)
        buttonSalvar.backgroundColor = UIColor(red: 122 / 255, green: 163 / 255, blue: 220 / 255, alpha: 1)
        buttonSalvar.setTitle("Salvar", forState: UIControlState.Normal)
        buttonSalvar.addTarget(self,action: "confirmAction:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonSalvar.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

    
        // --------------------------- ADICIONANDO NA TELA OS OBJETOS ---------------------------
        
        
        self.view.addSubview(nomeTextField)
        self.view.addSubview(loginTextField)
        self.view.addSubview(senhaTextField)
        self.view.addSubview(confirmarTextField)
        self.view.addSubview(buttonSalvar)
        self.view.addSubview(labelNome)
        self.view.addSubview(labelLogin)
        self.view.addSubview(labelSenha)
        self.view.addSubview(labelConfirmarSenha)
        self.view.addSubview(labelCadastro)
        
        

        

                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // ----------------------------- DECLARACAO DO ALERT QUE CONFIRMA CADASTRO ----------------------
    
    
    let alert=UIAlertController(title: "Hey!", message: "Seu cadastro foi realizado com sucesso", preferredStyle: UIAlertControllerStyle.Alert);

    
    func yesHandler(actionTarget: UIAlertAction){
        self.presentViewController(ViewEventos(), animated: true, completion: nil)
    }

    
    
    // ----------------------------- FUNCAO DO BOTAO CONFIRMAR  ----------------------

    
    func confirmAction(sender: UIButton!) {
        
        //event handler with predefined function
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: yesHandler));
        
        presentViewController(alert, animated: true, completion: nil);
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
