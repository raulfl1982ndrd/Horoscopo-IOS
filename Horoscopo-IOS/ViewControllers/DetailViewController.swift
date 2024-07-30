//
//  DetailViewController.swift
//  Horoscopo-IOS
//
//  Created by Mañanas on 30/7/24.
//

import UIKit

class DetailViewController: UIViewController {
   @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    var horoscope:Horoscope? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let horoscope = horoscope{
            nameLabel.text = horoscope.name
            logoImageView.image = horoscope.logo
            datesLabel.text = horoscope.dates
        }
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
