import SwiftUI
import UIKit

struct SearchView: View {


//    @ObservedObject var birdAPI = BirdAPI.shared
   
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.birds.isEmpty {
                Text("No birds found")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                BirdListView(birds: viewModel.birds) // Liste des oiseaux
            }
        }
        .navigationTitle("Search Birds")
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) { newValue, initial in
//            birdAPI.fetchBirds(query: newValue)
            viewModel.fetchBirds(query: newValue)
        }
    }
    
    init (birds: [Bird] = []) {
        viewModel = .init(tabBirds: birds)
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

extension SearchView {
    
    class ViewModel: ObservableObject {
        
        @Published var searchText = ""
        @Published var birds: [Bird]
        
        init(tabBirds: [Bird]) {
            self.birds = tabBirds
        }
        
        func fetchBirds(query: String) {
            Task {
                let newBirds =  await BirdAPI.shared.fetchBirds(query: query)
                DispatchQueue.main.async {
                    self.birds = newBirds
                }
            }
            
        }
    }
}
