import 'package:flutter/material.dart';
import 'package:mpp_interview/plants.dart';
import 'package:mpp_interview/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /// fonction qui permet de construire le widget de titre de l'application
    Widget title(String text) {
      return Text(
        text,
        style: styleTitle(),
        textAlign: TextAlign.left,
      );
    }

    /// fonction qui permet de construire le widget de sous titre de l'application
    Widget subtitle(String text) {
      return Text(
        text,
        style: styleSubtitle(),
        textAlign: TextAlign.left,
      );
    }

    /// fonction qui permet de construire le bouton en haut à droite,
    /// au niveau de l'emplacement de l'appbar. Pour mettre en place son fonctionnement,
    /// il faut modifier le contenue de la propriété onPressed.
    Widget topButton() {
      return SizedBox(
        height: 48,
        width: 48,
        child: ElevatedButton(
          style: styleTopButton,
          onPressed: () {},
          child: Icon(Icons.apps, color: palette[0], size: 24),
        ),
      );
    }

    /// Widget haut de l'écran, qui remplace l'appBar
    Widget topScreen() {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subtitle("Vendredi 10 décembre"),
              title("Top Picks"),
            ],
          ),
          const Spacer(),
          topButton()
        ],
      );
    }

    return Scaffold(
      backgroundColor: palette[3],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              topScreen(),
              const SizedBox(height: 16.0),
              // Expanded permet ici d'étendre le widget MiddleTabSelection jusqu'en
              // bas de page.
              const Expanded(child: MiddleTabSelection()),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget qui permet la mise en place de tabs sur la page
/// Il s'agit d'un stateful widget car l'état du widget dépend des actions de
/// l'utilisateur
class MiddleTabSelection extends StatefulWidget {
  const MiddleTabSelection({Key? key}) : super(key: key);

  @override
  _MiddleTabSelectionState createState() => _MiddleTabSelectionState();
}

class _MiddleTabSelectionState extends State<MiddleTabSelection>
    with SingleTickerProviderStateMixin {
  /// Controller permettant de gérer le state des onglets et contenus des onglets
  late TabController _tabController;

  @override
  void initState() {
    // on ititialise le controller à la création du widget
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // on détruit le controller à la "disparition" du widget
    _tabController.dispose();
  }

  /// Fonction qui permet de metttre à jour le Titre de la carte
  Widget title(String text) {
    return Text(
      text,
      style: styleTitleWhite(),
      textAlign: TextAlign.left,
    );
  }

  /// Fonction qui permet de mettre à jour le Prix
  Widget subtitle(String text) {
    return Text(
      text,
      style: stylePrice(),
      textAlign: TextAlign.left,
    );
  }

  /// Fonction qui permet de mettre à jour le
  /// Sous titre et sous titre prix
  Widget subtitleLight(String text) {
    return Text(
      text,
      style: styleSubtitleLight(),
      textAlign: TextAlign.left,
    );
  }

  /// page d'un onglet composée de 3 cartes de plantes
  Widget pageDesc() {
    return ListView.builder(
        itemCount: plants.length,
        itemBuilder: (BuildContext context, int index) {
          return plantCard(plants[index]);
        });
  }

  /// fonction qui et renvoit les onglets et selecteurs d'onglet
  Widget tabs() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: palette[1],
        ),
        labelColor: palette[0],
        unselectedLabelColor: palette[0],
        labelStyle: styleTab(),
        tabs: const [
          Tab(text: "Top"),
          Tab(text: 'Outdoor'),
          Tab(text: 'Indoor'),
        ],
      ),
    );
  }

  // pages affichées suivant le choix de l'onglet (tous identiques ici)
  Widget pages() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          pageDesc(),
          pageDesc(),
          pageDesc(),
        ],
      ),
    );
  }

  /// Fonction qui affiche le rectangle gris, en fond se selecteur d'onglet et
  /// renvoit les onglets et selecteurs d'onglet
  Widget backgroundTabSelection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: palette[4], borderRadius: BorderRadius.circular(16)),
          child: tabs(),
        ),
        const SizedBox(
          height: 8,
        ),
        pages(),
      ],
    );
  }

  /// Widget montrant les différentes plantes
  /// Le problème principal rencontré est l'aspect blanc en fond des 2 premières photos.
  /// Je pense qu'il est possible d'enlever ce problème en supprimant certaines couleurs,
  /// mais je me suis dit qu'il était plus facile et efficace de les détourer à la main.
  /// J'ai ajouté une propre création (superbe illusatrion de la troisième carte pour vérifier
  /// et montrer que ce problème d'absence de transparence était relative aux images elles meme et pas à
  /// mon ajout sur la page)
  Widget plantCard(Plant plant) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
            color: palette[0], borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(plant.name),
                    const SizedBox(height: 8),
                    subtitleLight(plant.place),
                    const Spacer(),
                    Center(
                        child: SizedBox(
                            height: 350, child: Image.asset(plant.imageURL))),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      color: palette[0],
                      borderRadius: BorderRadius.circular(16)),
                  child: ElevatedButton(
                      style: styleCardButton,
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          subtitle('\$${plant.price}'),
                          subtitleLight('from')
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return backgroundTabSelection();
  }
}
