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
    let nome = ["Batman"," O hobbit"]
    let nomeImagem = ["Imagem Batman", "Imagem Hobbit"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width, height: 200)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.registerClass(RDCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(collectionView)
        
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
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 5))
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            contentView.addSubview(imageView)
            
            textLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.size.height, width: frame.size.width - 13, height: frame.size.height/15 + 6))
            textLabel.center = CGPointMake(frame.size.width/2, frame.size.height)
            textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
            textLabel.textAlignment = .Left
            textLabel.backgroundColor = UIColor.blackColor()
            textLabel.textColor = UIColor.whiteColor()
            contentView.addSubview(textLabel)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    
    }


}
