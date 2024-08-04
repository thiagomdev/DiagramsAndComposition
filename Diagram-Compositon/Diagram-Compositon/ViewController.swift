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

struct Reachability {
    static let networkingAvailable = false
}

final class RemoteWithFallbackLoader: FeedLoader {
    private let remoteLoader: RemoteFeedLoader
    private let localLoader: LocalFeedLoader
    
    init(remoteLoader: RemoteFeedLoader, localLoader: LocalFeedLoader) {
        self.remoteLoader = remoteLoader
        self.localLoader = localLoader
    }
    
    func load(completion: @escaping([String]) -> Void) {
        if Reachability.networkingAvailable {
            remoteLoader.load { loadItems in
                
            }
        } else {
            localLoader.load { loadItems in
                
            }
        }
    }
}
