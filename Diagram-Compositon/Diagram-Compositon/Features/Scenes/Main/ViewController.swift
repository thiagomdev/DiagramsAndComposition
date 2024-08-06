import UIKit

protocol FeedLoader {
    func load(completion: @escaping([String]) -> Void)
}

final class ViewController: UIViewController {
    private let loader: FeedLoader
    
    init(loader: FeedLoader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.load { loadItems in
            // update
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
