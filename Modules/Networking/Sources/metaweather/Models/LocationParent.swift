//
// LocationParent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LocationParent: Codable, Hashable {

    public var title: String?
    public var locationType: LocationType?
    public var woeid: Int?
    public var lattLong: String?

    public init(title: String? = nil, locationType: LocationType? = nil, woeid: Int? = nil, lattLong: String? = nil) {
        self.title = title
        self.locationType = locationType
        self.woeid = woeid
        self.lattLong = lattLong
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(locationType, forKey: .locationType)
        try container.encodeIfPresent(woeid, forKey: .woeid)
        try container.encodeIfPresent(lattLong, forKey: .lattLong)
    }
}
