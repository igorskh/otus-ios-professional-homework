package one.beagile.shared

import one.beagile.metaweatherClient.apis.LocationRequestApi
import one.beagile.metaweatherClient.apis.WeatherSearchApi
import one.beagile.metaweatherClient.models.Location

data class WeatherServiceLocationResponse(
    val locations: List<Location> = emptyList(),
    val errorText: String = ""
)

class WeatherService {
    suspend fun searchLocation(locationValue: String): WeatherServiceLocationResponse {
        return try {

            val client = WeatherSearchApi()
            val locations: List<Location> = client.weatherSearch(locationValue, null).body()

            WeatherServiceLocationResponse(
                locations,
                ""
            )
        } catch (cause: Throwable) {
            WeatherServiceLocationResponse(
                emptyList(),
                cause.message ?: "Unknown error"
            )
        }
    }

    suspend fun getLocation(woeid: Int): String {
        return try {
            val client = LocationRequestApi()
            val location: Location = client.getLocation(woeid).body()

            location.title
        } catch (cause: Throwable) {
            cause.printStackTrace().toString()
        }
    }
}