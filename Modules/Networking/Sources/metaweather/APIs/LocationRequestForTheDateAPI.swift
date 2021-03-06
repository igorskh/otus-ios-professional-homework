//
// LocationRequestForTheDateAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class LocationRequestForTheDateAPI {

    /**
     Retrieve location weather for the date
     
     - parameter woeid: (path) Numeric ID of the location 
     - parameter year: (path)  
     - parameter month: (path)  
     - parameter day: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getLocationForDate(woeid: Int, year: Int, month: Int, day: Int, apiResponseQueue: DispatchQueue = OpenAPIClient.apiResponseQueue, completion: @escaping ((_ data: [Location]?, _ error: Error?) -> Void)) {
        getLocationForDateWithRequestBuilder(woeid: woeid, year: year, month: month, day: day).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Retrieve location weather for the date
     - GET /location/{woeid}/{year}/{month}/{day}
     - parameter woeid: (path) Numeric ID of the location 
     - parameter year: (path)  
     - parameter month: (path)  
     - parameter day: (path)  
     - returns: RequestBuilder<[Location]> 
     */
    open class func getLocationForDateWithRequestBuilder(woeid: Int, year: Int, month: Int, day: Int) -> RequestBuilder<[Location]> {
        var localVariablePath = "/location/{woeid}/{year}/{month}/{day}"
        let woeidPreEscape = "\(APIHelper.mapValueToPathItem(woeid))"
        let woeidPostEscape = woeidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{woeid}", with: woeidPostEscape, options: .literal, range: nil)
        let yearPreEscape = "\(APIHelper.mapValueToPathItem(year))"
        let yearPostEscape = yearPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{year}", with: yearPostEscape, options: .literal, range: nil)
        let monthPreEscape = "\(APIHelper.mapValueToPathItem(month))"
        let monthPostEscape = monthPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{month}", with: monthPostEscape, options: .literal, range: nil)
        let dayPreEscape = "\(APIHelper.mapValueToPathItem(day))"
        let dayPostEscape = dayPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{day}", with: dayPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Location]>.Type = OpenAPIClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
