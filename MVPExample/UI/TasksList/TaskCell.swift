import Foundation
import UIKit

final class TaskCell: UICollectionViewCell {
    let titleView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        addStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        self.contentView.addSubview(titleView)
        titleView.frame.origin.x = 16
        titleView.frame.origin.y = 10
        titleView.frame.size = CGSize(width: self.contentView.frame.width, height: 20)
    }
    
    private func addStyling() {
        self.backgroundColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func configure(withTask task: Task) {
        titleView.text = task.title
    }
}
