import 'package:flutter/material.dart';
import 'package:event_app/Helpers/Agenda_Content.dart';
import 'package:event_app/Helpers/Custom_Scaffold.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage>
    with SingleTickerProviderStateMixin {
  TabController _AgendaTabscontroller;

  @override
  void initState() {
    // TODO: implement initState
    _AgendaTabscontroller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _AgendaTabscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScaffold(
      appTitle: 'Agenda',
      BottomWidget: TabBar(
        controller: _AgendaTabscontroller,
        tabs: <Widget>[
          Tab(
            child: Text(
              '16 October',
              style: TextStyle(color: Colors.black,fontSize: 17, fontFamily: 'OpenSans'),
            ),
          ),
          Tab(
            child: Text(
              '17 October',
              style: TextStyle(color: Colors.black,fontSize: 17, fontFamily: 'OpenSans'),
            ),
          ),
          Tab(
            child: Text(
              '18 October',
              style: TextStyle(color: Colors.black,fontSize: 17, fontFamily: 'OpenSans'),
            ),
          )
        ],
      ),
      CustomBody: AgendaBodyWidget(),
      CustomIcon: Icon(Icons.share),
    );
  }
}

class AgendaBodyWidget extends StatelessWidget {
  const AgendaBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AgendaContent(
          title: 'Agenda 1',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          image: AssetImage('images/harsh_akshit.jpeg'),
        ),
        AgendaContent(
          title: 'Agenda 2',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since ',
          image: AssetImage('images/harsh_akshit.jpeg'),
        )
      ],
    );
  }
}
