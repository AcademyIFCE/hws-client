import XCTest
@testable import HWSClient

final class MessageTests: XCTestCase {
    
    func testDecodable() throws {
        
        let json = """
        {
            "id": 1,
            "user": "Janae Barlow",
            "text": "I'm going to be late; I missed my train. Go ahead without me."
        }
        """
        
        let data = json.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let message = try decoder.decode(Message.self, from: data)
        XCTAssertEqual(message.id, 1)
        XCTAssertEqual(message.user, "Janae Barlow")
        XCTAssertEqual(message.text, "I'm going to be late; I missed my train. Go ahead without me.")
        
    }

    func testDecodableCatchingError() {
        
        let json = """
        {
            "id": 1,
            "user": "Janae Barlow",
            "text": "I'm going to be late; I missed my train. Go ahead without me."
        }
        """
        
        let data = json.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let message = try decoder.decode(Message.self, from: data)
            XCTAssertEqual(message.id, 1)
            XCTAssertEqual(message.user, "Janae Barlow")
            XCTAssertEqual(message.text, "I'm going to be late; I missed my train. Go ahead without me.")
        } catch {
            print(error.localizedDescription)
            let decodingError = error as! DecodingError
            switch decodingError {
                case .typeMismatch(_, let context):
                    XCTFail("\(context.debugDescription) - \(context.codingPath)")
                case .valueNotFound(_, let context):
                    XCTFail("\(context.debugDescription) - \(context.codingPath)")
                case .keyNotFound(_, let context):
                    XCTFail("\(context.debugDescription)")
                case .dataCorrupted(let context):
                    XCTFail("\(context.debugDescription) - \(context.underlyingError!)")
                @unknown default:
                    fatalError()
            }
        }
        
    }

}
