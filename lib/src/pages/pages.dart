import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/elements/SearchBarWidget.dart';
import 'package:food_delivery_app/src/elements/SearchWidget.dart';
import 'package:food_delivery_app/src/pages/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../elements/DrawerWidget.dart';
import '../elements/FilterWidget.dart';
import '../helpers/helper.dart';
import '../models/route_argument.dart';
import '../pages/home.dart';
import '../pages/map.dart';
import '../pages/notifications.dart';
import '../pages/orders.dart';
import 'messages.dart';


// class PagesWidget extends StatefulWidget {
//   dynamic currentTab;
//   RouteArgument routeArgument;
//   Widget currentPage = HomeWidget();
//   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   PagesWidget({
//     Key key,
//     this.currentTab,
//   }) {
//     if (currentTab != null) {
//       if (currentTab is RouteArgument) {
//         routeArgument = currentTab;
//         currentTab = int.parse(currentTab.id);
//       }
//     } else {
//       currentTab = 2;
//     }
//   }
//
//   @override
//   _PagesWidgetState createState() {
//     return _PagesWidgetState();
//   }
// }
//
// class _PagesWidgetState extends State<PagesWidget> {
//   initState() {
//     super.initState();
//     _selectTab(widget.currentTab);
//   }
//
//   @override
//   void didUpdateWidget(PagesWidget oldWidget) {
//     _selectTab(oldWidget.currentTab);
//     super.didUpdateWidget(oldWidget);
//   }
//
//   void _selectTab(int tabItem) {
//     setState(() {
//       widget.currentTab = tabItem;
//       switch (tabItem) {
//         case 0:
//         //  widget.currentPage = NotificationsWidget(parentScaffoldKey: widget.scaffoldKey);
//           widget.currentPage = HomeWidget(parentScaffoldKey: widget.scaffoldKey);
//           break;
//         case 1:
//           widget.currentPage = MapWidget(parentScaffoldKey: widget.scaffoldKey, routeArgument: widget.routeArgument);
//           break;
//         case 2:
//          // widget.currentPage = SearchModal();
//           break;
//         case 3:
//           widget.currentPage = OrdersWidget(parentScaffoldKey: widget.scaffoldKey);
//           break;
//         case 4:
//           widget.currentPage = ProfileWidget(); //FavoritesWidget(parentScaffoldKey: widget.scaffoldKey);
//           break;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: Helper.of(context).onWillPop,
//       child: Scaffold(
//         key: widget.scaffoldKey,
//         drawer: DrawerWidget(),
//         endDrawer: FilterWidget(onFilter: (filter) {
//           Navigator.of(context).pushReplacementNamed('/Pages', arguments: widget.currentTab);
//         }),
//         body: widget.currentPage,
//         bottomNavigationBar: BottomNavigationBar(
//        //   showSelectedLabels: true,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: Theme.of(context).accentColor,
//           selectedFontSize: 0,
//           unselectedFontSize: 0,
//           iconSize: 22,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           selectedIconTheme: IconThemeData(size: 28),
//           unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
//           currentIndex: widget.currentTab,
//           onTap: (int i) {
//             this._selectTab(i);
//           },
//           // this will be set when a new tab is tapped
//           items: [
//             // PersistentBottomNavBarItem(
//             //   icon: Icon(Icons.home),
//             //   title: "Home",
//             //   activeColor: Colors.blue,
//             //   inactiveColor: Colors.grey,
//             // ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined),
//            //  title: Text("home",),
//               label: 'Home',
//            //   title: Text("home")
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.directions_run_outlined),
//             //    title: Text("home"),
//               label: 'Pickup',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search_outlined),
//           //      title: Text("home"),
//               label: 'Search',
//             ),
//             // BottomNavigationBarItem(
//             //     label: '',
//             //     icon: Container(
//             //       width: 42,
//             //       height: 42,
//             //       decoration: BoxDecoration(
//             //         color: Theme.of(context).accentColor,
//             //         borderRadius: BorderRadius.all(
//             //           Radius.circular(50),
//             //         ),
//             //         boxShadow: [
//             //           BoxShadow(color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
//             //           BoxShadow(color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
//             //         ],
//             //       ),
//             //       child: new Icon(Icons.home, color: Theme.of(context).primaryColor),
//             //     )),
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.receipt_outlined),
//             //  title: Text("home"),
//               label: 'Orders',
//             ),
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.person_pin_rounded),
//              // title: Text("home"),
//               label: 'home',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class PagesWidget extends StatefulWidget {
  dynamic currentTab;
  //final BuildContext menuScreenContext;
  Widget currentPage = HomeWidget();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  RouteArgument routeArgument;

  PagesWidget({
    Key key,
    this.currentTab,
  }) {
    if (currentTab != null) {
      if (currentTab is RouteArgument) {
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    } else {
      currentTab = 0;
    }
  }

  //PagesWidget({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _PagesWidgetState createState() => _PagesWidgetState();
}

class _PagesWidgetState extends State<PagesWidget> {
  PersistentTabController _controller;
  bool _hideNavBar;
  
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
   widget.currentPage= HomeWidget(parentScaffoldKey: widget.scaffoldKey),
    widget.currentPage=  MapWidget(parentScaffoldKey: widget.scaffoldKey, routeArgument: widget.routeArgument),
    widget.currentPage=  SearchBarWidget(),
    widget.currentPage=  OrdersWidget(parentScaffoldKey: widget.scaffoldKey),
    widget.currentPage=  ProfileWidget()
      // MainScreen(
      //   menuScreenContext: widget.menuScreenContext,
      //   hideStatus: _hideNavBar,
      //   onScreenHideButtonPressed: () {
      //     setState(() {
      //       _hideNavBar = !_hideNavBar;
      //     });
      //   },
      // ),
      // MainScreen(
      //   menuScreenContext: widget.menuScreenContext,
      //   hideStatus: _hideNavBar,
      //   onScreenHideButtonPressed: () {
      //     setState(() {
      //       _hideNavBar = !_hideNavBar;
      //     });
      //   },
      // ),
      // MainScreen(
      //   menuScreenContext: widget.menuScreenContext,
      //   hideStatus: _hideNavBar,
      //   onScreenHideButtonPressed: () {
      //     setState(() {
      //       _hideNavBar = !_hideNavBar;
      //     });
      //   },
      // ),
      // MainScreen(
      //   menuScreenContext: widget.menuScreenContext,
      //   hideStatus: _hideNavBar,
      //   onScreenHideButtonPressed: () {
      //     setState(() {
      //       _hideNavBar = !_hideNavBar;
      //     });
      //   },
      // ),
      // MainScreen(
      //   menuScreenContext: widget.menuScreenContext,
      //   hideStatus: _hideNavBar,
      //   onScreenHideButtonPressed: () {
      //     setState(() {
      //       _hideNavBar = !_hideNavBar;
      //     });
      //   },
      // ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.directions_run_outlined),
        title: ("Pickup"),
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
       // activeColor: Colors.teal,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_outlined),
        title: ("Search"),
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
     //   activeColor: Colors.blueAccent,
      //  inactiveColor: Colors.grey,
      //  activeContentColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.receipt_outlined),
        title: ("Orders"),
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
       // activeColor: Colors.deepOrange,
      //  inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle_outlined),
        title: ("Account"),
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
      //  activeColor: Colors.indigo,
      //  inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
        key: widget.scaffoldKey,
        //appBar: AppBar(title: const Text('Navigation Bar Demo')),
        drawer: DrawerWidget(),
        endDrawer: FilterWidget(onFilter: (filter) {
          Navigator.of(context).pushReplacementNamed('/Pages');
         // Navigator.of(context).pushReplacementNamed('/Pages', arguments: widget.currentTab);
        }),
        body: PersistentTabView(
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          hideNavigationBar: _hideNavBar,
          //margin: EdgeInsets.all(10.0),
          popActionScreens: PopActionScreensType.once,
          bottomScreenMargin: 0.0,
          // onWillPop: () async {
          //   await showDialog(
          //     context: context,
          //     useSafeArea: true,
          //     builder: (context) => Container(
          //       height: 50.0,
          //       width: 50.0,
          //       color: Colors.white,
          //       child: RaisedButton(
          //         child: Text("Close"),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   );
          //   return false;
          // },
          decoration: NavBarDecoration(
              colorBehindNavBar: Colors.indigo,
              borderRadius: BorderRadius.circular(20.0)),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
