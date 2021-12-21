import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/constants/avatart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {

  final String username;
  final String alias;
  final String ip;
  final String avatar;
  final int money;
  final int crypto;
  final int hacks;
  final int level;
  final int reputation;
  final int contracts;
  final int attacks;
  final Timestamp joinedDate;

  AppUser({
    this.username,
    this.alias,
    this.ip,
    this.money,
    this.crypto,
    this.hacks,
    this.level,
    this.reputation,
    this.contracts,
    this.attacks,
    this.joinedDate,
    this.avatar
  });
  


  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'alias': alias,
      'ip':ip,
      'money': money,
      'crypto': crypto,
      'hacks': hacks,
      'level': level,
      'reputation': reputation,
      'contracts': contracts,
      'avatarUrl':avatar,
      'attacks': attacks,
      'joinedDate': joinedDate.millisecondsSinceEpoch,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(

      username: map['username'] ?? '',
      ip:map['ip']??'192.0.0.0',
      avatar: map['avatar']??'assets/images/avatars/'+avatars[0],
      alias: map['alias'] ?? '',
      money: map['money']?.toInt() ?? 0,
      crypto: map['crypto']?.toInt() ?? 0,
      hacks: map['hacks']?.toInt() ?? 0,
      level: map['level']?.toInt() ?? 0,
      reputation: map['reputation']?.toInt() ?? 0,
      contracts: map['contracts']?.toInt() ?? 0,
      attacks: map['attacks']?.toInt() ?? 0,
      joinedDate: map['joinedDate']??null,
    );
  }

}
