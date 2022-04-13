import 'package:flutter/material.dart';
import 'package:spotify_clone/models/song.dart';
import 'package:spotify_clone/services/song_api.dart';
import 'package:spotify_clone/views/album_view.dart';
import 'package:spotify_clone/widgets/album_card.dart';
import 'package:spotify_clone/widgets/song_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getSongFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            final dynamic songData = snapshot.data;
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(210, 86, 87, 87),
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    // child: FutureBuilder(
                    // future: getVideoFromApi(filter: _selectedFilter),
                    // builder: (context, snapshot) {
                    //   if (snapshot.connectionState == ConnectionState.waiting) {
                    //     return Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   } else if (snapshot.hasError) {
                    //     return Center(
                    //       child: Text(snapshot.error.toString()),
                    //     );
                    //   } else {
                    //     return VideosGrid(videos: snapshot.data);
                    //   }
                    // },
                    // ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recently Played",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.notifications_none_outlined),
                                    Icon(Icons.history),
                                    Icon(Icons.settings),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                for (var i = 0; i < songData.data.length-15; i++)
                                  AlbumCard(
                                    label: songData.data[i]
                                        .titleShort, //(songData.data[i].titleShort.length > 13)? songData.data[i].titleShort.substring(0, 13) + '...' : songData.data[i].titleShort,
                                    //image: AssetImage("assets/album7.jpg"),
                                    image: Image.network(
                                      songData.data[i].artist.pictureBig,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                    //network(imageUrl!, fit: BoxFit.cover),
                                  ),
                                AlbumCard(
                                  label: songData.data[0].title,
                                  //image: AssetImage("assets/album7.jpg"),
                                  image: Image(
                                    image: AssetImage("assets/album7.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  //network(imageUrl!, fit: BoxFit.cover),
                                ),
                                AlbumCard(
                                  label: "Mot6ivation Mix",
                                  image: Image(
                                    image: AssetImage("assets/album2.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AlbumCard(
                                  label: "Top 50-Global",
                                  image: Image(
                                    image: AssetImage("assets/top50.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AlbumCard(
                                  label: "Power Gaming",
                                  image: Image(
                                    image: AssetImage("assets/album1.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AlbumCard(
                                  label: "Top songs - Global",
                                  image: Image(
                                    image: AssetImage("assets/album9.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Bonjour",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    RowAlbumCard(
                                      label: "Top 50 - Global",
                                      image: AssetImage("assets/top50.jpg"),
                                    ),
                                    RowAlbumCard(
                                      label: "Mix Détente",
                                      image: AssetImage("assets/album1.jpg"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    RowAlbumCard(
                                      label: "RapCaviar",
                                      image: AssetImage("assets/album2.jpg"),
                                    ),
                                    RowAlbumCard(
                                      label: "Eminem",
                                      image: AssetImage("assets/album5.jpg"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    RowAlbumCard(
                                      label: "Top 50 - Benin",
                                      image: AssetImage("assets/album9.jpg"),
                                    ),
                                    RowAlbumCard(
                                      label: "Pop Remix",
                                      image: AssetImage("assets/album10.jpg"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Réécoutez vos anciens favoris",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    for (var i = 10; i < songData.data.length-7; i++)
                                      SongCard(
                                        image: Image.network(
                                          songData.data[i].artist.pictureBig,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album2.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album9.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album4.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album5.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Les plus grands hits actuels",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    for (var i = 17; i < songData.data.length; i++)
                                      SongCard(
                                        image: Image.network(
                                          songData.data[i].artist.pictureBig,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album5.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album6.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album3.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SongCard(
                                      image: Image(
                                        image: AssetImage("assets/album10.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage? image;
  final String? label;
  const RowAlbumCard({
    Key? key,
    this.image,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image!,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(label!)
          ],
        ),
      ),
    );
  }
}
