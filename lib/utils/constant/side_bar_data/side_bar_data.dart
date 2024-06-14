

import 'package:flutter/cupertino.dart';
import 'package:plant_shop/utils/routes/routes_name.dart';

class SideBarData {

  final data = [
    {'title':'Home','icon':CupertinoIcons.house , 'fillIcon' : CupertinoIcons.house_fill , 'routesName' : RoutesName.homeView},
    {'title':'Favourite','icon':CupertinoIcons.heart,'fillIcon' : CupertinoIcons.heart_fill, 'routesName' : RoutesName.favouriteView},
    {'title':'Notification','icon':CupertinoIcons.bell,'fillIcon' : CupertinoIcons.bell_fill, 'routesName' : RoutesName.notificationView},
    {'title':'Add Item','icon':CupertinoIcons.add,'fillIcon' : CupertinoIcons.add_circled_solid, 'routesName' : RoutesName.addItemview},
    {'title':'Profile','icon':CupertinoIcons.person_circle,'fillIcon' : CupertinoIcons.person_circle_fill, 'routesName' : RoutesName.profileView}
  ];

}