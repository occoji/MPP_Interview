import 'package:flutter/material.dart';

/// Color listed according to importance
/// 0 primary color : Dark green
/// 1 secondary color : white
/// 2 tertiary color : light green
/// 3 background color : light white
/// 4 subtitle color : light grey
List<Color> palette = const [
  Color(0xFF0B3B2F),
  Color(0xFFFFFFFF),
  Color(0xFF658C68),
  Color(0xFFF8FAF7),
  Color(0xFFEBEEEA),
];

/// Style - Titre vert (palette 0)
TextStyle styleTitle() {
  return TextStyle(fontSize: 44, fontFamily: "Philosopher", color: palette[0]);
}

/// Style - soustitre de l'application
TextStyle styleSubtitle() {
  return TextStyle(
      fontSize: 18,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w900,
      color: palette[4]);
}

/// Style - prix (Extra bold + palette 2)
TextStyle stylePrice() {
  return TextStyle(
      fontSize: 24,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w900,
      color: palette[1]);
}

/// Style - soustitre de l'objet card (THIN + palette 1)
TextStyle styleSubtitleLight() {
  return TextStyle(
      fontSize: 18,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w100,
      color: palette[1]);
}

/// Style - Ecriture des l'onglet
TextStyle styleTab() {
  return TextStyle(fontSize: 22, fontFamily: "Roboto", color: palette[0]);
}

/// Style - Titre vert (palette 2)
TextStyle styleTitleWhite() {
  return TextStyle(fontSize: 44, fontFamily: "Philosopher", color: palette[1]);
}

/// Style - Bouton appbar (palette 0)
ButtonStyle styleTopButton = ButtonStyle(
  padding: MaterialStateProperty.all(EdgeInsets.zero),
  elevation: MaterialStateProperty.all(8),
  backgroundColor: MaterialStateProperty.all(palette[1]),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
);

/// Style - bouton card (palette 2)
ButtonStyle styleCardButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(palette[2]),
  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(16.0),
    bottomRight: Radius.circular(16.0),
  ))),
);
