//
//  CityViewController.swift
//  Assignment
//

import UIKit

class CityViewController: UIViewController {
   
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainChancesLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegLabel: UILabel!
    @IBOutlet weak var windGustLabel: UILabel!
    private let cityViewModel = CityViewModel()
    var location: Cordinates! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today's forecast"
        
        let cityLocCompletionClosure = { [weak self] ( data: CurrentForeCast ) -> Void in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                if let temp = data.main?.temp {
                    strongSelf.temperatureLabel.text = "Temperature: \(temp)"
                }
                if let humidity = data.main?.humidity {
                    strongSelf.humidityLabel.text = "Humidity: \(humidity)"
                }
                if let rainChances = data.clouds?.all {
                    strongSelf.rainChancesLabel.text = "Rain Chances: \(rainChances)%"
                }
                if let windSpeed = data.wind?.speed {
                    strongSelf.windSpeedLabel.text = "Speed: \(windSpeed)"
                }
                if let windDeg = data.wind?.deg {
                    strongSelf.windDegLabel.text = "Deg: \(windDeg)"
                }
                if let windGust = data.wind?.gust {
                    strongSelf.windGustLabel.text = "Gust: \(windGust)"
                }
            }
        }
        cityViewModel.getForeCastData(latitude: String(location.lat!), longitude: String(location.lon!), completionHanlder: cityLocCompletionClosure)
    }
}
