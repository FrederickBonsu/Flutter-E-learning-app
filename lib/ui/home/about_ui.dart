

import 'package:adessua/ui/components/logo_graphic_header.dart';
import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  static String tag = 'about';

  @override
  Widget build(BuildContext context) {




    final about = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        ' About Adessua ',
        style: Theme.of(context).textTheme.headline1,
      ),
    );

    final info= Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Adessua App is an E-learning  mobile application proposed as final year project By Frederick Bonsu and Albert okai-Mensah  at Ghana Communication technology university in the year 2021. And the purpose of this app is to help students learn with ease  anywhere especially targeting  student at senior secondary Level ',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),

      child: Column(
        children: <Widget>[LogoGraphicHeader(), about, info],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: body,
    );
  }
}

