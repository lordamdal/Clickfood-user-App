
import 'package:food_delivery_app/src/helpers/custom_trace.dart';

class MonetBill {
  String number;
  String amount;
 // String RefId;
  String Status;
  String message;
  String paymentId;
  String Ussd;
  String ChannelName;
  String channel;

  MonetBill();

  MonetBill.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      Status = jsonMap['status'] != null ? jsonMap['status'] : '';
      message = jsonMap['message'] != null ? jsonMap['message'] : '';
      Ussd = jsonMap['channel_ussd'] != null ? jsonMap['channel_ussd'] : '';
      ChannelName= jsonMap['channel_name'] != null ? jsonMap['channel_name'] : '';
      channel= jsonMap['channel'] != null ? jsonMap['channel'] : '';
      paymentId = jsonMap['paymentId'] != null ? jsonMap['paymentId'] : '';

    } catch (e) {
      Status = '';
      message = '';
      Ussd = '';
      ChannelName= '';
      channel = '';
      paymentId = '';
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["service"] = "6GxvpRXZSYpF21L37Go0Jr4q4eohkxK5";
    map["phonenumber"] = number;
    map["amount"] = amount;
    map["notify_url"] = "https://clickfood.cm/public/login";
 //   map["payment_ref"] = RefId;
    return map;
  }

  Map toCheck() {
    var map = new Map<String, dynamic>();
    map["paymentId"] = paymentId;

    //   map["payment_ref"] = RefId;
    return map;
  }

}