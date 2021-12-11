/// La classe Plant permet de constuire les éléments produit d'une plante.
/// [name] Nom de la plante
/// [place] Place d'utilisation de la plante
/// [imageURL] lien vers l'image illustration de la plante
/// [price] prix de la plante
///
class Plant {
  String name;
  String place;
  String imageURL;
  int price;

  Plant(
      {required this.name,
      required this.place,
      required this.imageURL,
      required this.price});
}

/// Liste qui contient toute les plantes affichées dans l'application.
List<Plant> plants = [
  Plant(
      name: "Fiddle leaf",
      place: "Living Room",
      imageURL: "lib/assets/images/plant.png",
      price: 25),
  Plant(
      name: "Aloe Vera",
      place: "Living Room",
      imageURL: "lib/assets/images/plant2.png",
      price: 25),
  Plant(
      name: "Orchid",
      place: "Living Room",
      imageURL: "lib/assets/images/plant3.png",
      price: 25)
];
