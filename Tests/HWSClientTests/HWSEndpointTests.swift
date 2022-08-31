import XCTest
@testable import HWSClient

final class HWSEndpointTests: XCTestCase {

    func testURL() {
        
        let baseURL = URL(string: "https://hws.dev")!
        
        for endpoint in HWSEndpoint.allCases {
            switch endpoint {
                case .inbox:
                    let url = endpoint.url(for: baseURL)
                    XCTAssertEqual(url.absoluteString, "https://hws.dev/inbox.json")
            }
        }
        
    }

}
