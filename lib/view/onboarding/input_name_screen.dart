import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/foods_view_model.dart';
import '../screens/main_wrapper.dart';

class NameInputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Let’s Get to Know You!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('What should we call you?'),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white
              ),
              child:  Center(child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  border: InputBorder.none,
                ),
              ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
              onPressed: () {
                Provider.of<FoodsViewModel>(context,listen: false).name = _controller.text;
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainWrapper(),), (route) => false,);
              },
              child: const Text('Continue',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
