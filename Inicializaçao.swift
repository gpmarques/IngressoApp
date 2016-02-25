//
//  Inicializaçao.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

var lugares = [Lugar(fileira: "A", numero: 1),Lugar(fileira: "A", numero: 2),Lugar(fileira: "A", numero: 3),Lugar(fileira: "A", numero: 4),Lugar(fileira: "A", numero: 5),Lugar(fileira: "A", numero: 6)]

let sessao = Sessao(nomeEvento: "Cassia eller", horario: "21:00", qtdLugaresDisponiveis: lugares.count, lugares: lugares)

public var usuariosArray = [Usuario(nome: "Andre Parente", email: "Andremachadoparente@gmail.com", senha: "andre502", qtdIngresso: 0),Usuario(nome: "Guilherme Marques", email: "gpmarques@gmail.com", senha: "guilherme502", qtdIngresso: 0),Usuario(nome: "Ana Carolina Cardoso", email: "cardoso.aana@gmail.com", senha: "ana502", qtdIngresso: 0), Usuario(nome: "Teste", email: "Teste", senha: "teste", qtdIngresso: 0)]

//INICIALIZACAO TESTE!!!!


var usuarioLogado = Usuario(nome: "Andre Parente", email: "Andremachadoparente@gmail.com", senha: "andre502", qtdIngresso: 1)

