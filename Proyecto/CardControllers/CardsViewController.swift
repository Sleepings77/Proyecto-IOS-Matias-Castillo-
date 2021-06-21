
import UIKit
import Foundation

class CardsViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet var cardsView      : UITableView!
    @IBOutlet var segmentControl : UISegmentedControl!
    @IBOutlet var searchBar      : UISearchBar!
    
    var cards : [Cards] = []
    var cardsFilter: [Cards] = []

    var filteredData : [Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredData = cardsFilter
        searchBar.delegate = self
        
        setupTableView()
        
        cardsView.refreshControl = UIRefreshControl()
        cardsView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh),
                                            for: .valueChanged)

        NetworkingManager.getCards {(result: Result<[Cards], Error > )in
            switch result {
            case .success (let cards):
                self.cards = cards
                self.filteredData = cards
                self.cardsFilter = cards
                self.cardsView.reloadData()
            case .failure:
                break
            }
        }
  }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String) {
        filteredData = []
        if searchText == "" {
            filteredData = cardsFilter
        } else {
        for card in cardsFilter {
            if card.name!.lowercased().contains(searchText.lowercased()) {
                filteredData.append(card)
                    }
            }
        self.cardsView.reloadData()
        }
    }
    
    @IBAction func favoriteCards (){
        let cardsFavorite = CollectionViewController()
        navigationController?.pushViewController(cardsFavorite, animated: true)
    }
    
    @IBAction func userProfile() {
        let user = UserProfileViewController()
        navigationController?.pushViewController(user, animated: true)
    }
    
    @objc private func didPullToRefresh() {
        
        DispatchQueue.main.async {
            self.cardsFilter.removeAll()
            self.filteredData.removeAll()
            
            NetworkingManager.getCards{(result: Result<[Cards], Error>) in
                switch result {
                case .success(let cards):
                    self.cards = cards
                    self.cardsFilter = cards
                    self.searchBar.text = ""
                    self.filteredData = cards
                    self.cardsView.reloadData()
                    self.cardsView.refreshControl?.endRefreshing()
                case .failure:
                    break
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension CardsViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in cardsView : UITableView) -> Int{
        return 1
    }
    
    func tableView (_ cardsView: UITableView, numberOfRowsInSection section: Int ) -> Int{
        return filteredData.count
    }
    
    func tableView(_ cardsView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = cardsView.dequeueReusableCell(withIdentifier: CardsTableViewCell.identifier) as! CardsTableViewCell
        cell.configure (card: filteredData[indexPath.row] as! Cards)
        return cell
    }
    
    func tableView(_ cardsView: UITableView, heightForRowAt indexpath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ cardsView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailCard = DetailCardViewController(card: self.filteredData[indexPath.row] as! Cards)
        
        navigationController?.pushViewController(detailCard, animated: true)
    }
    
    private func setupTableView() {
        
        cardsView.delegate           = self
        cardsView.dataSource         = self
    
        cardsView.register(CardsTableViewCell.getNib(), forCellReuseIdentifier: CardsTableViewCell.identifier)
    }
}
