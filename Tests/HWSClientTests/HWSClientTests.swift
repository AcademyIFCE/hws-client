import XCTest
@testable import HWSClient

final class HWSClientTests: XCTestCase {

    let client = HWSClient(session: .mock)
    
    func testBaseURL() {
        XCTAssertEqual(client.baseURL.absoluteString, "https://hws.dev")
    }
    
    func testGetAllMessages() async throws {
        let messages = try await client.getAllMessages()
        XCTAssertEqual(messages.count, 5)
    }
    
}
