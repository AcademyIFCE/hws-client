import Foundation

public final class HWSClient {
    
    public static var shared = HWSClient()
    
    public let baseURL = URL(string: "https://hws.dev")!
    
    let session: HTTPSessionProtocol
    
    init(session: HTTPSessionProtocol = .default) {
        self.session = session
    }
    
    public func getAllMessages() async throws -> [Message] {
        let endpoint = HWSEndpoint.inbox
        let url = endpoint.url(for: baseURL)
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let messages = try JSONDecoder().decode([Message].self, from: data)
        return messages
    }
    
}

extension HWSClient {
    
    @_disfavoredOverload
    public convenience init(session: URLSession = .shared) {
        self.init(session: session)
    }
    
}
