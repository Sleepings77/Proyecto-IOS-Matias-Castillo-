
import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet var userProfile : UILabel!
    @IBOutlet var userPassword : UILabel!

    private let user = userNameVerification
    private let password = passWordVerification
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.text = user
        userPassword.text = password
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   
    @IBAction func logOut(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }
    
}
