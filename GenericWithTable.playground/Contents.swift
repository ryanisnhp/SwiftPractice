//: Playground - noun: a place where people can play
import UIKit
import Foundation

protocol Reusable {
    static var reuseIdentifier: String {get}
    static var nib: UINib? {get}
}

extension Reusable {
    
    static var reuseIdentifier: String { return String(self) }
    static var nib: UINib? { return nil }
}

class EPTableViewCell: UITableViewCell, Reusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class EPCollectionViewCell: UITableViewCell, Reusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension UITableView {
    
    func registerReusableCell<T: UITableViewCell where T: Reusable>(_: T.Type) {
        if let nib = T.nib {
            self.registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeue<T: UITableViewCell where T: Reusable>(_: T.Type) -> T? {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier) as? T
    }
    
    func dequeue<T: UITableViewCell where T: Reusable>(_: T.Type, indexPath: NSIndexPath) -> T? {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T
    }
    
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: Reusable>() -> T? {
        return self.dequeueReusableHeaderFooterViewWithIdentifier(T.reuseIdentifier) as? T
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: Reusable>() -> T? {
        return self.dequeueReusableHeaderFooterViewWithIdentifier(T.reuseIdentifier) as? T
    }
    
}

extension UICollectionView {
    
    func registerReusableCell<T: UICollectionViewCell where T: Reusable>(_: T.Type) {
        if let nib = T.nib {
            self.registerNib(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeue<T: UICollectionViewCell where T: Reusable>(_: T.Type, indexPath: NSIndexPath) -> T? {
        return self.dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T
    }
    
    func registerReusableSupplementaryView<T: UICollectionViewCell where T: Reusable>(elementKind: String, _: T.Type) {
        if let nib = T.nib {
            self.registerNib(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            self.registerClass(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionViewCell where T: Reusable>(elementKind: String, indexPath: NSIndexPath) -> T? {
        return self.dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: T.reuseIdentifier, forIndexPath: indexPath) as? T
    }
}

extension NSBundle {
    
    class func loadBundle<T: UIView where T: Reusable>(_: T.Type) -> T? {
        return self.mainBundle().loadNibNamed(T.reuseIdentifier, owner: self, options: nil).first as? T
    }
}

class ViewCell: EPTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class ViewController: UIViewController {
    
    var atableView: UITableView?
    var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: UITableViewStyle.Plain)
        if let tableView = atableView {
            tableView.backgroundColor = UIColor.whiteColor()
            tableView.dataSource = self
            self.view.addSubview(tableView)
            tableView.registerReusableCell(ViewCell)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = NSBundle.loadBundle(ViewCell) {
            return cell
        }
        
        if let cell = tableView.dequeue(ViewCell) {
            return cell
        }
        return UITableViewCell()
    }
    
}
