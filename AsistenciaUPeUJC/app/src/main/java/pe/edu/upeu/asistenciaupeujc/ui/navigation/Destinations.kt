package pe.edu.upeu.asistenciaupeujc.ui.navigation

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Face
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.List
import androidx.compose.material.icons.filled.Notifications
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.ui.graphics.vector.ImageVector

sealed class Destinations(
    val route: String,
    val title: String,
    val icon: ImageVector
) {
    object Pantalla1 : Destinations( "pantalla1", "Inicio", Icons.Filled.Home )
    object Pantalla2 : Destinations("pantalla2/?newText={newText}", "Pedidos", Icons.Filled.ShoppingCart) {
        fun createRoute(newText: String) = "pantalla2/?newText=$newText"
    }
    object Pantalla3 : Destinations("pantalla3", "Lista", Icons.Filled.List)
    object Pantalla4 : Destinations("pantalla4", "Mensaje", Icons.Filled.Notifications )
    object Pantalla5 : Destinations("pantalla5", "Config", Icons.Filled.Settings )
}