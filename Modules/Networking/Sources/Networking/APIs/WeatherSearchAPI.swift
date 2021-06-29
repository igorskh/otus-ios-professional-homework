//
// WeatherSearchAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class WeatherSearchAPI {
    /**
     Weather Search
     
     - parameter query: (query) search query (optional)
     - parameter lattlong: (query) Latitude longitude (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func weatherSearch(query: String? = nil, lattlong: [Double]? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Location]?, _ error: Error?) -> Void)) {
        weatherSearchWithRequestBuilder(query: query, lattlong: lattlong).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Weather Search
     - GET /location/search/
     - parameter query: (query) search query (optional)
     - parameter lattlong: (query) Latitude longitude (optional)
     - returns: RequestBuilder<[Location]> 
     */
    open class func weatherSearchWithRequestBuilder(query: String? = nil, lattlong: [Double]? = nil) -> RequestBuilder<[Location]> {
        let path = "/location/search/"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String: Any]? = nil

        var urlComponents = URLComponents(string: URLString)
        urlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "query": query?.encodeToJSON(),
            "lattlong": lattlong?.encodeToJSON(),
        ])

        let nillableHeaders: [String: Any?] = [
            :
        ]

        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<[Location]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (urlComponents?.string ?? URLString), parameters: parameters, headers: headerParameters)
    }

}