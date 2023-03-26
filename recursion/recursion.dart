void main() {
int num=5;
  var factorial=fact(num);
  print('factorial is ${factorial}');
}

int fact(int num){
  if(num<=1){
    return 1;
  }else{
    return num*fact(num-1);
  }
}