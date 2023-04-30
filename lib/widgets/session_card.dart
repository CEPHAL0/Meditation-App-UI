import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';

class SessionCard extends StatefulWidget {
  final int sessionNum;
  final bool isDone;
  const SessionCard({
    required this.sessionNum,
    this.isDone = false,
    super.key,
  });

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  bool _isDone = false;
  bool _isPlaying = false;
  late double _progressValue = 0.0;
  final int _duration = 600;
  @override
  void initState() {
    super.initState();
    _isDone = widget.isDone;
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_progressValue >= 1.0) {
          _isDone = true;
          _isPlaying = false;
          timer.cancel();
        } else {
          _progressValue += 1 / _duration;
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPlaying = false;
    });
  }

  void _resetTimer() {
    setState(() {
      _isPlaying = false;
      _progressValue = 0.0;
    });
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: constraint.maxWidth / 2 - 10,
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              )
            ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isDone = !_isDone;
                    _resetTimer();
                    _isPlaying != _isPlaying;
                  });
                  if (_isPlaying) {
                    _startTimer();
                  } else {
                    _pauseTimer();
                  }
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              color: _isDone ? kBlueColor : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: kBlueColor)),
                          child: Icon(
                            _isDone
                                ? Icons.pause
                                : _isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                            color: _isDone ? Colors.white : kBlueColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Session ${widget.sessionNum}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ]),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade300,
                      ),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 10),
                        curve: Curves.linear,
                        width: _isDone ? constraint.maxWidth - 50 : 0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade400),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
