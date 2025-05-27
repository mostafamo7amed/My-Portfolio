import '../constants/app_assets.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skills_model.dart';
import '../models/social_model.dart';
import '../models/user_model.dart';

final UserModel myData = UserModel(
  name: 'Mostafa Mohamed',
  email: 'moustafamohmed203@gmail.com',
  cvLink:
      'https://drive.google.com/file/d/12wOswdJ38E5K1J7oVYhqB0D-AHJDIKya/view?usp=drive_link',
  logo: AppImages.logo,
  photo:
      'https://res.cloudinary.com/dhub8xdyb/image/upload/v1747325399/WhatsApp_Image_2025-05-15_at_17.27.45_9aeaa61f-removebg-preview_g9ourr.png',
  profile:
      'https://res.cloudinary.com/dhub8xdyb/image/upload/v1747325399/WhatsApp_Image_2025-05-15_at_17.27.45_9aeaa61f-removebg-preview_g9ourr.png',
  socialLinks: socialIcons,
  about:
      'Mobile developer with over two years of experience designing, developing, testing, and maintaining mobile applications. Committed to delivering high-quality, user-centric solutions and continuously enhancing technical skills. Looking for a position within a dynamic organization that offers opportunities for professional growth and development.',
  profileSummary:
      'Mobile developer with over two years of experience designing, developing, testing, and maintaining mobile applications. Committed to delivering high-quality, user-centric solutions and continuously enhancing technical skills. Looking for a position within a dynamic organization that offers opportunities for professional growth and development.',
  country: 'Egypt',
  skills: skills,
  experiences: experiences,
  projects: projects,
);

List<SkillsModel> skills = [
  SkillsModel(
    title: 'Flutter',
    image: 'assets/icons/flutter.svg',
  ),
  SkillsModel(
    title: 'Dart',
    image: 'assets/icons/dart.svg',
  ),
  SkillsModel(
    title: 'Firebase',
    image: 'assets/icons/firebase.svg',
  ),
  SkillsModel(
    title: 'Bloc',
    image: 'assets/icons/bloc.svg',
  ),
  SkillsModel(
    title: 'GetX',
    image: 'assets/icons/getx.svg',
  ),
  SkillsModel(
    title: 'RestFul API',
    image: 'assets/icons/api.svg',
  ),
  SkillsModel(
    title: 'Android',
    image: 'assets/icons/android.svg',
  ),
  SkillsModel(
    title: 'Java',
    image: 'assets/icons/java.svg',
  ),
  SkillsModel(
    title: 'Git',
    image: 'assets/icons/git.svg',
  ),
  SkillsModel(
    title: 'GitHub',
    image: 'assets/icons/github.svg',
  ),
  SkillsModel(
    title: 'GitLab',
    image: 'assets/icons/gitlab.svg',
  ),
  SkillsModel(
    title: 'Android Studio',
    image: 'assets/icons/android_studio.svg',
  ),
  SkillsModel(
    title: 'VS Code',
    image: 'assets/icons/vs_code.svg',
  ),
  SkillsModel(
    title: 'Google Play Console',
    image: 'assets/icons/google_play_console.svg',
  ),
  SkillsModel(
    title: 'SQLite',
    image: 'assets/icons/sqlite.svg',
  ),
  SkillsModel(
    title: 'Postman',
    image: 'assets/icons/postman.svg',
  ),
  SkillsModel(
    title: 'Figma',
    image: 'assets/icons/figma.svg',
  ),
  SkillsModel(
    title: 'Draw io',
    image: 'assets/icons/drawio.svg',
  ),
  SkillsModel(
    title: 'Canva',
    image: 'assets/icons/canva.svg',
  ),

];

List<SocialIModel> socialIcons = [
  SocialIModel(
    icon: AppIcons.githubIcon,
    link: 'https://github.com/mostafamo7amed',
  ),
  SocialIModel(
    icon: AppIcons.linkedinIcon,
    link: 'https://www.linkedin.com/in/moustafamohamed203/',
  ),
  /*SocialIModel(
    icon: AppIcons.emailIcon,
    link: 'moustafamohmed203@gmail',
  ),*/
  SocialIModel(
    icon: AppIcons.whatsappIcon,
    link: 'https://wa.me/201159088197',
  ),
  SocialIModel(
    icon: AppIcons.facebookIcon,
    link: 'https://www.facebook.com/profile.php?id=100029091069673',
  ),
];

List<ProjectModel> projects = [
  ProjectModel(
      title: 'Mubin | مُبِين',
      description:
          '"Mubin" is a smart application designed to facilitate the memorization of the Holy Quran by connecting students with qualified Quran teachers through flexible and easy-to-schedule one-on-one sessions. The app allows users to browse a list of available sheikhs, read their reviews, and choose the most suitable teacher based on their preferences. Students can book sessions at times that fit their schedule and also engage in text-based chats with their chosen sheikh for further interaction and clarification.\n\nOn the other hand, the app provides a valuable opportunity for sheikhs to join a leading educational platform where they can manage their availability, interact directly with students, and build their reputation through positive feedback and increased engagement. With its user-friendly interface and smooth experience, Mubin offers an ideal environment for Quran memorization anytime and anywhere.',
      image: 'assets/images/mobeen_ui.png',
      link:
          'https://play.google.com/store/apps/details?id=com.mrperfection.mubin',
      tags: [
        'Flutter',
        'Dart',
        'Bloc',
        'Firebase',
        'Git',
        'RestFul API',
        'Shared pref',
      ],
      demoLink:
          'https://drive.google.com/file/d/19KCWrvoGwDh9NHg-v0aBNCc4hGXa8WEI/view?usp=drive_link'),
  ProjectModel(
      title: 'Madar | مدار',
      description:
          'Madar Bank is a smart recycling application that encourages users to dispose of waste responsibly in exchange for points. These points can be redeemed for products, discounts, or other rewards, turning waste into valuable resources while promoting sustainability.',
      image: 'assets/images/madar_ui.png',
      link:
          'https://play.google.com/store/apps/details?id=com.mrperfection.madar',
      tags: [
        'Flutter',
        'Dart',
        'Bloc',
        'Firebase',
        'Git',
        'RestFul API',
        'Shared pref',
      ],
      demoLink: ''),
  ProjectModel(
      title: 'Formado',
      description:
          'Stay fit and healthy with a comprehensive fitness app! Whether you are working out at the gym or at your home, this app offers free videos to guide you through the right training techniques. Our app also offers customized fitness training services for a fee, tailored to suit players\' goals and lifestyles.\n\nIt also provides expert guidance to properly nourish the body and achieve fitness goals. In addition, it keeps the body hydrated with built-in water intake reminders and awareness tips.',
      image: 'assets/images/formado_ui.png',
      link:
          'https://play.google.com/store/apps/details?id=com.mrperfection.formado',
      tags: [
        'Flutter',
        'Dart',
        'Bloc',
        'Firebase',
        'Git',
        'Push Notification',
        'RestFul API',
        'Shared pref',
      ],
      demoLink: 'https://www.youtube.com/watch?v=OV1gvrVBA7Y'),
  ProjectModel(
      title: 'Smart Sugar',
      description:
          'A mobile app designed to support individuals dealing with diabetes challenges by integrating multiple functionalities into a user-friendly mobile application, offering real-time glucose tracking, detailed medical records, medication reminders, personalized diet and lifestyle recommendations, and emergency assistance. By leveraging advanced technologies such as OpenAI’s GPT models for AI-powered chat support, the platform provides users a personalized experience for helping them stay on top of their health goals.',
      image: 'assets/images/smart_sugar_ui.png',
      link: '',
      tags: [
        'Flutter',
        'Dart',
        'Firebase',
        'Bloc',
        'Python',
        'Google Colab',
        'Google Maps',
        'Local Notification',
        'OpenAI GPT',
        'RestFul API',
        'Shared pref',
        'UI/UX',
        'Git',
      ],
      demoLink:
          'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747604594/video_2025-05-19_00-40-14_jolmvu.mp4'),
  ProjectModel(
    title: 'Asmaak | أَسْمَعُك ',
    description:
        'A mobile application designed to teach Arabic sign language to children. The application includes a variety of engaging features such as video lessons and quizzes, all designed to make learning fun and effective. This application serves as a culturally relevant tool that facilitates access to educational content for Arabic-speaking children. ',
    image: 'assets/images/assmak_ui.png',
    link: 'https://github.com/mostafamo7amed/Asmaak-',
    tags: [
      'Flutter',
      'Dart',
      'Firebase',
      'Bloc',
      'Push Notification',
      'Shared pref',
      'Git',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747745133/video_2025-05-20_15-44-08_z9v9dl.mp4',
  ),
  ProjectModel(
    title: 'Bill Hub',
    description:
        'Bill Hub, a user-friendly e-commerce mobile application designed to simplify the online buying and selling experience. The app enables customers to effortlessly browse products, place orders, and complete payments, while providing sellers with tools to manage listings, track sales, and securely receive payments. A key feature of Bill Hub is its automated invoice generation system, which creates detailed, shareable invoices between buyers and sellers to streamline and facilitate the payment process. The app ensures smooth transactions and enhances transparency, making it a practical solution for both consumers and merchants.',
    image: 'assets/images/bill_hub.png',
    link: 'https://github.com/mostafamo7amed/Bill-hub',
    tags: [
      'Flutter',
      'Dart',
      'Firebase',
      'Bloc',
      'PDF generator',
      'PDF viewer',
      'Shared pref',
      'Git',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747742980/video_2025-05-20_15-05-47_xsjokm.mp4',
  ),
  ProjectModel(
    title: 'Mind Space',
    description:
        'A mobile application was developed for a psychological clinic to facilitate patient case follow-ups and improve the quality of care. The app allows doctors and specialists to monitor patients’ progress, schedule appointments, and maintain case histories in a structured and secure manner. Integrated Cloud Firebase for real-time database management and Firebase Storage to securely store user data, including personal information, medical records, and session notes. The system ensures seamless synchronization between users and provides a reliable platform for continuous communication and documentation.',
    image: 'assets/images/mind_space.png',
    link: 'https://github.com/mostafamo7amed/Mind-Space',
    tags: [
      'Flutter',
      'Dart',
      'Firebase',
      'Bloc',
      'Shared pref',
      'Git',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747743034/video_2025-05-20_15-05-40_urjau5.mp4',
  ),
  ProjectModel(
    title: 'HiParking | Graduation Project',
    description:
        'HiParking is an innovative mobile application designed to assist drivers in finding suitable parking spaces and managing on-road issues with ease. Recognizing that drivers often struggle to locate permitted parking spots in unfamiliar areas, HiParking provides real-time guidance to the nearest authorized parking locations based on user preferences and location.\n\nBeyond parking, HiParking offers roadside assistance features to enhance driver safety and convenience. Users can report vehicle malfunctions and choose to either visit a nearby mechanic or request a mechanic to come directly to them for more serious issues. Additionally, the app includes an emergency help feature, allowing users to quickly seek assistance in urgent situations.\n\nHiParking combines navigation, maintenance support, and emergency services in one seamless platform, making it an essential tool for modern drivers.',
    image: 'assets/images/hiparking_ui.png',
    link: 'https://github.com/walidsalah19/hiparking',
    tags: [
      'Android native',
      'Java',
      'Xml',
      'Arduino',
      'Leds',
      'Gps',
      'Git',
      'Flutter web',
      'Google map',
      'Firebase',
      'FCM',
      'Realtime database',
      'Ultra sonic sensor',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747766036/Hiparking_Team_yaqdfs.mp4',
  ),
];

List<ExperienceModel> experiences = [
  ExperienceModel(
    title:
        'Center of Nanoelectronics and Devices (CND), The American University in Cairo (AUC) | Flutter Internship',
    description:
        '• The internship focused on projects in the tech industry, reporting, and enhancement of digital skills for MSME support in Egypt.\n• Working on a waste recycling project for the ios and Android platforms.',
    image: AppImages.auc,
    type: 'Full Time',
    duration: 'Mar 2025 - Present',
  ),
  ExperienceModel(
    title: 'Mobile Application Developer',
    description:
        '• Worked on building mobile app modules using Flutter.\n• Translate UI/UX designs with responsive screens.\n• Developing and testing an application for memorising the Holy Quran (Mubin).\n• Developing a gym application (Formado) for the ios and Android platforms.\n• Designing an application for real estate.',
    image: AppImages.prefection,
    type: 'Full Time',
    duration: 'Sep 2024 - Mar 2025',
  ),
  ExperienceModel(
    title: 'Flutter Developer',
    description:
        '• Debugging and resolving technical issues.Debugging and resolving technical issues.\n• Troubleshoot and resolve technical issues to ensure the application is error-free.\n• Developing educational applications as a means of remote communication..\n• Adding Google ads to mobile applications.\n• Helped resolve technical issues.',
    image: AppImages.teacher_tech,
    type: 'Contract',
    duration: 'Jun 2023',
  ),
];
