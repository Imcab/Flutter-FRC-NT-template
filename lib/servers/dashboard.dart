import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:nt4/nt4.dart';

class Dashboard {
  //IP kDebugMode ? '127.0.0.1' : '10.34.72.2';
  static const String _robotAddress = kDebugMode ? '127.0.0.1' : '10.34.72.2';

  late NT4Client _client;
  late NT4Topic _topic;
  late NT4Subscription _sub;

  bool _connected = false;

  Dashboard() {
    _client = NT4Client(
      serverBaseAddress: _robotAddress,
      onConnect: () {
        Future.delayed(const Duration(milliseconds: 200), () => _sendAll());
        _connected = true;
      },
      onDisconnect: () => _connected = false,
    );

    //example

    _topic = _client.publishNewTopic('a', NT4TypeStr.typeFloat64);

    //Example
    _sub = _client.subscribePeriodic(
      '/Syncro/commandList',
      1.0,
    );

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_connected) {
        _sendAll();
      }
    });
  }

  Stream<bool> connectionStatus() {
    return _client.connectionStatusStream().asBroadcastStream();
  }

  void _sendAll() {
    //Updates
  }
}
