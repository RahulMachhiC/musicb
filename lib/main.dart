import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicb/Bloc/Music/music_bloc.dart';
import 'package:musicb/Bloc/Network/network_bloc.dart';
import 'package:musicb/Bloc/Song/song_bloc.dart';
import 'package:musicb/Bloc/Track/track_bloc.dart';
import 'package:musicb/Repository/LyricsRepo.dart';
import 'package:musicb/Repository/SongRepo.dart';
import 'package:musicb/Repository/Trackdetailrepo.dart';
import 'package:musicb/Screens/Homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MusicBloc(lyricsRepo: LyricsImpl()),
          child: Homescreen(),
        ),
        BlocProvider(
          create: (context) => TrackBloc(trackdetailRepo: TrackdetailImpl()),
        ),
        BlocProvider(create: (context) => SongBloc(songRepo: Songimpl())),
        BlocProvider(create: (context) => NetworkBloc())
      ],
      child: MaterialApp(
        home: Homescreen(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
