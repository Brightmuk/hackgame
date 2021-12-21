import 'dart:math';

String randomIp(){

  Random rnd;
  int random;
  String result='';
  int min;
  int max=255;
  rnd = new Random();

  for(var i=0;i<4;i++){
    if(i==0){
     min=100;
    }else{
      min=0;
    }
    random = min + rnd.nextInt(max - min);
    result=result+'.'+random.toString();
  }

  return result.replaceFirst('.', '');

}