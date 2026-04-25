import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var anxiousButton: UIButton!
    @IBOutlet weak var calmButton: UIButton!
    @IBOutlet weak var angryButton: UIButton!
    @IBOutlet weak var excitedButton: UIButton!
    
    @IBAction func backTapped1(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    var selectedMood: String = ""

    let moods = ["😊 Happy", "😔 Sad", "😰 Anxious", "😌 Calm", "😡 Angry", "🤩 Excited"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let username = UserDefaults.standard.string(forKey: "username") ?? "Friend"
        greetingLabel.text = "Hi, \(username)! How are you?"
        notesTextView.layer.borderWidth = 1
        notesTextView.layer.borderColor = UIColor.lightGray.cgColor
        notesTextView.layer.cornerRadius = 8
    }

    @IBAction func moodTapped(_ sender: UIButton) {
        // Reset all buttons
        let buttons = [happyButton, sadButton, anxiousButton, calmButton, angryButton, excitedButton]
        for btn in buttons {
            btn?.alpha = 0.5
        }
        sender.alpha = 1.0
        selectedMood = moods[sender.tag]
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        guard !selectedMood.isEmpty else {
            showAlert("Please select a mood!")
            return
        }
        let note = notesTextView.text ?? ""
        var entries = UserDefaults.standard.array(forKey: "entries") as? [[String: String]] ?? []
        let entry: [String: String] = [
            "mood": selectedMood,
            "note": note,
            "date": Date().description
        ]
        entries.append(entry)
        UserDefaults.standard.set(entries, forKey: "entries")
        showAlert("Mood saved! 🎉")
        notesTextView.text = ""
        selectedMood = ""
        let buttons = [happyButton, sadButton, anxiousButton, calmButton, angryButton, excitedButton]
        for btn in buttons { btn?.alpha = 0.5 }
    }

    @IBAction func historyTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showHistory", sender: nil)
    }

    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
