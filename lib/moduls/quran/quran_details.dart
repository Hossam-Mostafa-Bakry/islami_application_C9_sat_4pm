import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c9_sat_4pm/moduls/quran/quran_view.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "Quran_Details";

  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as SuraData;

    // get data from files
    // async
    if (content.isEmpty) readData(arg.suraIndex);

    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background_light.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("إسلامي"),
        ),
        body: Container(
          margin: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 25,
            bottom: 120,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          height: mediaQuery.height,
          width: mediaQuery.width,
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${arg.suraName}",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.play_circle,
                    size: 30,
                  )
                ],
              ),
              Divider(
                color: theme.primaryColor,
                thickness: 1.2,
                indent: 30,
                endIndent: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    allVerses[index],
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                  itemCount: allVerses.length,
                ),
              ),
              // Text(
              //   content,
              //   textAlign: TextAlign.center,
              //   style: theme.textTheme.bodySmall,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // asyns vs sync
  readData(String index) async {
    var text = await rootBundle.loadString("assets/files/$index.txt");
    content = text;
    setState(() {
      allVerses = content.split("\n");
    });
    print(text);
  }
}
