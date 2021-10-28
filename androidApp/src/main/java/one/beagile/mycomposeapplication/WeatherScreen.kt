package one.beagile.mycomposeapplication

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import kotlinx.coroutines.launch
import one.beagile.metaweatherClient.models.Location
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.*
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.input.ImeAction


@Composable
fun WeatherScreen(
    myViewModel: WeatherScreenViewModel = viewModel()
) {
    val composableScope = rememberCoroutineScope()
    val focusManager = LocalFocusManager.current

    Column {
        Row(verticalAlignment = Alignment.CenterVertically) {
            TextField(
                value = myViewModel.locationValue,
                onValueChange = { myViewModel.locationValue = it },
                label = { Text("Enter text") },
                modifier = Modifier.padding(20.dp),
                keyboardOptions = KeyboardOptions(imeAction = ImeAction.Search),
                keyboardActions = KeyboardActions(
                    onSearch = {
                        composableScope.launch {
                            myViewModel.searchLocation()
                            focusManager.clearFocus()
                        }
                    }
                ),
                singleLine = true,
            )
        }

        Column(modifier = Modifier.padding(horizontal = 20.dp)) {
            Text(myViewModel.errorText)
            Text("Found: ${myViewModel.locations.count()}")
        }

        LazyColumn(modifier = Modifier.padding(horizontal = 20.dp, vertical = 8.dp)) {
            items(myViewModel.locations) { location ->
                WeatherListRow(location)
            }
        }
    }
}

@Composable
fun WeatherListRow(
    location: Location
) {
    Card(Modifier
        .fillMaxWidth()
        .padding(vertical = 5.dp),
        elevation = 2.dp
    ) {
        Text(
            location.title,
            Modifier
                .clickable { }
                .padding(vertical = 10.dp, horizontal = 8.dp)
        )
    }
}