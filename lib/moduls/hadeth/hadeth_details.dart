import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_4pm/moduls/hadeth/hadeth_view.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "Hadeth_Details";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethContent;

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
              Text(
                args.hadethtitle,
                style: theme.textTheme.bodyLarge,
              ),
              Divider(
                color: theme.primaryColor,
                thickness: 1.2,
                indent: 30,
                endIndent: 30,
              ),
              Text(
                args.hadethContent,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
