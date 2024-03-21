/*
body: Column(
 children: [
  SizedBox( // 공간을 만드는 child >> height 또는 width 필요로함
   height: 80,
  ), // SizedBox
  Row( // Alignment(정렬)을 가지고 있음
   mainAxisAlignment: MainAxisAlignment.end, // 글자가 수평방향 기준 (오른쪽)끝으로 감
   children: [
    Column(
     children: [
      Text('Hey, Selena',
       style: Textstyle(
        color: colors.white,
        frontSize: 38,
        frontWeight: FrontWeight.w600,
       ), // Textstyle
      ), // Text
     Text('Welcome back',
      style: Textstyle(
        color: colors.white,
       ), // Textstyle
      ), // Text
     ),
    ],
   ) // Column
  ], // children
 ) // Row
*/