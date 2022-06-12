import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:blood_buddy_nv/constants.dart';
import 'package:blood_buddy_nv/screens/quiz/quiz_screen.dart';

import '../donor_drawet.dart';


class TestStartingScreen extends StatelessWidget {
  TestStartingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DonorDrawer(),
      appBar: AppBar(backgroundColor: Colors.black38,),
      body: Stack(
        children: [
        Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(

        opacity:0.5,
        image: AssetImage('assets/icons/bg.jpg'),fit: BoxFit.fill, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),
            BlendMode.dstATop), ),

    ),),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Blood Donation Eligibility Test",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                  Text("A small preliminary test on whether it is suitable for donating blood for you, of course, other necessary procedures will be completed in the hospital. This is a test to speed up the process and keep you informed."),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(() =>QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start ",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
