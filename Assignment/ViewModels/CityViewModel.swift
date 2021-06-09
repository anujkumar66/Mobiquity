//
//  APIService.swift
//  Assignment
//

import Foundation
typealias foreCastDataCompletionClosure = (_ data: CurrentForeCast ) -> Void

class CityViewModel {
    
    init() { }
    
    func getForeCastData(latitude: String, longitude:String, completionHanlder: @escaping foreCastDataCompletionClosure) {
        print("sdfdsf")
        let foreCastUrl = Constants.weatherUrl +  "lat=\(latitude)" + "&lon=\(longitude)" + "&appid=\(Constants.apiKey)"
        var request = URLRequest(url: URL(string: foreCastUrl)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let decoder = JSONDecoder()
                let currentForeCast = try decoder.decode(CurrentForeCast.self, from: data!)
                completionHanlder(currentForeCast)
            } catch (let error) {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
