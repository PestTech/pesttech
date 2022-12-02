//
//  PesticideViewController.swift
//  PestTech
//
//  Created by Isidro  Perez on 11/16/22.
//

import UIKit
import Parse

class PesticideViewController: UIViewController {
    
    var addingToList = [PFObject]()
    
    
    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var dateMonth: UITextField!
    @IBOutlet weak var dateDay: UITextField!
    @IBOutlet weak var dateYear: UITextField!
    
    @IBOutlet weak var appType: UITextField!
    
    @IBOutlet weak var commondityTreat: UITextField!
    
    @IBOutlet weak var treatedArea: UITextField!
    
    @IBOutlet weak var pesticideName: UITextField!
    
    @IBOutlet weak var epaNumber: UITextField!
    
    @IBOutlet weak var measuringUnit: UITextField!
    @IBOutlet weak var rateUnit: UITextField!
    
    @IBOutlet weak var dilution: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        var user = PFObject(className: "Pesticide")
        
        user["location"] = locationText.text!
        //user["author"] = PFUser.current()!
        user["author"] = "Test"
        var saveString = dateMonth.text! + " " + dateDay.text! + " " + dateYear.text!
        user["date"] = saveString
        user["application"] = appType.text!
        user["commondity"] = commondityTreat.text!
        user["treated"] = treatedArea.text!
        user["pesticide"] = pesticideName.text!
        user["epanumber"] = epaNumber.text!
        user["measureunit"] = measuringUnit.text!
        user["rateunit"] = rateUnit.text!
        user["dilution"] = dilution.text!

        //user.username = usernameField.text
        
        
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
