// import 'package:flutter/material.dart';

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("PennyWise")),
//       drawer: Drawer(
//         backgroundColor: Colors.deepPurple,
//         child: Column (
//           children: [
//             DrawerHeader(
//               child: Icon(
//                 Icons.favorite,
//                 size: 48
//               ),
//             ),

//             ListTile(
//               // ignore: prefer_const_constructors
//               leading: Icon(Icons.home),
//               // ignore: prefer_const_constructors
//               title: Text("E X P E N S E S"),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/expensespage');
//               },
//             ),
            
//             ListTile(
//               // ignore: prefer_const_constructors
//               leading: Icon(Icons.settings),
//               // ignore: prefer_const_constructors
//               title: Text("M Y  P L A N"),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/planpage');
//               },
//             ),
            
//           ]
//         )
//       )
//     );
//   }
// }


import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 1; // Initial index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress")),
      
    );
  }
}
