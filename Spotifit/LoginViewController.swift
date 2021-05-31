//
//  LoginViewController.swift
//  Spotifit
//
//  Created by Alyssa Harvey on 5/17/21.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {

    @IBOutlet weak var spotifyLoginButton: UIButton!
    
    var spotifyId = ""
    var spotifyDisplayName = ""
    var spotifyEmail = ""
    var spotifyAvatarURL = ""
    var spotifyAccessToken = ""
    
    @IBAction func spotifyLoginButtonAction(_ sender: UIButton) {
        spotifyAuthVC()
    }
    
    var webView = WKWebView()
        func spotifyAuthVC() {
            // Create Spotify Auth ViewController
            let spotifyVC = UIViewController()
            // Create WebView
            let webView = WKWebView()
            webView.navigationDelegate = self
            spotifyVC.view.addSubview(webView)
            webView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                webView.topAnchor.constraint(equalTo: spotifyVC.view.topAnchor),
                webView.leadingAnchor.constraint(equalTo: spotifyVC.view.leadingAnchor),
                webView.bottomAnchor.constraint(equalTo: spotifyVC.view.bottomAnchor),
                webView.trailingAnchor.constraint(equalTo: spotifyVC.view.trailingAnchor)
                ])

            let authURLFull = "https://accounts.spotify.com/authorize?response_type=token&client_id=" + spotifyConstants.CLIENT_ID + "&scope=" + spotifyConstants.SCOPE + "&redirect_uri=" + spotifyConstants.REDIRECT_URI + "&show_dialog=false"

            let urlRequest = URLRequest.init(url: URL.init(string: authURLFull)!)
            webView.load(urlRequest)

            // Create Navigation Controller
            let navController = UINavigationController(rootViewController: spotifyVC)
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelAction))
            spotifyVC.navigationItem.leftBarButtonItem = cancelButton
            let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshAction))
            spotifyVC.navigationItem.rightBarButtonItem = refreshButton
            let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navController.navigationBar.titleTextAttributes = textAttributes
            spotifyVC.navigationItem.title = "spotify.com"
            navController.navigationBar.isTranslucent = false
            navController.navigationBar.tintColor = UIColor.white
            navController.navigationBar.barTintColor = UIColor.black
            navController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            navController.modalTransitionStyle = .coverVertical

            self.present(navController, animated: true, completion: nil)
        }

        @objc func cancelAction() {
            self.dismiss(animated: true, completion: nil)
        }

        @objc func refreshAction() {
            self.webView.reload()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        RequestForCallbackURL(request: navigationAction.request)
        decisionHandler(.allow)
    }

    func RequestForCallbackURL(request: URLRequest) {
        // Get the access token string after the '#access_token=' and before '&token_type='
        let requestURLString = (request.url?.absoluteString)! as String
        if requestURLString.hasPrefix(spotifyConstants.REDIRECT_URI) {
            if requestURLString.contains("#access_token=") {
                if let range = requestURLString.range(of: "=") {
                    let spotifAcTok = requestURLString[range.upperBound...]
                    if let range = spotifAcTok.range(of: "&token_type=") {
                        let spotifAcTokFinal = spotifAcTok[..<range.lowerBound]
                        handleAuth(spotifyAccessToken: String(spotifAcTokFinal))
                    }
                }
            }
        }
    }

    
    func handleAuth(spotifyAccessToken: String) {
            fetchSpotifyProfile(accessToken: spotifyAccessToken)

            // Close Spotify Auth ViewController after getting Access Token
            self.dismiss(animated: true, completion: nil)
        }


        func fetchSpotifyProfile(accessToken: String) {
            let tokenURLFull = "https://api.spotify.com/v1/me"
            let verify: NSURL = NSURL(string: tokenURLFull)!
            let request: NSMutableURLRequest = NSMutableURLRequest(url: verify as URL)
            request.addValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if error == nil {
                    let result = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any]
                    //AccessToken
                    print("Spotify Access Token: \(accessToken)")
                    self.spotifyAccessToken = accessToken
                    //Spotify Handle
                    let spotifyId: String! = (result?["id"] as! String)
                    print("Spotify Id: \(spotifyId ?? "")")
                    self.spotifyId = spotifyId
                    //Spotify Display Name
                    let spotifyDisplayName: String! = (result?["display_name"] as! String)
                    print("Spotify Display Name: \(spotifyDisplayName ?? "")")
                    self.spotifyDisplayName = spotifyDisplayName
                    //Spotify Email
                    let spotifyEmail: String! = (result?["email"] as! String)
                    print("Spotify Email: \(spotifyEmail ?? "")")
                    self.spotifyEmail = spotifyEmail
                    //Spotify Profile Avatar URL
                    let spotifyAvatarURL: String!
                    let spotifyProfilePicArray = result?["images"] as? [AnyObject]
                    if (spotifyProfilePicArray?.count)! > 0 {
                        spotifyAvatarURL = spotifyProfilePicArray![0]["url"] as? String
                    } else {
                        spotifyAvatarURL = "Not exists"
                    }
                    print("Spotify Profile Avatar URL: \(spotifyAvatarURL ?? "")")
                    self.spotifyAvatarURL = spotifyAvatarURL
                }
            }
            task.resume()
        }
}
