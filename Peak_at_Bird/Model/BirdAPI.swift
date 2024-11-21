//
//  BirdAPI.swift
//  Peak_at_Bird
//
//  Created by Margaux Mazaleyras on 21/11/2024.
//
import Foundation

class BirdAPI: ObservableObject {
    @Published var birds: [Bird] = [] // Tableau d'oiseaux
    
    static let shared = BirdAPI()

    func fetchBirds(query: String) {
        guard let url = URL(string: "https://www.freetestapi.com/api/v1/birds?search=\(query)") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let birdData = try decoder.decode([Bird].self, from: data) // Décoder en tableau
                    DispatchQueue.main.async {
                        self.birds = birdData
                    }
                } catch {
                    print("Error decoding bird data: \(error)")
                }
            } else if let error = error {
                print("Error fetching bird data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
