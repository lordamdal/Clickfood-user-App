import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/controllers/cart_controller.dart';
import 'package:food_delivery_app/src/elements/MonetbilDialog.dart';
import 'package:food_delivery_app/src/models/MonetBill.dart';

import '../../generated/l10n.dart';
import '../elements/PaymentSettingsDialog.dart';
import '../helpers/helper.dart';
import '../models/credit_card.dart';

// ignore: must_be_immutable
class MonetBilWidget extends StatelessWidget {
  MonetBill monetBill;
  CartController con;
  ValueChanged<MonetBill> onChanged;

  MonetBilWidget({
    this.monetBill,
    this.onChanged,
    this.con,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          width: 259,
          height: 165,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          width: 275,
          height: 177,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 25),
          width: 300,
          height:  monetBill.ChannelName !=null ? 231 : 196,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/img/monetbil.png',
                      height: 22,
                      width: 70,
                    ),
            monetBill.paymentId==null ?
                   ButtonTheme(
                      padding: EdgeInsets.all(0),
                      minWidth: 50.0,
                      height: 10.0,
                      child:   MonetbilDialog(
                        monetBill: monetBill,
                        onChanged: () {
                          onChanged(monetBill);
                          //setState(() {});
                        },
                      ),
                    ) : SizedBox()
                  ],
                ),
                monetBill.paymentId!=null ? SizedBox(height: 10) : SizedBox(),
                Text(
                  S.of(context).mobile_number,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  monetBill.number!=null ? monetBill.number : '',
                  style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(letterSpacing: 1.4)),
                ),
                SizedBox(height: 10),
                monetBill.ChannelName !=null ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).payment_id,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 3),
                    Text(
                      monetBill.paymentId,
                      style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(letterSpacing: 1.4)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      monetBill.ChannelName,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Dial ${monetBill.Ussd}",
                      style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(letterSpacing: 1.4)),
                    ),
                  ],
                ) : SizedBox() ,
                // monetBill.ChannelName !=null ?
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Text(
                //       monetBill.paymentId,
                //       style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(letterSpacing: 1.4)),
                //     ),
                //     // Text(
                //     //   "Dial ${monetBill.Ussd}",
                //     //   style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(letterSpacing: 1.4)),
                //     // ),
                //   ],
                // ) : SizedBox(),
                // monetBill.ChannelName !=null ?
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Text(
                //       "Dial ${monetBill.Ussd}",
                //       style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(letterSpacing: 1.4)),
                //     ),
                //   ],
                // ) : SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
