import UIKit

class PregameSettingsViewController: UIViewController {
    @IBOutlet var minigameSettingToggle: UISwitch!
    
    @IBAction func onExitTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if GameMode.instance.mode == GameMode.Mode.MiniGame {
            self.minigameSettingToggle.setOn(true, animated: false)
        } else {
            self.minigameSettingToggle.setOn(false, animated: false)
        }
        
        if Player.instance.isHost() {
            self.minigameSettingToggle.enabled = true
            self.minigameSettingToggle.alpha = 1.0
        } else {
            self.minigameSettingToggle.enabled = false
            self.minigameSettingToggle.alpha = 0.5
        }
    }
    
    @IBAction func minigameSettingToggleChanged(sender: AnyObject) {
        if self.minigameSettingToggle.on {
            GameMode.instance.mode = GameMode.Mode.MiniGame
        } else {
            GameMode.instance.mode = GameMode.Mode.RegularGame
        }
        
        Room.instance.resetPlayers()
        Statistics.instance.reset()
        
        var data = NSKeyedArchiver.archivedDataWithRootObject(GameMode.instance)
        MultipeerManager.instance.broadcastData(data)
        
        data = NSKeyedArchiver.archivedDataWithRootObject(Room.instance)
        MultipeerManager.instance.broadcastData(data)
        
        data = NSKeyedArchiver.archivedDataWithRootObject(Statistics.instance)
        MultipeerManager.instance.broadcastData(data)
    }
}
