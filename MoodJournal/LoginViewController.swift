import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlert("Please enter a username")
            return
        }
        UserDefaults.standard.set(username, forKey: "username")
        performSegue(withIdentifier: "showHome", sender: nil)
    }

    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
