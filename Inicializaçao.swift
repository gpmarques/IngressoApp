//
//  Inicializaçao.swift
//  IngressoApp
//
//  Created by Andre Machado Parente on 2/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

public var sessaoBatman = Sessao(nomeEvento: "Batman: O Cavaleiro das Trevas", horario: "16:30", qtdLugaresDisponiveis: 50, imagem:"Batman")
public var sessaoSkyFall = Sessao(nomeEvento: "007 - Operação SkyFall", horario: "19:30", qtdLugaresDisponiveis: 50, imagem:"Skyfall")
public var sessaoVingadores = Sessao(nomeEvento: "Os Vingadores", horario: "13:30", qtdLugaresDisponiveis: 50, imagem:"Vingadores")
public var vetorSessoes = [sessaoBatman, sessaoSkyFall, sessaoVingadores]
public var usuariosArray = [Usuario(nome: "Andre Parente", email: "Andremachadoparente@gmail.com", senha: "andre502", qtdIngresso: 0),Usuario(nome: "Guilherme Marques", email: "gpmarques@gmail.com", senha: "guilherme502", qtdIngresso: 0),Usuario(nome: "Ana Carolina Cardoso", email: "cardoso.aana@gmail.com", senha: "ana502", qtdIngresso: 0), Usuario(nome: "Teste", email: "Teste", senha: "teste", qtdIngresso: 0)]

//INICIALIZACAO TESTE!!!!

var usuarioLogado:  Usuario!

