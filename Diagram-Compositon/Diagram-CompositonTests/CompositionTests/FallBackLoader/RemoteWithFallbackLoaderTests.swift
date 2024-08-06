//
//  FallBackLoaderTests.swift
//  Diagram-CompositonTests
//
//  Created by Thiago Monteiro on 04/08/24.
//

import XCTest
@testable import Diagram_Compositon

final class RemoteWithFallbackLoaderTests: XCTestCase {
    func test_local_load() {
        let (sut, remote, local) = makeSut()
        let exp = expectation(description: "completion block!")
        var expected: [String]?
        
        local.expected = .init()
        remote.expected = .init()
        
        sut.load { loadItems in
            expected = loadItems
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertTrue(local.expectedNetworkAvailable)
        XCTAssertNotNil(expected)
    }
}

final class RemoteLoaderStub: RemoteFeedLoader {
    var expected: ([String])?
    var expectedNetworkAvailable = Reachability.networkingAvailable
    
    override func load(completion: @escaping ([String]) -> Void) {
        expectedNetworkAvailable = true
        if let expected {
            completion(expected)
        }
    }
}

final class LocalFeedLoaderStub: LocalFeedLoader {
    var expected: ([String])?
    var expectedNetworkAvailable = Reachability.networkingAvailable
    override func load(completion: @escaping ([String]) -> Void) {
        expectedNetworkAvailable = true
        if let expected {
            completion(expected)
        }
    }
}

extension RemoteWithFallbackLoaderTests {
    private func makeSut() -> (
        sut: RemoteWithFallbackLoader,
        remoteMock: RemoteLoaderStub,
        localMock: LocalFeedLoaderStub) {
            
        let remote = RemoteLoaderStub()
        let local = LocalFeedLoaderStub()
        let sut = RemoteWithFallbackLoader(remoteLoader: remote, localLoader: local)
        return (sut, remote, local)
    }
}
