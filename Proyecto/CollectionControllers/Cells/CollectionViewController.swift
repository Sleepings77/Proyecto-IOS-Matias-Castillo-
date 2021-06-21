
import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet var collectionView : UICollectionView!
    var generateCollection = cardFavorites.shared.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5,left: 5,bottom: 0,right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 15,
                                 height: (UIScreen.main.bounds.height / 4))
        collectionView.collectionViewLayout = layout
        
    }
    
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return generateCollection.count
            }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:FavoriteCardCollectionViewCell.identifier, for: indexPath) as! FavoriteCardCollectionViewCell
        cell.configureCollection(favorite: generateCollection[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let detailCard = DetailCardViewController(card: self.generateCollection[indexPath.item])        
        navigationController?.pushViewController(detailCard, animated: true)
    }
    
    private func setupCollectionView() {
        
        collectionView.delegate           = self
        collectionView.dataSource         = self
    
        collectionView.register(FavoriteCardCollectionViewCell.getNib(), forCellWithReuseIdentifier: FavoriteCardCollectionViewCell.identifier)
    }
}
