//
//  PersonViewController.swift
//  WeatherOne
//
//  Created by Gavril Tonev on 2/9/16.
//  Copyright © 2016 Gavril Tonev. All rights reserved.
//

import UIKit

enum WeatherStatus {
    case Good
    case Bad
    case RunAway
    case InstaDeath
}

class PersonViewController: UIViewController
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImageVIew: UIImageView!
    
    var person: Person!
    
    
    func getWeatherImage(weatherStatus: WeatherStatus) -> UIImage {
        var imageUrl: String = ""
        switch weatherStatus {
        case .Good: imageUrl = "https://lh6.ggpht.com/zKxCMk0WEukPPgE9kBDhoDebAWxniEZey4XuGeQQHh-G8aW-JflSP3vYz2S8bMh9jo-C=w300"
        case .Bad: imageUrl = "http://www.gannett-cdn.com/-mm-/3526533239800dac0c978150377d099025f1e52c/c=52-700-4303-3102&r=x1683&c=3200x1680/local/-/media/USATODAY/None/2014/10/03/1412368123000-Mesostorm-Lightning.jpg"
        case .RunAway: imageUrl = "http://a.fastcompany.net/multisite_files/fastcompany/poster/2013/12/3023354-poster-p-1-now-weather-channel-a-storm-brews-over-weather.jpg"
        case .InstaDeath: imageUrl = "http://wallpaper.ultradownloads.com.br/276805_Papel-de-Parede-Monstro-das-Profundezas-do-Inferno_1440x900.jpg"
        }
        
        let url = NSURL(string: imageUrl)!
        let data = NSData(contentsOfURL: url)!
        let image = UIImage(data: data)!
        
        return image
    }
    
    func setupUI() {
        self.navigationController?.navigationBarHidden = false
        nameLabel.text = person.name
        locationLabel.text = person.location
        
        var currentWeather = WeatherStatus.Good
        switch person.location {
            case "Blago": currentWeather = .Bad
            case "Sofia": currentWeather = .Good
            case "Plovdiv": currentWeather = .InstaDeath
            default: break
        }
        
        weatherImageVIew.image = getWeatherImage(currentWeather)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
}