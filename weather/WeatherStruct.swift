import Foundation

struct WeatherStruct: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: WeatherMain
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherMain: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let tempMin: Double
    let tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

struct Clouds: Decodable {
    let all: Int
}

struct Sys: Decodable {
    let type: Int
    let id: Int
    let message: Double
    let country: String
    let sunrise: Int
    let sunset: Int
}
