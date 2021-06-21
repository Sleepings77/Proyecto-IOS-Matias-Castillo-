
import UIKit

var userNameVerification : String = ""
var passWordVerification : String = ""

class LogInViewController: UIViewController {

    @IBOutlet var userName : UITextField!
    @IBOutlet var password : UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func loginIn() {

        if let userName = userName.text, let password = password.text {
        
        userNameVerification = userName
        passWordVerification = password
        }
        
        if (userName.text == "") || (password.text == ""){
            errorMessage()
        }
        else{
            let cardView = CardsViewController()
            self.navigationController?.pushViewController(cardView, animated: true)
        }
        password.text = ""
        userName.text = ""
    }
    
    func errorMessage(){
        let message = UIAlertController(title: "ERROR", message: "Email or Password missing", preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { action in }))
        present(message, animated: true)
    }
}
