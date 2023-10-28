class Onboarding {
  final String image;
  final String title;
  final String description;

  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Onboarding> onBoardingContent = [
  Onboarding(
      image: 'assets/images/Onboarding1.png',
      title: 'Connect with\nyour friends',
      description:
          'Chat mobile app with video and audio calling\nOptions, Stay connected with your friends '),
  Onboarding(
      image: 'assets/images/Onboarding2.png',
      title: 'Chat lock for the\nmost personal chat',
      description:
          'Making your most intimate conversations even more\nprivate with a layer of security'),
  Onboarding(
      image: 'assets/images/Onboarding3.png',
      title: 'Send and receive\nmoney from chat',
      description:
          'Simple setup for fast transfers in conversation and\nmake everything in one place'),
  Onboarding(
      image: 'assets/images/Onboarding4.png',
      title: 'Lets get\nStarted',
      description: 'Create your own world of communication.'),
];
