import 'package:ACApp/util/get_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../models/index.dart';
import '../../util/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class CritterPage extends StatelessWidget {
  final Critter _critter;
  final date = new DateTime.now();
  CritterPage(this._critter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_critter.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: '',
            imageUrl: _critter.image,
            body: Text(
              _critter.caughtQuote,
            ),
            separator: true,
          ),
          Separator.cardSpacer(),
          CardPage(
              title: 'DETAILS',
              body: displayWidgets([
                _critter.timeYear,
                Separator.spacer(),
                _critter.timeDay,
                getAvailableCritter(date, _critter.timeYear, _critter.timeDay)
                    ? Icon(FontAwesome.check_circle, color: Colors.greenAccent)
                    : Icon(Entypo.circle_with_cross, color: Colors.redAccent),
              ], context)),
        ],
      ),
    );
  }
}
