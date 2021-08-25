//
// LocationWeather.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LocationWeather: Codable, Hashable {

    public var id: String?
    public var weatherStateName: WeatherState?
    public var weatherStateAbbr: WeatherStateAbbreviation?
    public var windDirectionCompass: String?
    public var created: Date?
    public var applicableDate: Date?
    public var minTemp: Double?
    public var maxTemp: Double?
    public var theTemp: Double?
    public var winSpeed: Double?
    public var winDirection: Double?
    public var airPressure: Double?
    public var humidity: Double?
    public var visibility: Double?
    public var predictability: Double?

    public init(id: String? = nil, weatherStateName: WeatherState? = nil, weatherStateAbbr: WeatherStateAbbreviation? = nil, windDirectionCompass: String? = nil, created: Date? = nil, applicableDate: Date? = nil, minTemp: Double? = nil, maxTemp: Double? = nil, theTemp: Double? = nil, winSpeed: Double? = nil, winDirection: Double? = nil, airPressure: Double? = nil, humidity: Double? = nil, visibility: Double? = nil, predictability: Double? = nil) {
        self.id = id
        self.weatherStateName = weatherStateName
        self.weatherStateAbbr = weatherStateAbbr
        self.windDirectionCompass = windDirectionCompass
        self.created = created
        self.applicableDate = applicableDate
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.theTemp = theTemp
        self.winSpeed = winSpeed
        self.winDirection = winDirection
        self.airPressure = airPressure
        self.humidity = humidity
        self.visibility = visibility
        self.predictability = predictability
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case winSpeed = "win_speed"
        case winDirection = "win_Direction"
        case airPressure = "air_pressure"
        case humidity
        case visibility
        case predictability
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(weatherStateName, forKey: .weatherStateName)
        try container.encodeIfPresent(weatherStateAbbr, forKey: .weatherStateAbbr)
        try container.encodeIfPresent(windDirectionCompass, forKey: .windDirectionCompass)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(applicableDate, forKey: .applicableDate)
        try container.encodeIfPresent(minTemp, forKey: .minTemp)
        try container.encodeIfPresent(maxTemp, forKey: .maxTemp)
        try container.encodeIfPresent(theTemp, forKey: .theTemp)
        try container.encodeIfPresent(winSpeed, forKey: .winSpeed)
        try container.encodeIfPresent(winDirection, forKey: .winDirection)
        try container.encodeIfPresent(airPressure, forKey: .airPressure)
        try container.encodeIfPresent(humidity, forKey: .humidity)
        try container.encodeIfPresent(visibility, forKey: .visibility)
        try container.encodeIfPresent(predictability, forKey: .predictability)
    }
}
