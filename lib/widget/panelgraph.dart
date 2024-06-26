import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Panelgraph extends StatelessWidget {
  const Panelgraph({
    super.key,
    required this.widthsize,
  });

  final double widthsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: widthsize * 0.90,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Shadow color
              offset: Offset(0, 4), // Offset of the shadow
              blurRadius: 10, // Blur radius of the shadow
              spreadRadius: 1, // Spread radius of the shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Life Span",
                          style:
                              TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_florist_outlined,
                              color: Color(0xff9EB5F6),
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2324",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  " Days",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Spread",
                          style:
                              TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color(0xffFC729B),
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2324",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "LvL",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 15.0,
              circularStrokeCap: CircularStrokeCap.round,
              percent: 0.30,
              backgroundWidth: 9,
              backgroundColor: const Color.fromARGB(22, 0, 0, 0),
              center: const Text(
                "123\n Growth",
                textAlign: TextAlign.center,
              ),
              progressColor: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
