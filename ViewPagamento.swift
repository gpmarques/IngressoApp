//
//  ViewPagamento.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/23/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ViewPagamento: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource
{
    
    var nomeSessaoCorrente: String!
    var horarioSessaoCorrente: String!
    var imagem: UIImage!
    
    var retView = UIView(frame: CGRectMake(18, 100, 340, 100))


    var pickerTextField = UITextField(  frame: CGRect(x: 35, y: 400,
                                        width: 250, height: 40 ) )
    
    var data = ["MasterCard" , "Visa" , "Amex"]
    var picker = UIPickerView()
    
    let button = UIButton(frame: CGRectMake(32, 580, 315, 40))
    let labelNome = UILabel(frame: CGRectMake(0,0, 500, 500))
    let labelSala = UILabel.init()
    let labelHorario = UILabel.init()
    let textFieldNumeroCartao =  UITextField(frame: CGRectMake(0,0, 250, 40))
    let labelValor =  UILabel(frame: CGRectMake(0,0, 500, 40))
    let labelEvento = UILabel(frame: CGRectMake(0,0, 300,500))
    let alert = UIAlertController(title: "Sua compra foi realizada com sucesso!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    let alert2 = UIAlertController(title: "Dados do cartão incorretos!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
    
        
        retView.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 223/255, alpha: 1)
        self.view.addSubview(retView)
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44+statusBarHeight)) // Offset by 20 pixels vertically to take the status bar into account
        let navigationItem = UINavigationItem()
        navigationItem.title = "Pagamento"
        let leftButton =  UIBarButtonItem(title: "Voltar", style:   UIBarButtonItemStyle.Plain, target: self, action: "voltarAction:")
        navigationItem.leftBarButtonItem = leftButton
        
        self.title = "Pagamento"
        
        //CONFIGURACOES NAVIGATION BAR
        navigationBar.backgroundColor = UIColor(red: 255 / 255, green: 252 / 255, blue: 243 / 255, alpha: 1)
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
   
        self.view.addSubview(navigationBar)
        
        // Configuracoes label do Nome
        let fundoNome = UIView.init(frame: CGRectMake(18, retView.frame.maxY * 1.1, 340, 40))
        fundoNome.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 223/255, alpha: 1)
        self.view.addSubview(fundoNome)
        
        labelNome.frame = CGRectMake(fundoNome.frame.minX * 1.8, fundoNome.frame.midY - 10, 100, 20)
        labelNome.textAlignment = NSTextAlignment.Left
        labelNome.textColor = UIColor.blackColor()
        labelNome.text = "\(usuarioLogado.nome)"
        self.view.addSubview(labelNome)
        
        // Configuracoes label do Valor + quantidade de ingressos
        labelValor.center = CGPointMake(view.frame.width/2, view.frame.height/4 + 150)
        labelValor.textAlignment = NSTextAlignment.Center
        labelValor.textColor = UIColor.blackColor()
        labelValor.text = "R$\(50 * usuarioLogado.qtdIngresso) (\(usuarioLogado.qtdIngresso) ingressos)"
        self.view.addSubview(labelValor)
        
        // Configuracoes label do Evento
        labelEvento.frame = CGRectMake(retView.frame.minX * 1.8, retView.frame.minY * 1.15, 400, 20)
        labelEvento.textAlignment = NSTextAlignment.Left
        labelEvento.textColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        usuarioLogado.sessaoComprada = sessaoBatman
        labelEvento.text = nomeSessaoCorrente
        self.view.addSubview(labelEvento)
        
        //Label Sala
        labelSala.frame = CGRectMake(retView.frame.minX * 1.8, retView.frame.minY * 1.425, 400, 20)
        labelSala.textAlignment = NSTextAlignment.Left
        labelSala.textColor = UIColor.blackColor()
        labelSala.text = "GUILHERME COLOCA A SALA AQUI!"
        self.view.addSubview(labelSala)
        
        //Label horário
        labelHorario.frame = CGRectMake(retView.frame.minX * 1.8, retView.frame.minY * 1.7, 400, 20)
        labelHorario.textAlignment = NSTextAlignment.Left
        labelHorario.textColor = UIColor.blackColor()
        labelHorario.text = "GUILHERME COLOCA O HORÁRIO AQUI!"
        self.view.addSubview(labelHorario)
        
        // Configuracoes text field de numero do cartao
        textFieldNumeroCartao.placeholder              = "Número do cartão"
        textFieldNumeroCartao.font                     = UIFont.systemFontOfSize(15)
        textFieldNumeroCartao.borderStyle              = UITextBorderStyle.RoundedRect
        textFieldNumeroCartao.autocorrectionType       = UITextAutocorrectionType.No
        textFieldNumeroCartao.keyboardType             = .EmailAddress
        textFieldNumeroCartao.returnKeyType            = UIReturnKeyType.Done
        textFieldNumeroCartao.clearButtonMode          = UITextFieldViewMode.WhileEditing;
        textFieldNumeroCartao.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textFieldNumeroCartao.center = CGPointMake(view.frame.width/2, view.frame.height/4 + 280)
        self.view.addSubview(textFieldNumeroCartao)
        

        
        //Configuraçoes BUTTON CONFIRMAR
        button.backgroundColor = UIColor(red: 115 / 255, green: 13 / 255, blue: 13 / 255, alpha: 1)
        button.setTitle("Confirmar", forState: UIControlState.Normal)
        button.addTarget(self, action: "confirmacarAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(button)
        

        // ------------------------------------------------  CONFIGURACOES DOS DADOS DO PICKER E SUAS FUNCOES -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- -------- --------
        
        self.view.addSubview(pickerTextField)
        pickerTextField.borderStyle = UITextBorderStyle.RoundedRect
        pickerTextField.font = UIFont.systemFontOfSize(15)
        picker.delegate = self
        picker.dataSource = self
        pickerTextField.inputView = picker
        pickerTextField.placeholder = "Cartão"
        pickerTextField.center = CGPointMake(view.frame.width/2, view.frame.height/4 + 230)
        
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
    
    func voltarAction(sender: AnyObject) {
        
        let palco = ViewPalco()
        
        
        
        palco.imagemSessao.image = imagem
        palco.labelTitulo.text = nomeSessaoCorrente
        palco.labelHorario.text = horarioSessaoCorrente
        
        print(nomeSessaoCorrente)
        print(horarioSessaoCorrente)
        self.presentViewController(palco, animated: true, completion: nil)
        
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
