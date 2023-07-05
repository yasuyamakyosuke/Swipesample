import SwiftUI

struct ContentView: View {
    let cardSize = CGSize(width: 300, height: 400)
    let cardCount = 5
    @State private var currentIndex = 0
    //カードが表示されているかどうかを示すBool値
    @State private var isCardVisible = true
    //カードがスワイプされる際に水平方向に飛ばすための値
    @State private var cardOffset: CGFloat = 0
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            if isCardVisible {
                CardView {
                    Text("Card \(currentIndex + 1)")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(width: cardSize.width, height: cardSize.height)
                .background(Color.blue)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 1)
                )
                .clipped()
                .offset(x: cardOffset, y: 0)
                .animation(.spring())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.cardOffset = value.translation.width
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                //value.translation.widthの値によってスワイプ方向を判定
                                if value.translation.width < -50 {
                                    self.handleSwipeLeft()
                                } else if value.translation.width > 50 {
                                    self.handleSwipeRight()
                                }
                                self.cardOffset = 0
                            }
                        }
                )
            }
        }
        .onAppear {
            self.currentIndex = cardCount - 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               
            }
        }
    }

    private func handleSwipeLeft() {
        currentIndex -= 1
        //0枚になったら非表示にする
        if currentIndex < 0 {
            currentIndex = 0
            isCardVisible = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                presentationMode.wrappedValue.dismiss()
            }
            print("swipe left")
        }
    }

    private func handleSwipeRight() {
        currentIndex -= 1
        //0枚になったら非表示にする
        if currentIndex < 0 {
            currentIndex = 0
            isCardVisible = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                presentationMode.wrappedValue.dismiss()
            }
        }
        print("swipe right")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}

struct CardView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
        }
    }
}
