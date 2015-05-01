import Foundation

class ShrinkingViewController : UIViewController {
    @IBOutlet weak var graphHostingView: CPTGraphHostingView!
    @IBOutlet weak var shrinkableView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var growMeButton: UIButton!
    @IBOutlet weak var shrinkMeButton: UIButton!
    
    @IBOutlet weak var shrinkableViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        let graph = CPTXYGraph(frame: graphHostingView.frame)!
        
        graph.plotAreaFrame.paddingBottom = 10
        graph.plotAreaFrame.paddingTop = 10
        graph.plotAreaFrame.paddingLeft = 10
        graph.plotAreaFrame.paddingRight = 10
        graph.plotAreaFrame.borderLineStyle = nil
        graph.masksToBorder = false

        graphHostingView.hostedGraph = graph
        graphHostingView.layer.masksToBounds = true
        graphHostingView.layer.cornerRadius = 0.0
        graphHostingView.layer.borderWidth = 3.0
        graphHostingView.layer.borderColor = UIColor.blueColor().CGColor
    }
    
    @IBAction func doShrink(sender: AnyObject) {
        self.view.layoutIfNeeded()
        shrinkableViewHeightConstraint.constant = 100.0
        
        UIView.animateWithDuration(
            1.0,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
        })
        
        growMeButton.enabled = true
        shrinkMeButton.enabled = false
    }
    
    @IBAction func doGrow(sender: AnyObject) {
        self.view.layoutIfNeeded()
        self.shrinkableViewHeightConstraint.constant = 300.0
        
        UIView.animateWithDuration(
            1.0,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
        })

        growMeButton.enabled = false
        shrinkMeButton.enabled = true
    }
}