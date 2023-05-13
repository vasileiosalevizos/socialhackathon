import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'details.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  List eventName = ["Event Name", "Event Name", "Event Name", "Event Name"];
  List description = [
    "Short Description",
    "Short Description",
    "Short Description",
    "Short Description"
  ];
  List image = [
    "https://sustainabletravel.org/wp-content/uploads/Blog-Image-Planting-Tree-Seedling.jpg",
    "https://previews.123rf.com/images/opolja/opolja1907/opolja190700427/127920348-group-of-young-people-playing-with-ball-at-the-beach-young-friends-enjoying-summer-holidays-on-a.jpg",
    "https://www.openaccessgovernment.org/wp-content/uploads/2018/11/dreamstime_s_74844293.jpg",
    "https://img.freepik.com/free-vector/protecting-environment-concept-illustration_114360-11985.jpg?w=2000"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Username1233",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text("Random Text"),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 1, // width ÷ height
                    valueNotifier: _valueNotifier,
                    progress: 39,
                    startAngle: 265,
                    sweepAngle: 190,
                    foregroundColor: Color.fromARGB(255, 140, 226, 64),
                    backgroundColor: const Color(0xffeeeeee),
                    foregroundStrokeWidth: 35,
                    backgroundStrokeWidth: 35,
                    animation: true,
                    corners: StrokeCap.square,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50.0),
                          child: Center(
                            child: ValueListenableBuilder(
                                valueListenable: _valueNotifier,
                                builder: (_, double value, __) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 100,
                                              ),
                                              Text(
                                                '0',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Container(
                                              height: 200,
                                              child: Image(
                                                  image: NetworkImage(
                                                      "https://www.pngmart.com/files/21/Aesthetic-Plant-Transparent-PNG.png")),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 100,
                                              ),
                                              Text(
                                                '${value.toInt()}%',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Badges",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset(
                        "assets/svg/4.svg",
                        // color: Theme.of(context).primaryColor,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset(
                        "assets/svg/5.svg",
                        // color: Theme.of(context).primaryColor,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset(
                        "assets/svg/6.svg",
                        // color: Theme.of(context).primaryColor,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SvgPicture.asset(
                        "assets/svg/2.svg",
                        // color: Theme.of(context).primaryColor,
                        height: 40,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svg/1.svg",
                      // color: Theme.of(context).primaryColor,
                      height: 40,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My EcoVotes",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    padding: const EdgeInsets.only(left: 3.0),
                    itemCount: eventName.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                      eventName: eventName[index],
                                      description: description[index],
                                      image: image[index])));
                        },
                        child: Container(
                          height: 260,
                          width: 140,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Image(
                                          image: NetworkImage(
                                        image[index],
                                      )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.group_work_rounded,
                                              color: Colors.green,
                                            ),
                                            Icon(
                                              Icons.person_2_rounded,
                                              color: Colors.orange,
                                            ),
                                            Text("73"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, bottom: 2),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              eventName[index],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(description[index])),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
