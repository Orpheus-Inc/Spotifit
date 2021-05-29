//
//  PlaylistViewController.swift
//  Spotifit
//


import UIKit

class PlaylistViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Energy picker outlet
    @IBOutlet weak var energyLevelPicker: UIPickerView!
    
    // BPM value outlet
    @IBOutlet weak var bpmValue: UILabel!
    
    // BPM stepper outlet
    @IBOutlet weak var bpmStepper: UIStepper!
    
    var pickerData: [String] = [String]() // Energy picker data
    var bpmData: Int = 0 // BPM data to be passed to Spotify
    var energyData: String = "" // Energy level data to be passed to Spotify
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.energyLevelPicker.delegate = self
        self.energyLevelPicker.dataSource = self
        
        // Assign data
        pickerData = ["Just Chilling", "Bicycle Pump", "Pretty pumped", "Pumped as hell!"]

        // Do any additional setup after loading the view.
    }
    
    // Number of columns in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of rows in picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // Connect data to picker & change text color
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        let energyLevel = pickerData[row]
        energyData = energyLevel
        return NSAttributedString(string: energyLevel, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    // Change BPM value
    @IBAction func bpmValueChanged(_ sender: UIStepper) {
        bpmValue.text = "\(Int(sender.value))"
        bpmData = Int(sender.value)
    }
    
    @IBAction func onTapGoButton(_ sender: Any) {
        print(energyData) // delete later
        print(bpmData) // delete later
        // To be implemented after figuring out API stuff
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
