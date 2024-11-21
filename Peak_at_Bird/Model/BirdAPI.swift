//
//  BirdAPI.swift
//  Peak_at_Bird
//
//  Created by Margaux Mazaleyras on 21/11/2024.
//
import Foundation

class BirdAPI {
    //    @Published var birds: [Bird] = [] // Tableau d'oiseaux
    //
    
    static let shared = BirdAPI()
    
    func fetchBirds(query: String) async -> [Bird] {
        guard let url = URL(string: "https://www.freetestapi.com/api/v1/birds?search=\(query)") else {
            print("Invalid URL")
            return []
        }
        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            var birds : [Bird] = []
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let birdData = try decoder.decode([Bird].self, from: data) // Décoder en tableau
//                    DispatchQueue.main.async {
//                        birds = birdData
//                    }
//                } catch {
//                    print("Error decoding bird data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching bird data: \(error.localizedDescription)")
//            }
//            return birds
//        }
//        task.resume()
        
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let birdData = try decoder.decode([Bird].self, from: data) // Décoder en tableau
           return birdData
        } catch {
            print(error.localizedDescription)
            return[]
        }
    }
}
