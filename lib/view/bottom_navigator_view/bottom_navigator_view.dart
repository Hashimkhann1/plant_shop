
import 'package:flutter/cupertino.dart';
import '../../utils/view.dart';

class BottomNavigatorView extends StatefulWidget {
  const BottomNavigatorView({super.key});

  @override
  State<BottomNavigatorView> createState() => _BottomNavigatorViewState();
}

class _BottomNavigatorViewState extends State<BottomNavigatorView> {

   List allViews = [
   const HomeView(),
    const FavouriteItemView(),
    const NotificationView(),
     ProfileView(),
  ];

   int selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allViews[selectedViewIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            ),
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedViewIndex,
              onTap: (index) {
                setState(() {
                  selectedViewIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.greyColor,
              items: [
                BottomNavigationBarItem(icon: Icon(selectedViewIndex == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house),label: ''),
                BottomNavigationBarItem(icon: Icon(selectedViewIndex == 1 ? CupertinoIcons.heart_fill : CupertinoIcons.heart,),label: ''),
                BottomNavigationBarItem(icon: Icon(selectedViewIndex == 2 ? CupertinoIcons.bell_fill : CupertinoIcons.bell,),label: ''),
                BottomNavigationBarItem(icon: Icon(selectedViewIndex == 3 ? CupertinoIcons.person_circle_fill : CupertinoIcons.profile_circled,),label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
