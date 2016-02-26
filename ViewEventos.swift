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
    let nome = ["Batman"," O hobbit"]
    let nomeImagem = ["Batman", "Imagem Hobbit"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 96, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width, height: 200)
        layout.minimumLineSpacing = 81
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.registerClass(RDCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
        
        navigationBarEventos = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44 + statusBarHeight))
        navigationItemEventos.title = "Eventos"
        
        navigationBarEventos.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)
        navigationBarEventos.items = [navigationItemEventos]
        self.view.addSubview(navigationBarEventos)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath ) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! RDCell

        cell.textLabel.text = nome[indexPath.row]
        cell.imageView.image = UIImage(named: nomeImagem[indexPath.row])
    
        
        return cell
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class RDCell: UICollectionViewCell {
       
        
        var textLabel: UILabel!
        var imageView: UIImageView!
        var buyButton: UIButton!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            imageView = UIImageView(frame: CGRect(x: 18, y: 0, width: 340, height: 159))
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            contentView.addSubview(imageView)
            
            textLabel = UILabel(frame: CGRect(x: 2, y: imageView.frame.size.height , width: 340, height: 85
                ))
            textLabel.center = CGPointMake(frame.size.width/2, frame.size.height)
            textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
            textLabel.textAlignment = .Left
            textLabel.backgroundColor =  UIColor(red: 255/255, green: 252/255, blue: 243/255, alpha: 1)
            textLabel.textColor = UIColor.blackColor()
            contentView.addSubview(textLabel)
            
            buyButton = UIButton(frame: CGRect(x: 227, y: 200, width: 105, height: 30))
            buyButton.backgroundColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
            buyButton.setTitle("COMPRAR", forState: UIControlState.Normal)

            
            contentView.addSubview(buyButton)
            
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    
    }


}
