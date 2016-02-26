//
//  ViewPagamento.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/23/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ViewPagamento: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    var nomeSessaoCorrente: String!
    var horarioSessaoCorrente: String!

    var pickerTextField = UITextField(  frame: CGRect(x: 35, y: 400,
                                        width: 200, height: 40 ) )
    
    var data = [ "MasterCard" , "Visa" , "Amex" ]
    var picker = UIPickerView()
    
    let buttonConfirmar = UIButton(type: UIButtonType.System) as UIButton
    let confirmacaoDados = UILabel(frame: CGRectMake(0,0, 300, 40))
    let labelNome = UILabel(frame: CGRectMake(0,0, 500, 500))
    let textFieldNumeroCartao =  UITextField(frame: CGRectMake(0,0, 200, 40))
    let labelValor =  UILabel(frame: CGRectMake(0,0, 500, 40))
    let labelEvento = UILabel(frame: CGRectMake(0,0, 300,500))
    let alert = UIAlertController(title: "Sua compra foi realizada com sucesso!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    let alert2 = UIAlertController(title: "Dados do cartão incorretos!", message: "", preferredStyle: UIAlertControllerStyle.Alert)


   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)
        
        // Configuracoes label de confirmacao de dados
        confirmacaoDados.center = CGPointMake(view.frame.width/2, view.frame.height/8)
        confirmacaoDados.textAlignment = NSTextAlignment.Center
        confirmacaoDados.textColor = UIColor.blackColor()
        confirmacaoDados.text = "Confirmação dos dados "
        self.view.addSubview(confirmacaoDados)
        
        // Configuracoes label do Nome
        labelNome.center = CGPointMake(view.frame.width/2, view.frame.height/4+100)
        labelNome.textAlignment = NSTextAlignment.Center
        labelNome.textColor = UIColor.blackColor()
        labelNome.text = "\(usuarioLogado.nome)"
        self.view.addSubview(labelNome)
        
        // Configuracoes label do Valor + quantidade de ingressos
        labelValor.center = CGPointMake(view.frame.width/2, view.frame.height/4 + 200)
        labelValor.textAlignment = NSTextAlignment.Center
        labelValor.textColor = UIColor.blackColor()
        labelValor.text = "R$\(50 * usuarioLogado.qtdIngresso) (\(usuarioLogado.qtdIngresso) ingressos)"
        self.view.addSubview(labelValor)
        
        // Configuracoes label do Evento
        labelEvento.center = CGPointMake(view.frame.width/2, view.frame.height/4)
        labelEvento.textAlignment = NSTextAlignment.Center
        labelEvento.textColor = UIColor.blackColor()
        usuarioLogado.sessaoComprada = sessaoBatman
        labelEvento.text = nomeSessaoCorrente + "\n" + "Hora: " + horarioSessaoCorrente
        self.view.addSubview(labelEvento)
        
        // Configuracoes text field de numero do cartao
        textFieldNumeroCartao.placeholder              = "Numero do cartão"
        textFieldNumeroCartao.font                     = UIFont.systemFontOfSize(15)
        textFieldNumeroCartao.borderStyle              = UITextBorderStyle.RoundedRect
        textFieldNumeroCartao.autocorrectionType       = UITextAutocorrectionType.No
        textFieldNumeroCartao.keyboardType             = .EmailAddress
        textFieldNumeroCartao.returnKeyType            = UIReturnKeyType.Done
        textFieldNumeroCartao.clearButtonMode          = UITextFieldViewMode.WhileEditing;
        textFieldNumeroCartao.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textFieldNumeroCartao.center = CGPointMake(view.frame.width/2, view.frame.height/4 + 350)
        self.view.addSubview(textFieldNumeroCartao)
        

        
        //Configuraçoes BUTTON CONFIRMAR
        buttonConfirmar.frame = CGRectMake(view.frame.width * 0.229469, view.frame.width * 0.966184,
        view.frame.width * 0.471014, view.frame.width * 0.169082)
        buttonConfirmar.center = CGPointMake(view.frame.width / 2, view.frame.height/2 + 300)
        buttonConfirmar.backgroundColor = self.view.backgroundColor
        buttonConfirmar.setTitle("Confirmar", forState: UIControlState.Normal)
        buttonConfirmar.addTarget(self, action: "confirmarAction", forControlEvents: UIControlEvents.TouchUpInside)
        buttonConfirmar.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(buttonConfirmar)

        
        
        

        // ------------------------------------------------  CONFIGURACOES DOS DADOS DO PICKER E SUAS FUNCOES -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- --------
        
        self.view.addSubview(pickerTextField)
        pickerTextField.borderStyle = UITextBorderStyle.RoundedRect
        picker.delegate = self
        picker.dataSource = self
        pickerTextField.inputView = picker
        pickerTextField.placeholder = "Cartão"
        pickerTextField.center = CGPointMake(view.frame.width/2, view.frame.height/4 + 300)
        
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
        self.view.endEditing(true)
    }
    
    func pickerView( pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String?{
        return data[row]
    }

    // ------------------------------------------------ END OF CONFIGURACOES DOS DADOS DO PICKER E SUAS FUNCOES -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- --------
    
    

    //----------------------------------------------------------------------------------------------- - CONFIGURAÇOES DO ALERT --------------------------------------------------------------------------- ------------------------
    
    func confirmHandler(actionTarget: UIAlertAction){
        
        self.presentViewController(ViewEventos(), animated: false, completion: nil)
        
    }
    
    func cartaoErrorHandler(actionTarget: UIAlertAction){
        
        self.presentViewController(self, animated: false, completion: nil)
        
    }
    
    func confirmarAction() {
        
       
        if(textFieldNumeroCartao.text != "" && (pickerTextField.text == "Amex" || pickerTextField.text == "Mastercard" || pickerTextField.text == "Visa")) {
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: confirmHandler))
        
        presentViewController(alert, animated: true, completion: nil)
            
            return
        
        }
        else {
            
            alert2.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: confirmHandler))
            
            presentViewController(alert2, animated: true, completion: nil)
            return
        }
        
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
