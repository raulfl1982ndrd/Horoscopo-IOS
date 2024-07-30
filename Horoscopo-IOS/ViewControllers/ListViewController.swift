//
//  ViewController.swift
//  Horoscopo-IOS
//
//  Created by Mañanas on 29/7/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList: [Horoscope] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        horoscopeList = HoroscopeProvider.getAllHoroscopes()
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        
        let horoscope = horoscopeList[indexPath.row]
        cell.nameLabel.text = horoscope.name
        cell.logoImageView.image = horoscope.logo
        cell.datesLabel.text = horoscope.dates
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToDetail"{
            let viewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            viewController.horoscope = horoscopeList[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

