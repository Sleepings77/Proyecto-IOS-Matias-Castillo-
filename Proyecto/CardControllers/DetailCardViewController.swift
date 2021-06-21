
import UIKit
import Kingfisher

class DetailCardViewController: UIViewController {

    @IBOutlet var imgLabel          : UIImageView!
    @IBOutlet var costLabel         : UILabel!
    @IBOutlet var attackLabel       : UILabel!
    @IBOutlet var healthLabel       : UILabel!
    @IBOutlet var textLabel         : UILabel!
    
    let baseUrl          = "https://art.hearthstonejson.com/v1/512x/"
    var card: Cards?
        
    init(card: Cards) {
        self.card = card
        super.init(nibName: "DetailCardViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDetails()
    }
    
    private func setupDetails() {
        
        if let id       = self.card?.id { imgLabel.load(url: id)}
        if let cost     = self.card?.cost { costLabel.text     = "\(cost)" } else {costLabel.text     = "-"}
        if let attack   = self.card?.attack { attackLabel.text = "\(attack)" } else {attackLabel.text = "-"}
        if let health   = self.card?.health { healthLabel.text = "\(health)" } else {healthLabel.text = "-"}
        if let text     = self.card?.text {textLabel.text = "\(text)"}
        }
    
    @IBAction func addFavoritesButtonPressed(){
            
        if cardFavorites.shared.checkFavorite(card!){
            errorMessage()
        }
        else {
            cardFavorites.shared.addFavorites(card!)
            sucessMessage()
        }
   }
    
    func errorMessage(){
        let message = UIAlertController(title: "ERROR", message: "This card exist in Favorites", preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { action in }))
        present(message, animated: true)
    }
    
    func sucessMessage(){
        let message = UIAlertController(title: "SUCCESS", message: "Card added to Favorites", preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { action in }))
        present(message, animated: true)
        
    }
}

final  class cardFavorites {
    
    static let shared = cardFavorites()
    private var favorites : [Cards] = []
    
    func addFavorites(_ card: Cards) {
        self.favorites.append(card)
    }
    
    func get() -> [Cards] {
        return favorites
    }
    
    func checkFavorite (_ card: Cards) -> Bool{
        var favoriteExist = false
        
        for favoriteCards in favorites {
            if card.id == favoriteCards.id {
                favoriteExist = true
                break
            } else {
                favoriteExist = false
            }
        }
        return favoriteExist
    }
}
