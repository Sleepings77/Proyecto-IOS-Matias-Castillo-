
import UIKit
import Kingfisher

class CardsTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel      : UILabel!
    @IBOutlet var cardClassLabel : UILabel!
    @IBOutlet var imgLabel       : UIImageView!
    @IBOutlet var typeLabel      : UILabel!
        
    static let identifier = "CardsTableViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: "CardsTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgLabel.kf.cancelDownloadTask()
    }
    
    func configure (card: Cards){
        
        if let id                   = card.id { imgLabel.load(url: id) }
        self.nameLabel.text         = card.name
        self.cardClassLabel.text    = card.cardClass
        self.typeLabel.text         = card.type
        imgLabel.layer.cornerRadius = imgLabel.frame.height / 2
    
    }
}
