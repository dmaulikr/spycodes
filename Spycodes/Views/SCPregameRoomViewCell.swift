import UIKit

protocol SCPregameRoomViewCellDelegate: class {
    func teamUpdatedForPlayerWithUUID(_ uuid: String, newTeam: Team)
}

class SCPregameRoomViewCell: SCTableViewCell {
    weak var delegate: SCPregameRoomViewCellDelegate?

    var uuid: String?

    @IBOutlet weak var changeTeamButton: SCImageButton!
    @IBOutlet weak var leaderImage: UIImageView!
    @IBOutlet weak var teamIndicatorView: UIView!
    @IBOutlet weak var readyStatusLabel: SCLabel!

    @IBOutlet weak var leaderImageLeadingSpaceConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.readyStatusLabel.text = "  READY  "
        self.readyStatusLabel.font = SCFonts.smallSizeFont(.bold)
        self.readyStatusLabel.layer.borderColor = UIColor.spycodesGrayColor().cgColor
        self.readyStatusLabel.layer.borderWidth = 1.5
        self.readyStatusLabel.layer.cornerRadius = 10.0

        let angle = CGFloat(45 * Double.pi / 180)
        let transform = CGAffineTransform.identity.rotated(by: angle)
        self.leaderImage.transform = transform
    }

    @IBAction func onChangeTeamButtonTapped(_ sender: Any) {
        if let uuid = self.uuid,
           let oldTeam = Room.instance.getPlayerWithUUID(uuid)?.getTeam(),
           let newTeam = Team(rawValue: oldTeam.rawValue ^ 1) {
            delegate?.teamUpdatedForPlayerWithUUID(uuid, newTeam: newTeam)
        }
    }

    func showReadyStatus() {
        self.readyStatusLabel.isHidden = false
        self.changeTeamButton.isHidden = true
    }

    func hideReadyStatus() {
        self.readyStatusLabel.isHidden = true
        self.changeTeamButton.isHidden = false
    }

    func showChangeTeamButtonIfAllowed() {
        if !self.readyStatusLabel.isHidden {
            return
        }

        self.changeTeamButton.isHidden = false
    }

    func hideChangeTeamButton() {
        self.changeTeamButton.isHidden = true
    }
}
