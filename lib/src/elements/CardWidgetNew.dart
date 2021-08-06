import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/restaurant.dart';
import '../models/route_argument.dart';
import '../repository/settings_repository.dart';

// ignore: must_be_immutable
class CardWidgetNew extends StatelessWidget {
  Restaurant restaurant;
  String heroTag;

  CardWidgetNew({Key key, this.restaurant, this.heroTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292,
      margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 20),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).primaryColor,
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   boxShadow: [
      //     BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 5)),
      //   ],
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Image of the card
          Hero(
            tag: this.heroTag + restaurant.id,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: restaurant.image.url,
                placeholder: (context, url) => Image.asset(
                  'assets/img/loading.gif',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(restaurant.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
          Text(
            Helper.skipHtml(restaurant.description),
            overflow: TextOverflow.fade,
            softWrap: false,
            style: Theme.of(context).textTheme.caption,
          ),
          Row(children: [
            Text(restaurant.rate,
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w500),
            ),
            Icon(Icons.star,color: Colors.teal,size: 15)
          ],)

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     mainAxisSize: MainAxisSize.max,
          //     children: <Widget>[
          //       Expanded(
          //         flex: 3,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             Text(
          //               restaurant.name,
          //               overflow: TextOverflow.fade,
          //               softWrap: false,
          //               style: Theme.of(context).textTheme.subtitle1,
          //             ),
          //             Text(
          //               Helper.skipHtml(restaurant.description),
          //               overflow: TextOverflow.fade,
          //               softWrap: false,
          //               style: Theme.of(context).textTheme.caption,
          //             ),
          //             SizedBox(height: 5),
          //             Row(
          //               children: Helper.getStarsList(double.parse(restaurant.rate)),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(width: 15),
          //       Expanded(
          //         child: Column(
          //           children: <Widget>[
          //             FlatButton(
          //               padding: EdgeInsets.all(0),
          //               onPressed: () {
          //                 Navigator.of(context).pushNamed('/Pages', arguments: new RouteArgument(id: '1', param: restaurant));
          //               },
          //               child: Icon(Icons.directions, color: Theme.of(context).primaryColor),
          //               color: Theme.of(context).accentColor,
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //             ),
          //             restaurant.distance > 0
          //                 ? Text(
          //               Helper.getDistance(restaurant.distance, Helper.of(context).trans(setting.value.distanceUnit)),
          //               overflow: TextOverflow.fade,
          //               maxLines: 1,
          //               softWrap: false,
          //             )
          //                 : SizedBox(height: 0)
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
