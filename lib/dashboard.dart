import 'package:flutter/material.dart';
import 'package:stylejunction/category.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    /*required this.email*/
  });
  //final String email;

  @override
  State<Dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Fashioncategory(
                  //email: widget.email,
                  )));
    }
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 126, 166),
          elevation: 0,
          title: Row(
            children: [
              Icon(
                Icons.camera_indoor,
                size: 50,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Muskan Kumari',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
        body: Center(
          child: Text('Welcome to the app!'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 247, 126, 166),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 212, 57, 145),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
