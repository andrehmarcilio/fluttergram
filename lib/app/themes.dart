import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 32, 45, 59),
    primary: const Color.fromARGB(255, 32, 45, 59),
    onTertiary: const Color.fromARGB(255, 32, 45, 59),
    secondary: const Color.fromARGB(255, 46, 131, 188),
    onSecondaryContainer: const Color.fromARGB(255, 46, 131, 188),
    onTertiaryContainer: const Color.fromARGB(255, 18, 25, 34),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 32, 45, 59),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromARGB(255, 29, 39, 51),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 29, 39, 51),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor:
        MaterialStateProperty.all(const Color.fromARGB(255, 46, 131, 188)),
  )),
);

final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 46, 131, 188),
  primary: const Color.fromARGB(255, 46, 131, 188),
  secondary: const Color.fromARGB(255, 46, 131, 188),
  onTertiary: Colors.white,
  onSecondaryContainer: const Color.fromRGBO(200, 230, 201, 1),
  onTertiaryContainer: const Color.fromARGB(255, 200, 202, 228),
));
