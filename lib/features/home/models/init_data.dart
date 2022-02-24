import 'package:ton_place/core/models/models.dart';

class InitData {
  InitData({
    this.user,
    this.newDialogs,
    this.hasNotify,
    this.hasSubscription,
    this.topUpAddress,
    this.subscriptionPrice,
    this.decryptKey,
    this.balance,
  });

  final User? user;
  final int? newDialogs;
  final bool? hasNotify;
  final bool? hasSubscription;
  final String? topUpAddress;
  final int? subscriptionPrice;
  final String? decryptKey;
  final double? balance;

  factory InitData.fromJson(Map<String, dynamic> json) => InitData(
    user: json['user'] == null ? null : User.fromJson(json['user']),
    newDialogs: json['newDialogs'],
    hasNotify: json['hasNotify'],
    hasSubscription: json['hasSubscription'],
    topUpAddress: json['topUpAddress'],
    subscriptionPrice: json['subscriptionPrice'],
    decryptKey: json['decryptKey'],
    balance: json['balance'] == null ? null : json['balance']!.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'user': user == null ? null : user!.toJson(),
    'newDialogs': newDialogs,
    'hasNotify': hasNotify,
    'hasSubscription': hasSubscription,
    'topUpAddress': topUpAddress,
    'subscriptionPrice': subscriptionPrice,
    'decryptKey': decryptKey,
    'balance': balance,
  };
}
