import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // font family Amiri using google fonts
        textTheme: GoogleFonts.amiriTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const WatchScreen(),
    );
  }
}

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  int number = 40;

  String get _title {
    if (number < 33) {
      return 'سبحان الله';
    } else if (number < 66) {
      return 'الحمد لله';
    } else if (number < 100) {
      return 'الله أكبر';
    }
    return 'لا إله إلا الله وحده لا شريك له\n له الملك وله الحمد\n وهو على كل شيء قدير';
  }

  Color get _color {
    if (number < 33) {
      return Colors.yellow[300]!;
    } else if (number < 66) {
      return Colors.orange[300]!;
    } else if (number < 100) {
      return Colors.orange[400]!;
    }
    return Colors.amberAccent;
  }

  @override
  Widget build(BuildContext context) {
    double progress = number / 100.0;

    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            // make background as image
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/image.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: CircularProgressIndicator(
                              value: progress,
                              // strokeWidth: 2
                              strokeCap: StrokeCap.round,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(_color),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    number = 0;
                                  });
                                },
                              ),
                              Text(
                                number.toString(),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (number < 100) {
                                      number++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          Positioned(
                            top: 80,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                _title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: number == 100 ? 9 : 12,
                                  fontWeight: FontWeight.w300,
                                  color: _color,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
