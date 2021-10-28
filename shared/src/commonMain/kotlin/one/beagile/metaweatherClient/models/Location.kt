/**
 * metaweather
 *
 * metaweather.com
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * Please note:
 * This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * Do not edit this file manually.
 */

@file:Suppress(
    "ArrayInDataClass",
    "EnumEntryName",
    "RemoveRedundantQualifierName",
    "UnusedImport"
)

package one.beagile.metaweatherClient.models

import one.beagile.metaweatherClient.models.LocationParent
import one.beagile.metaweatherClient.models.LocationType
import one.beagile.metaweatherClient.models.LocationWeather
import one.beagile.metaweatherClient.models.WeatherSource

import kotlinx.serialization.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

/**
 * 
 *
 * @param title 
 * @param woeid 
 * @param locationType 
 * @param lattLong 
 * @param distance 
 * @param time 
 * @param sunRise 
 * @param sunSet 
 * @param timezoneName 
 * @param parent 
 * @param timezone 
 * @param sources 
 * @param consolidatedWeather 
 * @param children 
 */
@Serializable
data class Location (

    @SerialName(value = "title") @Required val title: kotlin.String,

    @SerialName(value = "woeid") @Required val woeid: kotlin.Int,

    @SerialName(value = "location_type") @Required val locationType: LocationType,

    @SerialName(value = "latt_long") @Required val lattLong: kotlin.String,

    @SerialName(value = "distance") val distance: kotlin.Double? = null,

    @SerialName(value = "time") val time: kotlin.String? = null,

    @SerialName(value = "sun_rise") val sunRise: kotlin.String? = null,

    @SerialName(value = "sun_set") val sunSet: kotlin.String? = null,

    @SerialName(value = "timezone_name") val timezoneName: kotlin.String? = null,

    @SerialName(value = "parent") val parent: LocationParent? = null,

    @SerialName(value = "timezone") val timezone: kotlin.String? = null,

    @SerialName(value = "sources") val sources: kotlin.collections.List<WeatherSource>? = null,

    @SerialName(value = "consolidated_weather") val consolidatedWeather: kotlin.collections.List<LocationWeather>? = null,

    @SerialName(value = "children") val children: kotlin.collections.List<LocationParent>? = null

)

