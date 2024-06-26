//
//  Created by Steven Boynes on 2/12/22.
//  Copyright © 2022 Finsig LLC. All rights reserved.
//

import Foundation

/**
 An enumeration of JSON value types.
 
 This corresponds to *value* as expressed in McKeeman Form; with the addition of the term "Primitive".
 The term "Primitive" references the primitive JSON values types of String, Number, Boolean, and Null

 [McKeeman Form](https://www.crockford.com/mckeeman.html)
 [JSON Schema Reference](https://json-schema.org/understanding-json-schema/reference/)
 
*/
public enum JSON {
    case object(Object)
    case array(Array<JSON>)
    case primitive(Primitive)
}

extension JSON {
    public var rawValue: Any {
        switch self {
        case .object(let value):
            return value
        case .array(let value):
            return value
        case .primitive(let primitive):
            return primitive.rawValue
        }
    }
}

extension JSON: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Dictionary<String,JSON>.self) {
            self = .object(value)
        }
        else if let value = try? container.decode(Array<JSON>.self) {
            self = .array(value)
        }
        else if let value = try? container.decode(Primitive.self) {
            self = .primitive(value)
        }
        else if (container.decodeNil() == true) {
            self = .primitive( Primitive( NSNull() ) )
        }
        else {
            let context = DecodingError.Context(codingPath: container.codingPath, debugDescription: "Failed to decode JSON.")
            throw DecodingError.typeMismatch(JSON.self, context)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value):
            try container.encode(value)
        case .array(let value):
            try container.encode(value)
        case .primitive(let value):
            try container.encode(value)
        }
    }
}

extension JSON: CustomStringConvertible {
    public var description: String {
        switch self {
        case .object(let value):
            return value.description
        case .array(let value):
            return value.description
        case .primitive(let value):
            return value.description
        }
    }
}

