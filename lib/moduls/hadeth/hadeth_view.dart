import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c9_sat_4pm/moduls/hadeth/hadeth_details.dart';

class HadethView extends StatefulWidget {
  HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethContent> allhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allhadeth.isEmpty) readFile();
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/hadeth_header.png"),
        Divider(
          color: theme.primaryColor,
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
          height: 10,
        ),
        Text(
          "الأحاديث",
          style: theme.textTheme.bodyMedium,
        ),
        Divider(
          color: theme.primaryColor,
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allhadeth[index]);
                },
                child: Text(
                  allhadeth[index].hadethtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                )),
            separatorBuilder: (context, index) => Divider(
              thickness: 1.2,
              color: theme.primaryColor,
              height: 15,
              endIndent: 80,
              indent: 80,
            ),
            itemCount: allhadeth.length,
          ),
        )
      ],
    );
  }

  readFile() async {
    // read the file and return with text

    String hadethText = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadethList = hadethText.split("#");
    print(allHadethList);

    for (int i = 0; i < allHadethList.length; i++) {
      String singleHadeth =
          allHadethList[i].trim(); // remove for every space in text
      int indexOfFirstLine = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);

      HadethContent hadethContent =
          HadethContent(hadethtitle: title, hadethContent: content);

      setState(() {
        allhadeth.add(hadethContent);
      });
      print(title);
    }
  }
}

class HadethContent {
  final String hadethtitle;
  final String hadethContent;

  HadethContent({required this.hadethtitle, required this.hadethContent});
}
