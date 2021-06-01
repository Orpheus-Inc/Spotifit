//
//  Backend.swift
//  Spotifit
//
//  Created by Cameron Sherry on 5/31/21.
//

import Foundation

let defaults = UserDefaults.standard

//URLSESSION
let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

//API
let rec_url_flag = "recommendations?"
let rec_limit = ["limit":  3]
let api_version = "v1/"
let api_url = "https://api.spotify.com/" + api_version

//BACKEND
let backend_url = "https://spotifit.herokuapp.com/"
let playlist_creation_flag = "create-playlist/"

//Global Vars
var d = Data()

func printAuthHeader() {
    print(["Authorization": "Bearer " + defaults.string(forKey: "spotifyAccessToken")!])
}

func get_complete_playlist(energy: Int, tempo: Int) {
    
    let url = backend_url + playlist_creation_flag + "tempo=" + String(tempo) + "&energy=" + String(energy)
    
    let urlBuilder = URLComponents(string: url)
    
    let authenticated_url = (urlBuilder?.url)!
    
    var request = URLRequest(url: authenticated_url)
    request.setValue("Bearer " + defaults.string(forKey: "spotifyAccessToken")!, forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
        if error == nil {
            print("RESPONSE: ", response!)
            print("DATA: ", String(data: data!, encoding: .utf8))
        }
    }
    task.resume()
    
}
