
import 'package:hackgame/constants/avatart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AppUser {

  final String username;
  final String alias;
  final String ip;
  final String avatar;
  final int credit;
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
    this.credit,
    this.crypto,
    this.hacks,
    this.level,
    this.reputation,
    this.contracts,
    this.attacks,
    this.joinedDate,
    this.avatar
  });
  
String get creditStr{
  if(this.credit>999999){
    return '${(credit/1000000).toStringAsPrecision(2)} M';
  }else if(this.credit>999){
    
    return '${(credit/1000).toStringAsPrecision(2)} K';
  }else{
    return credit.toString();
  }
}
String get cryptoStr{
  if(this.crypto>999999){
    return '${(credit/1000000).toStringAsPrecision(2)} M';
  }else if(this.crypto>999){
    return '${(credit/1000).toStringAsPrecision(2)} K';
  }else{
    return crypto.toString();
  }
}

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'alias': alias,
      'ip':ip,
      'credit': credit,
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
      credit: map['credit']?.toInt() ?? 0,
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
