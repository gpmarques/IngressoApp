//
//  ViewCadastro.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/22/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.



//---------- TELA DE CADASTRO ----------//


import UIKit

class ViewCadastro: UIViewController {
    
   


    let nomeTextField = UITextField( frame: CGRectMake(38, 200, 300, 40) )
    let loginTextField = UITextField( frame: CGRectMake(38, 255, 300, 40) )
    let senhaTextField = UITextField( frame: CGRectMake(38, 309, 300, 40) )
    let confirmarTextField = UITextField( frame: CGRectMake(38, 364, 300, 40) )
    let buttonSalvar = UIButton( type: UIButtonType.System) as UIButton

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44+statusBarHeight)) // Offset by 20 pixels vertically to take the status bar into account
        let navigationItem = UINavigationItem()
        navigationItem.title = "Cadastro"
        let leftButton =  UIBarButtonItem(title: "Voltar", style:   UIBarButtonItemStyle.Plain, target: self, action: "voltarAction")
        navigationItem.leftBarButtonItem = leftButton
        
        self.title = "Cadastro"
        

        


        //CONFIGURACOES NAVIGATION BAR
        navigationBar.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)

        
        
        //Configuraçoes caixa de texto nomeTextField
        nomeTextField.placeholder = "Nome"
        nomeTextField.font = UIFont.systemFontOfSize(15)
        nomeTextField.borderStyle = UITextBorderStyle.RoundedRect
        nomeTextField.autocorrectionType = UITextAutocorrectionType.No
        nomeTextField.keyboardType = UIKeyboardType.Default
        nomeTextField.returnKeyType = UIReturnKeyType.Done
        nomeTextField.secureTextEntry = false
        nomeTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        nomeTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        nomeTextField.layer.cornerRadius = 0

        
        
        loginTextField.placeholder = "Email"
        loginTextField.font = UIFont.systemFontOfSize(15)
        loginTextField.borderStyle = UITextBorderStyle.RoundedRect
        loginTextField.autocorrectionType = UITextAutocorrectionType.No
        loginTextField.keyboardType = UIKeyboardType.Default
        loginTextField.returnKeyType = UIReturnKeyType.Done
        loginTextField.secureTextEntry = false
        loginTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        loginTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center

        
        senhaTextField.placeholder = "Senha"
        senhaTextField.font = UIFont.systemFontOfSize(15)
        senhaTextField.borderStyle = UITextBorderStyle.RoundedRect
        senhaTextField.autocorrectionType = UITextAutocorrectionType.No
        senhaTextField.keyboardType = UIKeyboardType.Default
        senhaTextField.returnKeyType = UIReturnKeyType.Done
        senhaTextField.secureTextEntry = true
        senhaTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        senhaTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center

        
        confirmarTextField.placeholder = "Confirmar senha"
        confirmarTextField.font = UIFont.systemFontOfSize(15)
        confirmarTextField.borderStyle = UITextBorderStyle.RoundedRect
        confirmarTextField.autocorrectionType = UITextAutocorrectionType.No
        confirmarTextField.keyboardType = UIKeyboardType.Default
        confirmarTextField.returnKeyType = UIReturnKeyType.Done
        confirmarTextField.secureTextEntry = true
        confirmarTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        confirmarTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center

        
        //Configuraçoes Buttons
        buttonSalvar.frame = CGRectMake(38, 490, 300, 40)
        buttonSalvar.backgroundColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        buttonSalvar.setTitle("CADASTRAR", forState: UIControlState.Normal)
        buttonSalvar.addTarget(self,action: "confirmAction:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonSalvar.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)

    
        // --------------------------- ADICIONANDO NA TELA OS OBJETOS ---------------------------
        
        
        self.view.addSubview(nomeTextField)
        self.view.addSubview(loginTextField)
        self.view.addSubview(senhaTextField)
        self.view.addSubview(confirmarTextField)
        self.view.addSubview(buttonSalvar)
        
 

        

                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // ----------------------------- DECLARACAO DO ALERT QUE CONFIRMA CADASTRO ----------------------
    
    
    let alert = UIAlertController(title: "Seu cadastro foi realizado com sucesso", message: "", preferredStyle: UIAlertControllerStyle.Alert);

    
    func yesHandler(actionTarget: UIAlertAction){
        
        self.presentViewController(ViewEventos(), animated: true, completion: nil)
    
    }

    
    // ----------------------------- FUNCAO DO BOTAO CONFIRMAR  --------------------------------

    func voltarAction() {
        
        presentViewController(ViewController(), animated: true, completion: nil)
    }
    
    func confirmAction(sender: UIButton!) {
        
        let nomeAux = String(nomeTextField.text)
        let emailAux = String(loginTextField.text)
        let senhaAux = String(senhaTextField.text)
        usuariosArray.append(Usuario(nome: nomeAux, email: emailAux, senha: senhaAux, qtdIngresso: 0))
        
        //event handler with predefined function
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: yesHandler));
        
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
