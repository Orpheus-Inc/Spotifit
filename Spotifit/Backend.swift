//
//  Backend.swift
//  Spotifit
//
//  Created by Cameron Sherry on 5/31/21.
//

import WebKit
import Foundation

let defaults = UserDefaults.standard

//API
let rec_url_flag = "recommendations?"
let rec_limit = ["limit": 30]
let target_tempo = ["target_tempo": 152]
let api_version = "v1/"
let api_url = "https://api.spotify.com/" + api_version

func printAuthHeader() {
    print(["Authorization": "Bearer " + defaults.string(forKey: "spotifyAccessToken")!])
}

func buildURL(url: String) -> URLRequest {
    let urlBuilder = URLComponents(string: url)
    
    let url = (urlBuilder?.url)!
    
    var request = URLRequest(url: url)
    request.setValue("Bearer " + defaults.string(forKey: "spotifyAccessToken")!, forHTTPHeaderField: "Authorization")
    
    return request
}

func initiateRequest(request: URLRequest) -> [AnyHashable: Any] {
    var d: [AnyHashable: Any] = [:]
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
        if error == nil {
            print("RESPONSE: ", response!)
            d = try! (JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any])!
        }
    }
    task.resume()
    
    return d
}

func get_personalized_data(option: String) {
    let urlString = api_url + "me/top/" + option + "/"
    let url = buildURL(url: urlString)
    print(initiateRequest(request: url))
}
