import Foundation
import UIKit

@objc class TasksListCollectionViewAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    typealias TaskSelected = (Task) -> ()
    let taskSelected: TaskSelected
    let cellsReuseIdentifier: String
    var items: [Task] = [Task]()
    
    init(taskSelected: @escaping TaskSelected, reuseIdentifier: String) {
        self.taskSelected = taskSelected
        cellsReuseIdentifier = reuseIdentifier
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellsReuseIdentifier, for: indexPath) as! TaskCell
        cell.configure(withTask: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        taskSelected(items[indexPath.row])
    }
}
