//
//  Bird.swift
//  Peak_at_Bird
//
//  Created by Margaux Mazaleyras on 20/11/2024.
//

import Foundation

struct Bird: Identifiable, Decodable {
    var id: Int
    var name: String
    var species: String
    var family: String
    var habitat: String
    var placeOfFound: String
    var diet: String
    var description: String
    var wingspanCm : Int?
    var weightKg: Float
    var image: String
    

    
    static var mock : Bird {
        .init(id: 1, name: "Bald Eagle", species: "Haliaeetus leucocephalus", family: "Accipitridae", habitat: "Forests, Coasts, and Lakes", placeOfFound: "North America", diet: "Carnivore", description: "The bald eagle is a powerful bird of prey known for its white head and tail feathers.", wingspanCm: 200, weightKg: 6.3, image: "https://fakeimg.pl/500x500/cc7701")
    }
    
    
}
