import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicb/Bloc/Music/music_bloc.dart';
import 'package:musicb/Bloc/Network/network_bloc.dart';
import 'package:musicb/Screens/detailscreen.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  MusicBloc musicBloc;
  NetworkBloc networkBloc;

  @override
  void initState() {
    musicBloc = BlocProvider.of<MusicBloc>(context);
    musicBloc.add(Fetchmusic());
    networkBloc = BlocProvider.of<NetworkBloc>(context);
    networkBloc.add(ListenConnection());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Bloc"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          musicBloc.add(Fetchmusic());
        },
        child: Stack(
          children: [
            BlocBuilder<MusicBloc, MusicState>(
              // ignore: missing_return
              builder: (context, state) {
                if (state is MusicLoding) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MusicLoded) {
                  print(state);
                  var usersList = state.responseUsers.message.body.trackList;
                  return ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailScreen(usersList[index]),
                                  ),
                                );
                              },
                              leading: ClipOval(
                                child: Icon(Icons.music_note),
                              ),
                              subtitle: Text(usersList[index].track.albumName),
                              title: Text(usersList[index].track.trackName),
                            ),
                            Divider()
                          ],
                        );
                      });
                } else if (state is MusicError) {}
                return Container();
              },
            ),
            Center(
              child: BlocBuilder<NetworkBloc, NetworkState>(
                builder: (context, state) {
                  if (state is ConnectionFailure)
                    return Text("No Internet Connection");
                  if (state is ConnectionSuccess)
                    return Text("You're Connected to Internet");
                  else
                    return Text("");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
