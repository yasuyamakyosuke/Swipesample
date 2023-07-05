import SwiftUI

struct searchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @State private var isShowingNewView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass") // 検索アイコン
                    TextField("Search ...", text: $searchText)
                }
                .padding()
                .background(Color(.systemGray6)) // 背景色
                .padding()
                
                Spacer()
                
                NavigationLink(destination: ContentView(), isActive: $isShowingNewView) {
                    Button {
                        isShowingNewView = true
                    } label: {
                        Text("検索する")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                
                Spacer()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}
