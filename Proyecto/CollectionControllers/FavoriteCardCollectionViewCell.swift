
import UIKit

class FavoriteCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imgLabel       : UIImageView!
    
    static let identifier = "FavoriteCardCollectionViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: "FavoriteCardCollectionViewCell", bundle: nil)
    }
    
    func configureCollection(favorite: Cards){
        
        if let id    = favorite.id{ imgLabel.load(url: id)}
    }
}
