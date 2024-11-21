import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @ObservedObject var birdAPI = BirdAPI.shared
    @State var birds: [Bird] = []
    
    var body: some View {
        VStack {
            if birds.isEmpty {
                Text("No birds found")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                BirdListView(birds: birds) // Liste des oiseaux
            }
        }
        .navigationTitle("Search Birds")
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue, initial in
            birdAPI.fetchBirds(query: newValue)
        }
    }
}



struct BirdListView: View {
    var birds: [Bird]
    
    var body: some View {
        List(birds, id: \.id) { bird in
            NavigationLink(destination: DetailView(bird: bird)) {
                BirdRowView(bird: bird)
            }
        }
        .listStyle(.plain) // Optionnel : pour un style de liste minimaliste
    }
}


#Preview {
    NavigationStack {
        SearchView(birds:[Bird.mock, Bird.mock,  .mock])
    }
}

