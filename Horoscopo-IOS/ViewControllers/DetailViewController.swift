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

    @IBOutlet weak var favoriteButtonItem: UIBarButtonItem!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var descriptionTextView: UITextView!

    var horoscope: Horoscope? = nil
    var isFavorite: Bool = false

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Este if permite eliminar el opcional y asignarlo en una nueva variable
        if let horoscope = horoscope {
            nameLabel.text = horoscope.name
            logoImageView.image = horoscope.logo
            datesLabel.text = horoscope.dates

            isFavorite = defaults.string(forKey: "FAVORITE_HOROSCOPE") == horoscope.id
            setFavoriteIcon()
            
            getHoroscopeLuck()
        }
    }

    @IBAction func setFavorite(_ sender: Any) {
        if isFavorite {
            defaults.removeObject(forKey: "FAVORITE_HOROSCOPE")
        } else {
            defaults.setValue(horoscope?.id, forKey: "FAVORITE_HOROSCOPE")
        }
        isFavorite = !isFavorite
        setFavoriteIcon()
    }

    func setFavoriteIcon() {
        if isFavorite {
            favoriteButtonItem.image = UIImage(systemName: "heart.fill")
        } else {
            favoriteButtonItem.image = UIImage(systemName: "heart")
        }
    }

    func getHoroscopeLuck() {
        loading.isHidden = false
        Task {
            do {
                let luck = try await HoroscopeProvider.getHoroscopeLuck(horoscopeId: horoscope!.id)
                
                descriptionTextView.text = luck
                loading.isHidden = true
            } catch {
                print(error)
            }
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
