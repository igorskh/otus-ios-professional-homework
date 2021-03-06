//
// ErrorModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ErrorModel: Codable, Hashable {

    public var status: String?
    public var message: String
    public var code: Int

    public init(status: String? = nil, message: String, code: Int) {
        self.status = status
        self.message = message
        self.code = code
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case message
        case code
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encode(message, forKey: .message)
        try container.encode(code, forKey: .code)
    }
}

