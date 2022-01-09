import 'package:flutter/material.dart';
import 'package:kurtlarvadisiimsakiye/models/daymodel.dart';
import 'package:kurtlarvadisiimsakiye/services/dayservice.dart';
import 'package:kurtlarvadisiimsakiye/services/sectionservice.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

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
      actions: [
        InkWell(
          onTap: () => showInfo(),
          child: const Icon(Icons.info_outline),
        )
      ],
    );
  }

  void showInfo() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Uygulama Hakkında'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                    'Bu uygulama Tahsin Emre Telli tarafından 2022 yılı ramazan ayına ithafen yapılmıştır.'),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => launch('https:tahsinemre.com'),
                child: const Text('tahsinemre.com'),
              )
            ],
          );
        });
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ...DayService.dayList.map((e) => dayTile(e)),
        ],
      ),
    );
  }

  Widget dayTile(DayModel model) {
    String sections = '';
    for (var item in model.sections) {
      sections += item.toString() + ', ';
    }
    return ListTile(
      tileColor:
          model.day % 2 == 0 ? Colors.grey.shade100 : Colors.grey.shade300,
      title: Text(model.day.toString() + ' Nisan'),
      trailing: Text(sections != '' ? sections : 'Kadir Gecesi'),
      onTap: () => showSections(model),
    );
  }

  void showSections(DayModel m) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(m.day.toString() + ' Nisan Bölümleri'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...SectionService.sectionList
                    .where((element) => element.day == m.day)
                    .map((e) => InkWell(
                          onTap: () => launch(e.link),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.id.toString() + '. Bölüm'),
                          ),
                        ))
              ],
            ),
          );
        });
  }
}
