import SwiftUI
import UIKit

struct DetailView: View {
    
    var bird : Bird
    @ObservedObject var viewModel: ViewModel
    
    init(bird: Bird) {
        self.bird = bird
        self.viewModel = ViewModel(bird: bird)
    }
    
    var body: some View {
        VStack {
            Text(bird.name)
                .font(.largeTitle)
            Text("Species : \(bird.species)")
            Text("Family : \(bird.family)")
            Text("Habitat : \(bird.habitat)")
            Text("Place of found : \(bird.placeOfFound)")
            Text("Diet : \(bird.diet)")
            Text("Description : \(bird.description)")
            Text("Wingspan : \(bird.wingspanCm) cm")
            Text("Av. weight: \(String(format: "%.1f", bird.weightKg)) kg")
            if let image = viewModel.image {
                Image(uiImage: image)
                    .padding()
            }
        }
        .padding()
            
        
    }
}

#Preview {
    DetailView(bird: Bird.mock)
}

extension DetailView {
    
    class ViewModel: ObservableObject {
        
        var bird: Bird
        
        @Published var image: UIImage?
        
        init(bird: Bird) {
            self.bird = bird
            DispatchQueue.main.async {
                self.image = self.fetchImage(urlString: bird.image)
            }
        }
        
        func fetchImage(urlString: String) -> UIImage? {
            //try to download image
            // Affiche l'image de l'oiseau ou une URL de fallback si l'image est invalide
            Task {
                
            }
            /*if let url = URL(string:"https://cdn.download.ams.birds.cornell.edu/api/v1/asset/306062281/480"),let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                return image
            } else*/ if let url = URL(string:urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                return image
            }
            return nil
        }
    }
}
