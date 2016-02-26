//
//  ViewPalco.swift
//  IngressoApp
//
//  Created by Guilherme Marques on 2/23/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ViewPalco: UIViewController, ZSeatSelectorDelegate {
    
    var imagemSessao = UIImageView(frame: CGRectMake(0,64,375,175))
    var titulo: String!
    var horario: String!
    var sala: String!
    let labelTitulo = UILabel(frame: CGRectMake(30, 258, 315, 24))
    let labelHorario = UILabel(frame: CGRectMake(30, 310, 315, 20))
    let labelSala = UILabel(frame: CGRectMake(30, 288, 315, 20))
    let button = UIButton(frame: CGRectMake(32, 607, 315, 40))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)

        //labelTitulo.text = titulo
        labelTitulo.textColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        
        //labelHorario.text = horario
        labelHorario.textColor = UIColor.blackColor()
        
        //labelSala.text = sala
        labelSala.textColor = UIColor.blackColor()
        
        //Configuraçoes BUTTON CONFIRMACAO
        button.backgroundColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        button.setTitle("Confirmar", forState: UIControlState.Normal)
        button.addTarget(self, action: "confirmacaoAction", forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.view.addSubview(button)
        
        //labelTitulo.center = CGPointMake(view.frame.width/2,view.frame.height/2)
        //labelHorario.center = CGPointMake(view.frame.width/2,view.frame.height/2 + 40)
        self.view.addSubview(imagemSessao)
        self.view.addSubview(labelHorario)
        self.view.addSubview(labelSala)
        self.view.addSubview(labelTitulo)
        
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44+statusBarHeight)) // Offset by 20 pixels vertically to take the status bar into account
        let navigationItem = UINavigationItem()
        navigationItem.title = "Evento"
        let leftButton =  UIBarButtonItem(title: "Voltar", style:   UIBarButtonItemStyle.Plain, target: self, action: "voltarAction")
        navigationItem.leftBarButtonItem = leftButton
        
        self.title = "Evento"
        
        //CONFIGURACOES NAVIGATION BAR
        navigationBar.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)

        
        let map:String =    "AAAAA_AAAAA/" +
                            "AAAAA_AAAAA/" +
                            "AAAAA_AAAAA/" +
                            "AAAAA_AAAAA/" +
                            "AAAAA_AAAAA/";
        
        let seats = ZSeatSelector()
        seats.frame = CGRectMake(30, 340, 315, 200)
        seats.setSeatSize(CGSize(width: 20, height: 20))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage:UIImage(named: "U")!,
            andDisabledImage:   UIImage(named: "D")!,
            andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.seat_price = 50.0
        seats.seatSelectorDelegate = self
        self.view.addSubview(seats)

        // Do any additional setup after loading the view.
    }
    
    func seatSelected(seat: ZSeat) {
        //print("Seat at row: \(seat.row) and column: \(seat.column)\n")
        
        if(seat.available) {
            if(seat.selected_seat) {
                usuarioLogado.qtdIngresso = usuarioLogado.qtdIngresso + 1
            }
                
            else {
                usuarioLogado.qtdIngresso = usuarioLogado.qtdIngresso - 1
            }
        }
        
    }
    
    func getSelectedSeats(seats: NSMutableArray) {
        var total:Float = 0.0;
        for i in 0..<seats.count {
            let seat:ZSeat  = seats.objectAtIndex(i) as! ZSeat
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
            print("O usuario logado possui \(usuarioLogado.qtdIngresso) marcados")
            total += seat.price
        }
        print("----- Total -----\n")
        print("----- \(total) -----\n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func voltarAction() {
        
        self.presentViewController(ViewEventos(), animated: true, completion: nil)
        
    }
    
    func confirmacaoAction() {
        
        let vc = ViewPagamento()
        
        vc.imagem = imagemSessao.image
        vc.nomeSessaoCorrente = labelTitulo.text
        vc.horarioSessaoCorrente = labelHorario.text
        
        self.presentViewController(vc, animated: true, completion: nil)
        
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
