import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 234, 181),
      body : SingleChildScrollView(
        child: Stack(
          children: [ 
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin : const Offset(150,50),
              child: Image.asset(
              'assets/images',
              width: 200,
              ),
            ),
            Positioned(
              right: 0,
              top:200,
              child: Transform(
                 transform: Matrix4.identity()..rotateZ(20),
                origin : const Offset(180,100),
                child: Image.asset(
                'assets/images',
                width: 200,
                ),
              ),
            ),
            Column(
              children:[
                const HeaderSection(),
                const SearchSection(),
                CategorySection(),
              ],
            ),        
          ],
        ),
      ),
    );
  }
}