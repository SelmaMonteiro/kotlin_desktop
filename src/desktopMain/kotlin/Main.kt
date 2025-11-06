// src/desktopMain/kotlin/Main.kt
import androidx.compose.desktop.ui.tooling.preview.Preview
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.window.Window
import androidx.compose.ui.window.application

fun main() = application {
    Window(
        onCloseRequest = ::exitApplication,
        title = "My First Kotlin Desktop App"
    ) {
        App()
    }
}

@Composable
@Preview
fun App() {
    var text by remember { mutableStateOf("Hello, Compose Desktop!") }

    Button(onClick = {
        text = "Hello, Kotlin & Maven!"
    }) {
        Text(text)
    }
}