class UnboardingContent{
  String image ;
  String title;
  String desc;
  UnboardingContent({required this.desc ,required this.image, required this.title});
}
List<UnboardingContent> contents = [
  UnboardingContent(
      desc: 'Pick Your Food from our menu\n   More than 35 times.',
      image: 'images/screen1.png',
      title: 'Select from Our\n  Best Menu .'),

  UnboardingContent(
      desc: 'You can pay Cash on delivery and\n Card payment is Available.  ',
      image: 'images/screen2.png',
      title: 'Easy and Online Payment.'),

  UnboardingContent(
      desc: 'Deliver your food at your\n Doorsteps.',
      image: 'images/screen3.png',
      title: 'Quick Delivery at your Doorstep.'),
];