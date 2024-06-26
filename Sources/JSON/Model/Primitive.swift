//
//  Created by Steven Boynes on 2/9/22.
//  Copyright © 2022 Finsig LLC. All rights reserved.
//

import Foundation

extension JSON {
    /**
     An enumeration of the primitive JSON McKeeman Form *element*

     [JSON-RPC 2.0](https://www.jsonrpc.org/specification)
     
    */
    public enum Primitive {
        case string(String)
        case int(Int)
        case float(Float)
        case double(Double)
        case bool(Bool)
        case nsNull(NSNull)
    }
}

extension JSON.Primitive {
    public var rawValue: Any {
        switch self {
        case .string(let value):
            return value
        case .int(let value):
            return value
        case .float(let value):
            return value
        case .double(let value):
            return value
        case .bool(let value):
            return value
        case .nsNull(_):
            return NSNull()
        }
    }
}

public extension JSON.Primitive {
    init(_ value: String) {
        self = .string(value)
    }
    
    init(_ value: Int) {
        self = .int(value)
    }
    
    init(_ value: Float) {
        self = .float(value)
    }
    
    init(_ value: Double) {
        self = .double(value)
    }
    
    init(_ value: Bool) {
        self = .bool(value)
    }

    init(_ value: NSNull) {
        self = .nsNull(value)
    }
}

extension JSON.Primitive: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(String.self) {
            self = .string(value)
        }
        else if let value = try? container.decode(Int.self) {
            self = .int(value)
        }
        else if let value = try? container.decode(Float.self) {
            self = .float(value)
        }
        else if let value = try? container.decode(Double.self) {
            self = .double(value)
        }
        else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        }
        else {
            self = .nsNull(NSNull())
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .float(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .nsNull(_):
            try container.encodeNil()
        }
    }
}

extension JSON.Primitive: CustomStringConvertible {
    public var description: String {
        switch self {
        case .string(let value):
            return value
        case .int(let value):
            return String(value)
        case .float(let value):
            return String(value)
        case .double(let value):
            return String(value)
        case .bool(let value):
            return String(value)
        case .nsNull(_):
            return String("NSNull")
        }
    }
}
