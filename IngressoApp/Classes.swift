//
//  Classes.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/22/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

import UIKit

public struct Lugar {
    
    var fileira: Character!
    var numero: Int!
    var estaOcupado: Bool
    var estaMarcado: Bool
    
    init(fileira: Character, numero: Int) {
        self.fileira = fileira
        self.numero = numero
        self.estaOcupado = false
        self.estaMarcado = false
    }
    
}

public class Sessao {
    
    public var lugares: [Lugar]!
    public var qtdLugaresDisponiveis: Int!
    var horario: String!
    let preco = 50
    public var nomeEvento: String!
    
    init(nomeEvento: String, horario: String,qtdLugaresDisponiveis: Int, lugares: [Lugar]) {
        self.nomeEvento = nomeEvento
        self.horario = horario
        self.qtdLugaresDisponiveis = qtdLugaresDisponiveis
        self.lugares = lugares
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
    
    func ocuparLugar(fileira: Character, numero: Int, sessao: Sessao) {
        
        if(sessao.qtdLugaresDisponiveis > 0) {
            
            for i in 0...sessao.lugares.count {
                if(sessao.lugares[i].fileira == fileira && sessao.lugares[i].numero == numero && !sessao.lugares[i].estaMarcado && !sessao.lugares[i].estaOcupado) {
                    sessao.lugares[i].estaMarcado = true
                    sessao.lugares[i].estaOcupado = true
                }
            }
        }
    }
}

