import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var shadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
