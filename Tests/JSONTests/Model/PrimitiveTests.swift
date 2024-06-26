//
//  Created by Steven Boynes on 2/9/22.
//  Copyright © 2022 Finsig LLC. All rights reserved.
//

import XCTest
@testable import JSON

class PrimitiveTests: XCTestCase {
    
    func testDecodeString() throws {
        let decoded = try! JSONDecoder().decode(JSON.Primitive.self, from: .string)
        
        XCTAssertTrue( decoded.rawValue is String )
    }
    
    func testDecodeInteger() throws {
        let decoded = try! JSONDecoder().decode(JSON.Primitive.self, from: .integer)
        
        XCTAssertTrue( decoded.rawValue is Int )
    }
    
    func testDecodeFloat() throws {
        let decoded = try! JSONDecoder().decode(JSON.Primitive.self, from: .fraction)
        
        XCTAssertTrue( decoded.rawValue is Float )
    }

    func testDecodeExponent() throws {
        XCTAssertNoThrow( try JSONDecoder().decode(JSON.Primitive.self, from: .exponent) )
    }
    
    func testDecodeTrue() throws {
        let decoded = try! JSONDecoder().decode(JSON.Primitive.self, from: .trueValue)
        
        XCTAssertEqual( decoded.rawValue as? Bool, true )
    }
    
    func testDecodeFalse() throws {
        let decoded = try! JSONDecoder().decode(JSON.Primitive.self, from: .falseValue)
        
        XCTAssertEqual( decoded.rawValue as? Bool, false )
    }
    
    func testDecodeNull() throws {
        let decoded = try! JSONDecoder().decode(JSON.Primitive.self, from: .nullValue)
        
        XCTAssertTrue( decoded.rawValue is NSNull )
    }
}

fileprivate extension Data {
    /*
     [McKeeman Form](https://www.crockford.com/mckeeman.html)
     [JSON Schema Reference](https://json-schema.org/understanding-json-schema/reference/)
    */

    static var string = """
        ""
    """.data(using: .utf8)!
    
    static var integer = """
        1
    """.data(using: .utf8)!
    
    static var fraction = """
        0.1234
    """.data(using: .utf8)!
    
    static var exponent = """
        1.234E+2
    """.data(using: .utf8)!
    
    static var trueValue = """
        true
    """.data(using: .utf8)!
    
    static var falseValue = """
        false
    """.data(using: .utf8)!
    
    static var nullValue = """
        null
    """.data(using: .utf8)!
}
