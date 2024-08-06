//
//  RemoteFeedLoader.swift
//  Diagram-Compositon
//
//  Created by Thiago Monteiro on 04/08/24.
//

class RemoteFeedLoader: FeedLoader {
    func load(completion: @escaping ([String]) -> Void) {
        completion([.init()])
    }
}
