import '../constants/app_assets.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/review_model.dart';
import '../models/skills_model.dart';
import '../models/social_model.dart';
import '../models/user_model.dart';

final UserModel myData = UserModel(
  name: 'Mostafa Mohamed',
  email: 'moustafamohmed203@gmail.com',
  cvLink:
      'https://drive.google.com/file/d/1K_fvtC7IVOw74dvDYdXAF_aLJ78klU2B/view?usp=sharing',
  logo: AppImages.logo,
  photo:
      'https://res.cloudinary.com/dhub8xdyb/image/upload/v1788202174/ChatGPT_Image_Aug_31_2026_09_49_02_PM_veqiqc.png',
  profile:
      'https://res.cloudinary.com/dhub8xdyb/image/upload/v1788202174/ChatGPT_Image_Aug_31_2026_09_49_02_PM_veqiqc.png',
  socialLinks: socialIcons,
  about:
      'Mobile developer with over three years of experience designing, developing, testing, and maintaining mobile applications. Committed to delivering high-quality, user-centric solutions and continuously enhancing technical skills. Looking for a position within a dynamic organization that offers opportunities for professional growth and development.',
  profileSummary:
      'Mobile developer with over three years of experience designing, developing, testing, and maintaining mobile applications. Committed to delivering high-quality, user-centric solutions and continuously enhancing technical skills. Looking for a position within a dynamic organization that offers opportunities for professional growth and development.',
  country: 'Cairo, Egypt',
  skills: skills,
  experiences: experiences,
  projects: projects,
);

List<SkillsModel> skills = [
  SkillsModel(title: 'Flutter', image: 'assets/icons/flutter.svg'),
  SkillsModel(title: 'Dart', image: 'assets/icons/dart.svg'),
  SkillsModel(title: 'Firebase', image: 'assets/icons/firebase.svg'),
  SkillsModel(title: 'Bloc', image: 'assets/icons/bloc.svg'),
  SkillsModel(title: 'GetX', image: 'assets/icons/getx.svg'),
  SkillsModel(title: 'RestFul API', image: 'assets/icons/api.svg'),
  SkillsModel(title: 'Android', image: 'assets/icons/android.svg'),
  SkillsModel(title: 'Java', image: 'assets/icons/java.svg'),
  SkillsModel(title: 'Python', image: 'assets/icons/python.svg'),
  SkillsModel(title: 'C++', image: 'assets/icons/c.svg'),
  SkillsModel(title: 'Git', image: 'assets/icons/git.svg'),
  SkillsModel(title: 'GitHub', image: 'assets/icons/github.svg'),
  SkillsModel(title: 'GitLab', image: 'assets/icons/gitlab.svg'),
  SkillsModel(title: 'Android Studio', image: 'assets/icons/android_studio.svg'),
  SkillsModel(title: 'VS Code', image: 'assets/icons/vs_code.svg'),
  SkillsModel(title: 'Google Play Console', image: 'assets/icons/google_play_console.svg'),
  SkillsModel(title: 'SQLite', image: 'assets/icons/sqlite.svg'),
  SkillsModel(title: 'Postman', image: 'assets/icons/postman.svg'),
  SkillsModel(title: 'Figma', image: 'assets/icons/figma.svg'),
  SkillsModel(title: 'Draw io', image: 'assets/icons/drawio.svg'),
  SkillsModel(title: 'Canva', image: 'assets/icons/canva.svg'),
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
    title: 'Skin Care',
    description:
        'Skin care application featuring user authentication, personalized routines, and scheduled daily reminders.\nIntegrated camera functionality and external AI models via REST APIs for scanning skin conditions and providing real-time analysis.',
    image: 'assets/images/skin_care.png',
    githubLink: 'https://github.com/mostafamo7amed/Skin-Care',
    link: 'https://github.com/mostafamo7amed/Skin-Care',
    tags: [
      'Flutter',
      'Dart',
      'Bloc',
      'Cloud Firestore',
      'Firebase Auth',
      'Rest API',
      'Shared Preferences',
      'Local Notifications',
    ],
    dateRange: 'Mar 2026 - May 2026',
    demoLink: 'https://res.cloudinary.com/dhub8xdyb/video/upload/v1788210996/Record_2026-05-17-21-10-29_fcc3eba7d2286cc464ec11d417985df4_bexgzv.mp4',
    order: 1,
  ),
  ProjectModel(
    title: 'Moddi | مُضئ',
    description:
        '"Moddi" is a smart educational application designed to facilitate the memorization of the Holy Quran by connecting students with qualified Quran teachers through flexible one-on-one sessions. Features student-sheikh live bookings, review systems, and in-app chat.',
    image: 'assets/images/mobeen_ui.png',
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.mrperfection.moddi',
    appStoreLink: 'https://apps.apple.com/eg/app/moddi/id6779695172',
    link: 'https://play.google.com/store/apps/details?id=com.mrperfection.moddi',
    tags: [
      'Flutter',
      'Dart',
      'Bloc',
      'FCM',
      'Git',
      'Rest API',
      'Shared pref',
    ],
    dateRange: '2024 - 2025',
    order: 2,
  ),
  ProjectModel(
    title: 'Formado',
    description:
        'A comprehensive fitness and gym training application available on Android and iOS. Offers customized workout training routines, expert nutritional guidelines, and hydration water intake reminders tailored to users\' fitness goals.',
    image: 'assets/images/formado_ui.png',
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.mrperfection.formadoapp',
    appStoreLink: 'https://apps.apple.com/eg/app/formado/id6754535518',
    link: 'https://play.google.com/store/apps/details?id=com.mrperfection.formadoapp',
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
    demoLink: 'https://www.youtube.com/watch?v=OV1gvrVBA7Y',
    dateRange: '2024 - 2025',
    order: 3,
  ),
  ProjectModel(
    title: '3J&S / 3JS Investment Platform',
    description:
        'An innovative investment platform connecting project owners with investors through secure capital-sharing, clear contract tracking, and comprehensive investment portfolio management.',
    image: 'assets/images/j_and_s.png',
    appStoreLink: 'https://apps.apple.com/eg/app/3j-s/id6757923287',
    link: 'https://apps.apple.com/eg/app/3j-s/id6757923287',
    tags: [
      'Flutter',
      'Dart',
      'Bloc',
      'Firebase',
      'Git',
      'FCM'
      'Clean Architecture',
      'RestFul API',
    ],
    demoLink: '',
    dateRange: '2024 - 2025',
    order: 4,
  ),
  ProjectModel(
    title: 'Smart Sugar',
    description:
        'A smart diabetes management application offering real-time glucose tracking, medical records, medication reminders, personalized diet recommendations, emergency assistance, and AI-powered chat support leveraging OpenAI GPT models.',
    image: 'assets/images/smart_sugar_ui.png',
    githubLink: 'https://github.com/mostafamo7amed/Smart-Sugar',
    link: 'https://github.com/mostafamo7amed/Smart-Sugar',
    tags: [
      'Flutter',
      'Dart',
      'Firebase',
      'Bloc',
      'Python',
      'OpenAI GPT',
      'Google Maps',
      'MVVM',
      'Local Notification',
      'RestFul API',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747604594/video_2025-05-19_00-40-14_jolmvu.mp4',
    dateRange: 'Jan 2025 - Mar 2025',
    order: 5,
  ),
  ProjectModel(
    title: 'Asmaak | أَسْمَعُك',
    description:
        'A culturally relevant mobile application designed to teach Arabic sign language to children with video lessons, interactive quizzes, and child-friendly Gamified UI.',
    image: 'assets/images/assmak_ui.png',
    githubLink: 'https://github.com/mostafamo7amed/Asmaak-',
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
    dateRange: 'Feb 2025 - Apr 2025',
    order: 6,
  ),
  ProjectModel(
    title: 'Bill Hub',
    description:
        'E-commerce mobile application designed to simplify the online buying and selling experience with automated PDF invoice generation, transparent order tracking, and seamless merchant checkout.',
    image: 'assets/images/bill_hub.png',
    githubLink: 'https://github.com/mostafamo7amed/Bill-hub',
    link: 'https://github.com/mostafamo7amed/Bill-hub',
    tags: [
      'Flutter',
      'Dart',
      'Firebase',
      'Bloc',
      'PDF generator',
      'MVVM',
      'Shared pref',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747742980/video_2025-05-20_15-05-47_xsjokm.mp4',
    dateRange: 'Jun 2023 - Apr 2023',
    order: 9,
  ),
  ProjectModel(
    title: 'Mind Space',
    description:
        'A mobile application for psychological clinics to follow up on patient cases, session notes, appointments, and synchronized medical records using Cloud Firestore and Firebase Storage.',
    image: 'assets/images/mind_space.png',
    githubLink: 'https://github.com/mostafamo7amed/Mind-Space',
    link: 'https://github.com/mostafamo7amed/Mind-Space',
    tags: [
      'Flutter',
      'Dart',
      'Firebase Storage',
      'Cloud Firestore',
      'Bloc',
      'MVVM',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747743034/video_2025-05-20_15-05-40_urjau5.mp4',
    dateRange: 'Oct 2022 - Jun 2023',
    order: 8,
  ),
  ProjectModel(
    title: 'Madar | مدار',
    description:
        'Smart waste recycling application that rewards users with points redeemable for products and discounts, promoting environmental sustainability.',
    image: 'assets/images/madar_ui.png',
    tags: [
      'Flutter',
      'Dart',
      'Bloc',
      'Firebase',
      'Git',
      'RestFul API',
    ],
    demoLink: '',
    dateRange: '2025',
    order: 7,
  ),
  ProjectModel(
    title: 'HiParking | Graduation Project',
    description:
        'Innovative IoT and smart navigation parking solution guiding drivers to authorized parking spots in real-time with emergency roadside assistance features.',
    image: 'assets/images/hiparking_ui.png',
    githubLink: 'https://github.com/walidsalah19/hiparking',
    link: 'https://github.com/walidsalah19/hiparking',
    tags: [
      'Android native',
      'Java',
      'Flutter web',
      'Google Maps',
      'Firebase',
      'Arduino',
    ],
    demoLink:
        'https://res.cloudinary.com/dhub8xdyb/video/upload/v1747766036/Hiparking_Team_yaqdfs.mp4',
    dateRange: '2022',
    order: 10,
  ),
];

List<ExperienceModel> experiences = [
  ExperienceModel(
    title: 'Flutter Developer',
    company: 'Future App Technology',
    description:
        '• Working on a mobile app for a laundry system in Saudi Arabia (West Clean).\n• Modifying and updating features in the (RCT) Real Estate application, reducing the version size by 25%.',
    image: AppImages.futureApp,
    type: 'Remote',
    duration: 'Aug 2025 - Present',
    location: 'Remote',
    order: 1,
  ),
  ExperienceModel(
    title: 'Tutor – DEMI Summer Program',
    company: 'iSchool, Ministry of Communications and Information Technology',
    description:
        '• Taught programming languages (e.g., Python) to students aged 10–18.\n• Mentored students in problem-solving and logical thinking through hands-on projects.',
    image: AppImages.iSchool,
    type: 'Part-time',
    duration: 'Jul 2025 - Sep 2025',
    location: 'Cairo, Egypt',
    order: 2,
  ),
  ExperienceModel(
    title: 'Intern',
    company: 'Center of Nanoelectronics and Devices (CND), The American University in Cairo (AUC)',
    description:
        '• The internship focused on projects in the tech industry, reporting, and enhancement of digital skills for MSME support in Egypt.\n• Working on a waste recycling project for the iOS and Android platforms.',
    image: AppImages.auc,
    type: 'Part-time',
    duration: 'Mar 2025 - Jul 2025',
    location: 'Cairo, Egypt',
    order: 3,
  ),
  ExperienceModel(
    title: 'Mobile Application Developer',
    company: 'MrPerfection',
    description:
        '• Developing and testing an application for memorising the Holy Quran (Moddi / Mubin).\n• Developing a gym application (Formado) for Android and iOS platforms.\n• Developed 3JS, an innovative investment platform connecting project owners with investors through secure capital-sharing.\n• Develop and design mobile applications with responsive UI.',
    image: AppImages.prefection,
    type: 'Full-time',
    duration: 'Jul 2024 - Jun 2025',
    location: 'Cairo, Egypt',
    order: 4,
  ),
  ExperienceModel(
    title: 'Flutter Developer',
    company: 'WIZ Technology',
    description:
        '• Debugging and resolving technical issues.\n• Adding Google Ads to mobile applications.\n• Developing educational applications as a means of remote communication.\n• Troubleshooting and resolving technical issues to ensure the application is error-free.',
    image: AppImages.teacher_tech,
    type: 'Contract',
    duration: 'Jun 2023',
    location: 'Cairo, Egypt',
    order: 5,
  ),
];

List<ReviewModel> reviews = [

];

