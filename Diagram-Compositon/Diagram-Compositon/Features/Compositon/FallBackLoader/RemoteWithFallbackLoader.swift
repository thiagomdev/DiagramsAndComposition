//
//  RemoteWithFallbackLoader.swift
//  Diagram-Compositon
//
//  Created by Thiago Monteiro on 04/08/24.
//

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
        let load = Reachability.networkingAvailable ?
        remoteLoader.load : localLoader.load
        load(completion)
    }
}
