import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blood_buddy_nv/constants.dart';
import 'package:blood_buddy_nv/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: .4,

                // colorFilter: new ColorFilter.mode(Colors.red.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/icons/bg.jpg'),fit: BoxFit.fill,  ),

            ),),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),

              if(_qnController.numOfCorrectAns !=_qnController.questions.length )
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "You don't seem completely suitable for donating blood, you can talk to a doctor about this.",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: kSecondaryColor),
                    ),
                  ),
                ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
