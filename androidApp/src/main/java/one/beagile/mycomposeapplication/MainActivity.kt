package one.beagile.mycomposeapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material.*
import androidx.compose.runtime.*
import one.beagile.mycomposeapplication.ui.theme.MyComposeApplicationTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApp {
                WeatherScreen()
            }
        }
    }
}

@Composable
fun MyApp(content: @Composable () -> Unit) {
    MyComposeApplicationTheme {
        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(text = "KMM Compose Application")
                    }
                )
            }
        ) {
            content()
        }
    }
}