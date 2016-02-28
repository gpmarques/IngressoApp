//
//  Classes.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/22/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

import UIKit

public class Sessao {
    
    public var qtdLugaresDisponiveis: Int!
    var horario: String!
    let preco = 50
    public var nomeEvento: String!
    public var imagePath: String!
    
    init(nomeEvento: String, horario: String,qtdLugaresDisponiveis: Int, imagem: String) {
        self.nomeEvento = nomeEvento
        self.horario = horario
        self.qtdLugaresDisponiveis = qtdLugaresDisponiveis
        self.imagePath = imagem
    }
    
}

public class Usuario {
    
    var nome: String!
    var email: String!
    private var senha: String!
    public var qtdIngresso: Int!
    public var sessaoComprada: Sessao!
    
    
    init(nome: String, email: String,senha: String,qtdIngresso: Int) {
        self.nome = nome
        self.senha = senha
        self.email = email
        self.qtdIngresso = qtdIngresso
    }
    
    public func setNomeUsuario(nome: String) {
        self.nome = nome
    }
    
    public func getNomeUsuario() -> String {
        return self.nome
    }
    
    public func setEmail(email: String) {
        self.email = email
    }
    
    public func getEmail()->String {
        return self.email
    }
    
    public func setSenha(senha: String) {
        self.senha = senha
    }
    
    public func getSenha() -> String {
        return self.senha
    }
    
}

