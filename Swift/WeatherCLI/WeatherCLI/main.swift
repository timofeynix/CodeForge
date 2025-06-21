// Minimal terminal weather checker
// Uses wttr.in API (will likely migrate to another API later)

// Import Apple's core framework
import Foundation

print("Welcome to WeatherCLI!")
print("Enter a city name or zip code:")

// Get user input (Dublin = default)
let location = readLine() ?? "Dublin"

// Build API URL with minimal text format
// TODO: Experiment with other formats
let url = URL(string: "https://wttr.in/\(location)?format=3")!

let data = try! Data(contentsOf: url)

// Convert to string and display.
let weatherTxt = String(data: data, encoding: .utf8)!

print("Current weather: \(weatherTxt)")

