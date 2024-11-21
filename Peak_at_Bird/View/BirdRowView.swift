import SwiftUI

struct BirdRowView: View {
    var bird: Bird
    
    var body: some View {
        HStack {
            // Si tu veux afficher une image miniature de l'oiseau, tu peux utiliser AsyncImage pour la charger de manière asynchrone.
            AsyncImage(url: URL(string: bird.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Appliquer les coins arrondis à l'image
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            
            Text(bird.name)
                .font(.headline)
        }
        .padding() // Ajoute un padding horizontal (espacement sur les côtés)
        .frame(maxWidth: .infinity) // Prendre toute la largeur de l'écran
        .background(Color.white)  // Ajouter une couleur de fond pour le cadre
        .clipShape(RoundedRectangle(cornerRadius: 10))  // Appliquer des coins arrondis sur l'ensemble de la cellule
        .shadow(radius: 3)  // Optionnel : ajouter une ombre pour plus d'effet visuel
        .padding(.horizontal)
    }
}


#Preview {
    BirdRowView(bird: Bird.mock)
}
