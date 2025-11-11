// src/desktopMain/kotlin/Main.kt
import androidx.compose.desktop.ui.tooling.preview.Preview
import androidx.compose.foundation.layout.Column
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.material.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
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
    val texto = remember { mutableStateOf("TxtInicial") }

    Column {
        TextField(
            value = texto.value,
            onValueChange = {
                texto.value = it
                println(it)
            }
        )

        Button(onClick = {
            texto.value = "Hello, Kotlin & Maven!"
        }) {
            Text(texto.value)
        }
    }
}