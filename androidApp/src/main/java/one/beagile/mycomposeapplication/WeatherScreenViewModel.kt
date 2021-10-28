package one.beagile.mycomposeapplication

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import one.beagile.metaweatherClient.models.Location
import one.beagile.shared.WeatherService

class WeatherScreenViewModel : ViewModel() {
    private val weatherService = WeatherService()

    var locationValue by mutableStateOf("")
    var errorText by mutableStateOf("")
    var locations by mutableStateOf(emptyList<Location>())

    suspend fun searchLocation() {
        errorText = ""

        val result = weatherService.searchLocation(locationValue)
        if (result.errorText.isNotEmpty()) {
            errorText = result.errorText
        }
        locations = result.locations
    }
}
