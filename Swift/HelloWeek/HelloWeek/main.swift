import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "EEEE"

let today = Date()

var dayName = dateFormatter.string(from: today)

let emojiMap = [
    "Monday": "😭",
    "Tuesday": "😔",
    "Wednesday": "😐",
    "Thursday": "🙂",
    "Friday": "😄",
    "Saturday": "🥳",
    "Sunday": "🤩"
]

let todaysEmoji = emojiMap[dayName] ?? "❓"

if dayName == "Saturday" || dayName == "Sunday" {
    print("Hello, World! \(todaysEmoji)")
} else {
    print("Hello, World. \(todaysEmoji)")
}
