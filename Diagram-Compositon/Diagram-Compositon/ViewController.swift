import UIKit

protocol FeedLoader {
    func load(completion: @escaping([String]) -> Void)
}

struct Reachanility {
    static let networkintAvailable = false
}

final class ViewController: UIViewController {
    
    private let remoteLoader: RemoteFeedLoader
    private let localLoader: LocalFeedLoader
    
    init(remoteLoader: RemoteFeedLoader, localLoader: LocalFeedLoader) {
        self.remoteLoader = remoteLoader
        self.localLoader = localLoader
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachanility.networkintAvailable {
            remoteLoader.load { remote in
                
            }
        } else {
            localLoader.load { local in
                
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class RemoteFeedLoader: FeedLoader {
    func load(completion: @escaping ([String]) -> Void) {
        // do something
    }
}

final class LocalFeedLoader: FeedLoader {
    func load(completion: @escaping ([String]) -> Void) {
        // do something
    }
}
