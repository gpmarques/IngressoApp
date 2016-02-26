//
//  ViewEventos.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/22/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class ViewEventos: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var navigationBarEventos: UINavigationBar!
    var navigationItemEventos = UINavigationItem()
    let nome = [sessaoBatman.nomeEvento,sessaoSkyFall.nomeEvento]
    let nomeImagem = [sessaoBatman.imagePath, sessaoSkyFall.imagePath]
    let horario = [sessaoBatman.horario,sessaoSkyFall.horario]
    let salas = ["Sala 1", "Sala 2"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 80, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 340, height: 240)
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.registerClass(RDCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
        
        navigationBarEventos = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44 + statusBarHeight))
        navigationItemEventos.title = "Eventos"
        
        navigationBarEventos.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 223/255, alpha: 1)
        navigationBarEventos.items = [navigationItemEventos]
        self.view.addSubview(navigationBarEventos)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath ) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! RDCell
        cell.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 223/255, alpha: 1)
        cell.titulo.text = nome[indexPath.row]
        cell.local.text = salas[indexPath.row]
        cell.horario.text = horario[indexPath.row]
        cell.imageView.image = UIImage(named: nomeImagem[indexPath.row])
        cell.buyButton.tag = indexPath.row
        cell.buyButton.addTarget(self, action: "comprarAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    
    }
    
    func comprarAction(sender:UIButton) {
        
        let vc = ViewPalco()
        vc.imagemSessao.image =  UIImage(named: nomeImagem[sender.tag])
        vc.titulo = nome[sender.tag]
        vc.sala = salas[sender.tag]
        vc.horario = horario[sender.tag]
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


