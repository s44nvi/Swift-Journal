import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var entries: [[String: String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Mood History"
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        entries = UserDefaults.standard.array(forKey: "entries") as? [[String: String]] ?? []
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        let entry = entries[indexPath.row]
        cell.textLabel?.text = entry["mood"] ?? ""
        cell.detailTextLabel?.text = entry["note"] ?? ""
        return cell
    }

    @IBAction func backTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
