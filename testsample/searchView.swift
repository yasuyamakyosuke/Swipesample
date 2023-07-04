import SwiftUI

struct searchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingView: Bool = false
    var body: some View {
        VStack {
            Button {
                isShowingView.toggle()
            } label: {
                Text("シート")
            }
            .sheet(isPresented: $isShowingView) {
                ContentView()
            }
            }
        }
    }

struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}
