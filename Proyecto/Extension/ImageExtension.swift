
import  Foundation
import  UIKit
import  Kingfisher

extension UIImageView {
    
    func load(url: String){
        self.kf.setImage(
            with: .network(URL(string: "https://art.hearthstonejson.com/v1/512x/" + url + ".jpg")!),
            placeholder: nil,
            options: [.transition(.fade(0.4))],
            completionHandler: nil
        )
    }
}
