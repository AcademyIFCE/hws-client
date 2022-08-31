@testable import HWSClient
import Foundation

class MockSession: HTTPSessionProtocol {
    
    enum MockError: Error {
        case notImplemented(url: URL)
    }
    
    func data(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let url = request.url!
        switch url.lastPathComponent {
            case "inbox.json":
                let inboxFileURL = Bundle.module.url(forResource: "inbox", withExtension: "json")!
                let data = try! Data(contentsOf: inboxFileURL)
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/2.0", headerFields: nil)!
                return (data, response)
            default:
                throw MockError.notImplemented(url: url)
        }
    }
    
}

extension HTTPSessionProtocol where Self == MockSession {
    static var mock: MockSession { .init() }
}
