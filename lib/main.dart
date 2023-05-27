import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SpaceXRootWidget(
          title: "SpaceX'in Son Uçuşu",
        ));
  }
}

class SpaceXRootWidget extends StatelessWidget {
  SpaceXRootWidget({required this.title, Key? key}) : super(key: key);

  final String title;

  final List<SpaceXLaunch> spacexLaunches = [
    SpaceXLaunch(
      missionTitle: "ax-1",
      missionDetails: "Axiom Mission details",
      missionLogo: "assets/images/mission_logo.jpeg",
      missionWatchUrl: "https://www.youtube.com/watch?v=Zzl5PYh9WUk",
    ),
    SpaceXLaunch(
      missionTitle: "ax-2",
      missionDetails: "Axiom Mission details 2",
      missionLogo: "assets/images/mission_logo_2.jpeg",
      missionWatchUrl: "https://www.youtube.com/watch?v=Zzl5PYh9WUkldskjdjs",
    ),
    SpaceXLaunch(
      missionTitle: "ax-3",
      missionDetails: "Axiom Mission details 3",
      missionLogo: "assets/images/mission_logo_2.jpeg",
      missionWatchUrl: "https://www.youtube.com/watch?v=Zzl5PYh9WUkldskjdjs",
    ),
    SpaceXLaunch(
      missionTitle: "ax-4",
      missionDetails: "Axiom Mission details 4",
      missionLogo: "assets/images/mission_logo_2.jpeg",
      missionWatchUrl: "https://www.youtube.com/watch?v=Zzl5PYh9WUkldskjdjs",
    ),
    SpaceXLaunch(
        missionTitle: "ax-5",
        missionDetails: "Axiom Mission details 4",
        missionLogo: "assets/images/mission_logo_2.jpeg",
        missionWatchUrl: "https://www.youtube.com/watch?v=Zzl5PYh9WUkldskjdjs",
        isMissionWithImage: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.access_alarms_sharp),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => spacexLaunches[index].isMissionWithImage
              ? LaunchWidget(spaceXLaunch: spacexLaunches[index])
              : Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                ),
          itemCount: spacexLaunches.length,
        ),
      ),
    );
  }
}

class LaunchWidget extends StatelessWidget {
  const LaunchWidget({
    super.key,
    required this.spaceXLaunch,
  });

  final SpaceXLaunch spaceXLaunch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/mission_logo.jpeg"),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Text(
            spaceXLaunch.missionTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          spaceXLaunch.missionDetails,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            print('Button pressed!');
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, shape: const StadiumBorder(),
            backgroundColor: Colors.red, // Set the shape to stadium
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Button text color
          ),
          child: const Text("Uçuşu İzle"),
        ),
      ],
    );
  }
}

class SpaceXLaunch {
  final String missionTitle;
  final String missionDetails;
  final String missionLogo;
  final String missionWatchUrl;
  final bool isMissionWithImage;

  SpaceXLaunch({
    required this.missionTitle,
    required this.missionDetails,
    required this.missionLogo,
    required this.missionWatchUrl,
    this.isMissionWithImage = true,
  });
}
