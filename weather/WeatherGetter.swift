import Foundation
class WeatherGetter {

    var localWeatherStruct: WeatherStruct? = nil

    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "3ed83741c652e2e0eba2cba1843820bf"
    func getWeather(city: String){

        var resultStruct: WeatherStruct!
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared

        let weatherRequestURL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(openWeatherMapAPIKey)")!

        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL as URL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                print("Raw data:\n\(data!)\n")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                do {
                    let myStruct = try JSONDecoder().decode(WeatherStruct.self, from: data!)
                 //   print (myStruct)
                    self.localWeatherStruct = myStruct
                }
                catch let error {
                    print(error)
                }
                // print("Human-readable data:\n\(dataString!)")
            }
        }
        dataTask.resume()
    }

    func getLocalWeather()->WeatherStruct {
        return localWeatherStruct!
    }
}
