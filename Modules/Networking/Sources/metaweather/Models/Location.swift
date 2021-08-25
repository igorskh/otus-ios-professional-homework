//
// Location.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Location: Codable, Hashable {

    public var distance: Double?
    public var title: String
    public var woeid: Int
    public var locationType: LocationType
    public var lattLong: String
    public var time: Date?
    public var sunRise: Date?
    public var sunSet: Date?
    public var timezoneName: String?
    public var parent: LocationParent?
    public var timezone: String?
    public var sources: [WeatherSource]?
    public var consolidatedWeather: [LocationWeather]?
    public var children: [LocationParent]?

    public init(distance: Double? = nil, title: String, woeid: Int, locationType: LocationType, lattLong: String, time: Date? = nil, sunRise: Date? = nil, sunSet: Date? = nil, timezoneName: String? = nil, parent: LocationParent? = nil, timezone: String? = nil, sources: [WeatherSource]? = nil, consolidatedWeather: [LocationWeather]? = nil, children: [LocationParent]? = nil) {
        self.distance = distance
        self.title = title
        self.woeid = woeid
        self.locationType = locationType
        self.lattLong = lattLong
        self.time = time
        self.sunRise = sunRise
        self.sunSet = sunSet
        self.timezoneName = timezoneName
        self.parent = parent
        self.timezone = timezone
        self.sources = sources
        self.consolidatedWeather = consolidatedWeather
        self.children = children
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case distance
        case title
        case woeid
        case locationType = "location_type"
        case lattLong = "latt_long"
        case time
        case sunRise = "sun_rise"
        case sunSet = "sun_set"
        case timezoneName = "timezone_name"
        case parent
        case timezone
        case sources
        case consolidatedWeather = "consolidated_weather"
        case children
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encode(title, forKey: .title)
        try container.encode(woeid, forKey: .woeid)
        try container.encode(locationType, forKey: .locationType)
        try container.encode(lattLong, forKey: .lattLong)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(sunRise, forKey: .sunRise)
        try container.encodeIfPresent(sunSet, forKey: .sunSet)
        try container.encodeIfPresent(timezoneName, forKey: .timezoneName)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(timezone, forKey: .timezone)
        try container.encodeIfPresent(sources, forKey: .sources)
        try container.encodeIfPresent(consolidatedWeather, forKey: .consolidatedWeather)
        try container.encodeIfPresent(children, forKey: .children)
    }
}
