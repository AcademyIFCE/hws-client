import Foundation

protocol HTTPSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

extension URLSession: HTTPSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        return try await data(for: request, delegate: nil) as! (Data, HTTPURLResponse)
    }
}

extension HTTPSessionProtocol where Self == URLSession {
    static var `default`: URLSession { .shared }
}
