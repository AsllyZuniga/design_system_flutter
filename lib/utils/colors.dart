import 'package:flutter/material.dart';

final class CustomColors {
  const CustomColors._();

  // Color principal
  static const Color primaryColor = Color(0xFF2196F3); // Azul como color principal

  // Colores derivados
  static const Color buttonColor = Color(0xFF37a1f4); // Color de botón basado en el color principal
  static const Color primaryContainer = Color(0xFF37a1f4); // Contenedor principal
  static const Color onPrimaryContainer = Color(0xFFFFFFFF); // Texto sobre el contenedor principal
  static const Color primaryFixed = Color(0xFF37a1f4); // Fondo fijo principal
  static const Color onPrimaryFixed = Color(0xFFFFFFFF); // Texto sobre fondo fijo principal
  static const Color primaryFixedDim = Color(0xFFBBDEFB); // Variante de fondo fijo principal
  static const Color onPrimaryFixedVariant = Color(0xFF37a1f4); // Variante de texto sobre fondo fijo principal
  static const Color primaryHover = Color(0xFF1565C0); // Efecto hover basado en el color principal
  static const Color primaryPressed = Color(0xFF0D47A1); // Efecto presionado basado en el color principal

  // Colores secundarios
  static const Color secondary = Color(0xFF4CAF50); // Verde secundario
  static const Color onSecondary = Color(0xFFFFFFFF); 
  static const Color onSecondaryContainer = Color(0xFF4CAF50); 
  static const Color onSecondaryFixed = Color(0xFF4CAF50); 
  static const Color secondaryHover = Color(0xFF388E3C); 
  static const Color secondaryPressed = Color(0xFF2E7D32); 

  // Colores terciarios y otros
  static const Color tertiary = Color(0xFF9E9E9E); //Gris claro
  static const Color onTertiary = Color(0xFFFFFFFF); 
  static const Color tertiaryContainer = Color(0xFF9E9E9E); 
  static const Color onTertiaryContainer = Color(0xFFFFFFFF);  
  static const Color tertiaryFixed = Color(0xFF9E9E9E); 
  static const Color onTertiaryFixed = Color(0xFFFFFFFF); 
  static const Color tertiaryFixedDim = Color(0xFF757575);
  static const Color onTertiaryFixedVariant = Color(0xFF9E9E9E); 

  static const Color outline = Color(0xFFBDBDBD); 
  static const Color background = Color(0xFFE0E0E0); 
  static const Color onBackground = Color(0xFF000000); 

  static const Color surface = Color(0xFFFAFAFA); 
  static const Color onSurface = Color(0xFF000000); 
  static const Color surfaceVariant = Color(0xFFEEEEEE); 
  static const Color onSurfaceVariant = Color(0xFF000000); 
  static const Color inverseSurface = Color(0xFF000000); 
  static const Color inverseOnSurface = Color(0xFFFFFFFF); 

  static const Color inversePrimary = Color(0xFFFFFFFF); 
  static const Color shadow = Color(0x8A000000); 
  static const Color surfaceTint = Color(0x1F000000); 
  static const Color outlineVariant = Color(0xFFEEEEEE); 

  static const Color scrim = Color(0x99000000); // Tela de fondo semitransparente

  //Colores de error
  static const Color error = Color(0xFFD32F2F); //Color rojo
  static const Color onError = Color(0xFFFFFFFF); 
  static const Color errorContainer = Color(0xFFD32F2F); 
  static const Color onErrorContainer = Color(0xFFFFFFFF); 

  // Contenedores de superficie
  static const Color surfaceContainerHighest = Color(0xFF212121); // Contenedor de superficie más alto
  static const Color surfaceContainerHigh = Color(0xFF424242); 
  static const Color surfaceContainer = Color(0xFFFAFAFA); 
  static const Color surfaceContainerLow = Color(0xFFB0BEC5); // Contenedor de superficie bajo
  static const Color surfaceContainerLowest = Color(0xFFCFD8DC); // Contenedor de superficie más bajo

  static const Color surfaceBright = Color(0xFFEEEEEE); // Superficie brillante
  static const Color surfaceDim = Color(0xFFB0BEC5); // Superficie apagada

  // Colores de advertencia
  static const Color warning = Color(0xFFFFA000); // Amarillo de advertencia
  static const Color onWarning = Color(0xFF000000); 
  static const Color warningContainer = Color(0xFFFFA000); 
  static const Color onWarningContainer = Color(0xFFFFFFFF); 

  // Colores de éxito
  static const Color success = Color(0xFF4CAF50); // Verde de éxito
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFF4CAF50); // Contenedor de éxito
  static const Color onSuccessContainer = Color(0xFFFFFFFF); 

  // Colores de información
  static const Color info = Color(0xFF2196F3); // Azul de información
  static const Color onInfo = Color(0xFFFFFFFF); // Texto sobre el color de información
  static const Color infoContainer = Color(0xFF2196F3); 
  static const Color onInfoContainer = Color(0xFFFFFFFF); 

  // Colores de desactivado
  static const Color disabledContainer = Color(0xFFBDBDBD); // Contenedor desactivado
  static const Color onDisabled = Color(0xFFBDBDBD); 
  static const Color darkSecondaryContainer = Color(0xFF455A64); // Contenedor secundario oscuro
}
