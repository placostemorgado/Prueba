//
//  Estructura.swift
//  Prueba
//
//  Created by Pedro Lacoste on 01-12-24.
//

import Foundation

struct Libro: Codable {
    let exhaustive: Detalle1?
}

struct Question: Codable {
    let score: Int
    let title: String
}

struct Detalle1: Codable {
    let nbHits: Bool
    let typo: Bool
}

struct Detalle2: Codable {
    let exhaustiveNbHits: Bool
    let exhaustiveTypo: Bool
    let hits: [Hit]
    let hitsPerPage: Int
    let nbHits: Int
    let nbPages: Int
    let page: Int
    let params: String
    let processingTimeMS: Int
    let processingTimingsMS: String
}

struct Hit: Codable {
    
}

struct Detalle3: Codable {
    
    let _highlightResult: Autor?
    let _tags: Autor1?
}

struct Autor: Codable {
    let name: String
}

struct Autor1: Codable {
    let name: String
}
