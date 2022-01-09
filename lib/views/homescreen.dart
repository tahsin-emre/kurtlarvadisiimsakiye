import 'package:flutter/material.dart';
import 'package:kurtlarvadisiimsakiye/models/sectionmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildBody,
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text('2022 Kurtlar Vadisi İmsakiyesi'),
    );
  }

  Widget get buildBody {
    return ResponsiveBuilder(
      builder: (context, info) {
        return info.deviceScreenType == DeviceScreenType.desktop
            ? Row(
                children: [
                  Expanded(flex: 2, child: Container()),
                  Expanded(flex: 5, child: dayList()),
                  Expanded(flex: 2, child: Container()),
                ],
              )
            : dayList();
      },
    );
  }

  Widget dayList() {
    return Container();
  }

  Widget sectionTile(SectionModel model) {
    return Container();
  }

  Widget dayTile() {
    return Container();
  }
}
