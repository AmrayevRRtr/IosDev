import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clubImageView: UIImageView!
    @IBOutlet weak var clubLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    
    let clubImages: [UIImage] = [#imageLiteral(resourceName: "Arsenal"),#imageLiteral(resourceName: "AC Milan"),#imageLiteral(resourceName: "Inter Milan"),#imageLiteral(resourceName: "Chelsea"),#imageLiteral(resourceName: "Kairat"),#imageLiteral(resourceName: "Real Madrid"),#imageLiteral(resourceName: "Barcelona"),#imageLiteral(resourceName: "Manchester United"),#imageLiteral(resourceName: "Liverpool"),#imageLiteral(resourceName: "Bayern Munich")]
    
    let clubNames: [String] = [
        "Arsenal", "AC Milan", "Inter", "Chelsea", "Kairat",
        "Real Madrid", "Barcelona", "Manchester United", "Liverpool", "Bayern Munich"
    ]
    
    let clubColors: [UIColor] = [
        .red,                // Arsenal
        .black,              // Milan
        .blue,               // Inter
        .systemBlue,         // Chelsea
        .systemYellow,       // Kairat
        .systemGray,         // Real Madrid
        .systemRed,          // Barcelona
        .systemRed,          // Man Utd
        .systemRed,          // Liverpool
        .systemOrange        // Bayern
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizeButton.layer.cornerRadius = 12
        randomizeButton.backgroundColor = .systemTeal
        randomizeButton.setTitle("Randomize", for: .normal)
        randomizeButton.setTitleColor(.white, for: .normal)
        

        clubImageView.image = clubImages[0]
        clubLabel.text = clubNames[0]
        clubLabel.textColor = clubColors[0]
    }
    
    @IBAction func randomizePressed(_ sender: UIButton) {
        let randomIndex = Int.random(in: 0..<clubImages.count)
        clubImageView.image = clubImages[randomIndex]
        clubLabel.text = clubNames[randomIndex]
        clubLabel.textColor = clubColors[randomIndex]
    }
}
