//
//  Created by Steven Boynes on 2/12/22.
//  Copyright © 2022 Finsig LLC. All rights reserved.
//

import XCTest
@testable import JSON

class JSONTests: XCTestCase {
    
    func testDecodeObject() throws {
        let decoded = try! JSONDecoder().decode(JSON.self, from: .objectValue)
        
        XCTAssertTrue( decoded.rawValue is Dictionary<String,JSON> )
    }
    
    func testDecodeArray() throws {
        let decoded = try! JSONDecoder().decode(JSON.self, from: .arrayValue)
        
        XCTAssertTrue( decoded.rawValue is Array<JSON> )
    }
    
    func testDecodeString() throws {
        let decoded = try! JSONDecoder().decode(JSON.self, from: .string)
        
        XCTAssertTrue( decoded.rawValue is String )
    }
}

fileprivate extension Data {
    /*
     [McKeeman Form](https://www.crockford.com/mckeeman.html)
     [JSON Schema Reference](https://json-schema.org/understanding-json-schema/reference/)
    */

    static var objectValue = """
        {}
    """.data(using: .utf8)!
    
    static var arrayValue = """
        []
    """.data(using: .utf8)!
    
    static var string = """
        ""
    """.data(using: .utf8)!
}
