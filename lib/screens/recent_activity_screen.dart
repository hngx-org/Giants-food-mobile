import 'package:flutter/material.dart';

import 'dart:ui';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 110.4 * fem, 31 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 92 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Icon(Icons.chevron_left_outlined),
                    ),
                  ),
                  Text(
                    'Recent activity',
                    style: TextStyle(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.75 * ffem / fem,
                      color: Color(0xff150d57),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(52 * fem, 0 * fem, 53.4 * fem, 49 * fem),
              width: double.infinity,
              height: 28 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 26 * fem, 0 * fem),
                    width: 111 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff150d57),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Launch received',
                        style: TextStyle(
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 2.3333333333 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // launchgivenfyq (469:8403)
                    width: 93 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffb5b5b5)),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Launch given',
                        style: TextStyle(
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 2.3333333333 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.18 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 28 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 28 * fem),
                          width: double.infinity,
                          height: 125 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 45 * fem, 0 * fem),
                                width: 210.22 * fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 7 * fem, 0 * fem),
                                            child: Text(
                                              'You got 2 free lunches',
                                              style: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.75 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30.22 * fem,
                                            height: 24 * fem,
                                            child: Image.asset(
                                              'images/group-16-79Z.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 195 * fem,
                                      ),
                                      child: Text(
                                        'You received a free lunch for your outstanding contribution, thank you for your hard work',
                                        style: TextStyle(
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 2.3333333333 * ffem / fem,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From Lucy',
                                      style: TextStyle(
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 2.3333333333 * ffem / fem,
                                        color: Color(0xff150d57),
                                      ),
                                    ),
                                    Text(
                                      'Today, 02:19 pm',
                                      style: TextStyle(
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 2.8 * ffem / fem,
                                        color: Color(0xff8a8a8a),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 3 * fem, 0 * fem),
                          width: double.infinity,
                          height: 125 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 45 * fem, 0 * fem),
                                width: 208.22 * fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 7 * fem, 0 * fem),
                                            child: Text(
                                              'You got 1 free lunches',
                                              style: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.75 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30.22 * fem,
                                            height: 24 * fem,
                                            child: Image.asset(
                                              'assets/images/group-16-79Z.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 195 * fem,
                                      ),
                                      child: Text(
                                        'You received a free lunch for your outstanding contribution, thank you for your hard work',
                                        style: TextStyle(
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 2.3333333333 * ffem / fem,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From Lucy',
                                      style: TextStyle(
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 2.3333333333 * ffem / fem,
                                        color: Color(0xff150d57),
                                      ),
                                    ),
                                    Text(
                                      'Today, 02:19 pm',
                                      style: TextStyle(
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 2.8 * ffem / fem,
                                        color: Color(0xff8a8a8a),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 125 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 45 * fem, 0 * fem),
                          width: 211.22 * fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 13 * fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 7 * fem, 0 * fem),
                                      child: Text(
                                        'You got 3 free lunches',
                                        style: TextStyle(
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.75 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30.22 * fem,
                                      height: 24 * fem,
                                      child: Image.asset(
                                        'images/group-16-79Z.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 195 * fem,
                                ),
                                child: Text(
                                  'You received a free lunch for your outstanding contribution, thank you for your hard work',
                                  style: TextStyle(
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 2.3333333333 * ffem / fem,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From Lucy',
                                style: TextStyle(
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 2.3333333333 * ffem / fem,
                                  color: Color(0xff150d57),
                                ),
                              ),
                              Text(
                                'Today, 02:19 pm',
                                style: TextStyle(
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 2.8 * ffem / fem,
                                  color: Color(0xff8a8a8a),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
