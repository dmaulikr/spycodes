import UIKit

class SCTimelineModalViewController: SCModalViewController {
    fileprivate var refreshTimer: Foundation.Timer?
    fileprivate var emptyStateLabel: UILabel?
    fileprivate var scrolled = false

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewBottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewLeadingSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTrailingSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var upArrowView: UIImageView!

    deinit {
        print("[DEINIT] " + NSStringFromClass(type(of: self)))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 87.0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableViewBottomSpaceConstraint.constant = SCViewController.tableViewMargin
        self.tableViewLeadingSpaceConstraint.constant = SCViewController.tableViewMargin
        self.tableViewTrailingSpaceConstraint.constant = SCViewController.tableViewMargin
        self.tableView.layoutIfNeeded()

        self.refreshTimer = Foundation.Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(SCTimelineModalViewController.refreshView),
            userInfo: nil,
            repeats: true
        )

        self.emptyStateLabel = UILabel(frame: self.tableView.frame)
        self.emptyStateLabel?.text = SCStrings.timelineEmptyState
        self.emptyStateLabel?.font = SCFonts.intermediateSizeFont(.regular)
        self.emptyStateLabel?.textColor = UIColor.spycodesGrayColor()
        self.emptyStateLabel?.textAlignment = .center
        self.emptyStateLabel?.numberOfLines = 0
        self.emptyStateLabel?.center = self.view.center

        if self.tableView.contentSize.height < self.tableView.bounds.height {
            self.upArrowView.isHidden = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.tableView.dataSource = nil
        self.tableView.delegate = nil

        self.refreshTimer?.invalidate()
    }

    override func onDismissal() {
        if self.tableView.contentOffset.y > 0 {
            return
        }

        super.onDismissal()
    }

    @objc
    fileprivate func refreshView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()

            if Timeline.instance.getEvents().count == 0 {
                self.tableView.backgroundView = self.emptyStateLabel
            } else {
                self.tableView.backgroundView = nil
            }
        }
    }
}

//   _____      _                 _
//  | ____|_  _| |_ ___ _ __  ___(_) ___  _ __  ___
//  |  _| \ \/ / __/ _ \ '_ \/ __| |/ _ \| '_ \/ __|
//  | |___ >  <| ||  __/ | | \__ \ | (_) | | | \__ \
//  |_____/_/\_\\__\___|_| |_|___/_|\___/|_| |_|___/

// MARK: UITableViewDelegate, UITableViewDataSource
extension SCTimelineModalViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if Timeline.instance.getEvents().count == 0 {
            return nil
        }

        guard let sectionHeader = self.tableView.dequeueReusableCell(
            withIdentifier: SCConstants.identifier.sectionHeaderCell.rawValue
            ) as? SCSectionHeaderViewCell else {
                return nil
        }

        sectionHeader.primaryLabel.text = SCStrings.timeline

        if self.tableView.contentOffset.y > 0 {
            sectionHeader.showBlurBackground()
        } else {
            sectionHeader.hideBlurBackground()
        }

        return sectionHeader
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Timeline.instance.getEvents().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(
            withIdentifier: SCConstants.identifier.timelineViewCell.rawValue
            ) as? SCTimelineViewCell else {
                return UITableViewCell()
        }

        let event = Timeline.instance.getEvents()[indexPath.row]

        if let parameters = event.getParameters() {
            if event.getType() == .confirm {
                if let name = parameters[SCConstants.coding.name.rawValue] as? String,
                   let clue = parameters[SCConstants.coding.clue.rawValue] as? String,
                   let numberOfWords = parameters[SCConstants.coding.numberOfWords.rawValue] as? String {
                    let attributedString = NSMutableAttributedString(
                        string: name + " set the clue '" + clue + " " + numberOfWords + "'"
                    )
                    attributedString.addAttribute(
                        NSFontAttributeName,
                        value: SCFonts.intermediateSizeFont(.bold) ?? 0,
                        range: NSMakeRange(
                            0,
                            name.characters.count
                        )
                    )
                    cell.primaryLabel.attributedText = attributedString
                }
            } else if event.getType() == .selectCard {
                if let name = parameters[SCConstants.coding.name.rawValue] as? String,
                   let word = parameters[SCConstants.coding.word.rawValue] as? String {
                    let attributedString = NSMutableAttributedString(
                        string: name + " selected '" + word + "'."
                    )
                    attributedString.addAttribute(
                        NSFontAttributeName,
                        value: SCFonts.intermediateSizeFont(.bold) ?? 0,
                        range: NSMakeRange(
                            0,
                            name.characters.count
                        )
                    )
                    cell.primaryLabel.attributedText = attributedString
                }
            } else if event.getType() == .endRound {
                if let name = parameters[SCConstants.coding.name.rawValue] as? String {
                    let attributedString = NSMutableAttributedString(
                        string: name + " ended the round."
                    )
                    attributedString.addAttribute(
                        NSFontAttributeName,
                        value: SCFonts.intermediateSizeFont(.bold) ?? 0,
                        range: NSMakeRange(
                            0,
                            name.characters.count
                        )
                    )
                    cell.primaryLabel.attributedText = attributedString
                } else {
                    cell.primaryLabel.text = "Round ended from timer expiry."
                }
            }

            return cell
        }

        return UITableViewCell()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView.contentOffset.y <= 0 {
            self.upArrowView.isHidden = false
        } else {
            self.upArrowView.isHidden = true
        }

        if self.tableView.contentOffset.y > 0 {
            if self.scrolled {
                return
            }
            self.scrolled = true
        } else {
            if !self.scrolled {
                return
            }
            self.scrolled = false
        }

        self.tableView.reloadData()
    }
}
