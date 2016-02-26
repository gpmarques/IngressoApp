//
//  RDCell.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/26/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

public class RDCell: UICollectionViewCell {
    
    
    var titulo: UILabel!
    var local: UILabel!
    var horario: UILabel!
    
    var imageView: UIImageView!
    var buyButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 340, height: 159))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
        
        titulo = UILabel(frame: CGRect(x: 11, y: imageView.frame.size.height + 8, width: 321, height: 22))
        titulo.font = UIFont.systemFontOfSize(18)
        titulo.textAlignment = .Left
        titulo.textColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        contentView.addSubview(titulo)
        
        local = UILabel(frame: CGRect(x: 11, y: imageView.frame.size.height + 34, width: 321, height: 22))
        local.font = UIFont.systemFontOfSize(16)
        local.textAlignment = .Left
        local.textColor = UIColor.blackColor()
        contentView.addSubview(local)
        
        horario = UILabel(frame: CGRect(x: 11, y: imageView.frame.size.height + 56, width: 321, height: 22))
        horario.font = UIFont.systemFontOfSize(16)
        horario.textAlignment = .Left
        horario.textColor = UIColor.blackColor()
        contentView.addSubview(horario)
        
        buyButton = UIButton(frame: CGRect(x: 227, y: 200, width: 105, height: 30))
        buyButton.backgroundColor = UIColor(red: 115/255, green: 13/255, blue: 13/255, alpha: 1)
        buyButton.setTitle("COMPRAR", forState: UIControlState.Normal)
        buyButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        self.contentView.addSubview(self.buyButton)
        
        
        
    }

    
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}