
import Foundation // Arrays, Ints, Bools, Dictionaries — non-UI

struct MemoryGame<CardContent> {
    // Question yourself: "What does this thing do? What data does it have associated with it?"
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}


