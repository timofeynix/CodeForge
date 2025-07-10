import SwiftUI

struct ContentView: View {
    let themes = [
        ["👻", "🎃", "🍭", "😈", "💀", "🕸️", "🎃", "😈", "👹", "😱", "💀", "🍭"],
        ["🍒", "🍓", "🍋", "🍒", "🍉", "🍇", "🍇", "🍉", "🍏", "🍑", "🍐", "🍏"],
        ["🚗", "🚀", "🚁", "🚃", "🚄", "🚄", "🚆", "🚀", "🚗", "🚉", "🚉", "🚃"]
    ]
    
    @State var cardCount: Int = 4
    @State private var currentThemeIndex = 0
    @State private var shuffledTheme: [String] = []
    
    private func shuffleTheme() {
        shuffledTheme = themes[currentThemeIndex].shuffled()
        cardCount = min(cardCount, themes[currentThemeIndex].count)
    }
    
    var body: some View {
        VStack {
            title
            Spacer(minLength: 20)
            ScrollView {
                cards
            }
            themeChanger
            cardCountAdjusters
        }
        .padding()
        .onAppear {
            shuffleTheme()
        }
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundStyle(.gray)
    }
    
    let themeColors: [Color] = [.orange, .purple, .blue]
    let themeIcons = ["moon.stars.fill", "leaf.fill", "car.fill"]
    let themeNames = ["Halloween", "Fruits", "Vehicles"]

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 67))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                if index < shuffledTheme.count {
                    CardView(content: shuffledTheme[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundStyle(themeColors[currentThemeIndex])
    }

    var themeChanger: some View{
        HStack {
            ForEach(0..<themes.count, id: \.self) {
                index in
                Button {
                    currentThemeIndex = index
                    shuffleTheme()
                } label: {
                    VStack {
                        Image(systemName: themeIcons[index])
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundStyle(themeColors[index])
                        Text(themeNames[index])
                            .font(.footnote)
                            .foregroundStyle(themeColors[index])
                    }
                }
            }
        }
    }
      
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > themes[currentThemeIndex].count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
            .foregroundStyle(.red)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
            .foregroundStyle(.green)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
