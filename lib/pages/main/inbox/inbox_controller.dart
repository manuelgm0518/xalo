import 'dart:math';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:xalo/pages/main/inbox/inbox_page.dart';

class InboxController extends GetxController {
  var openFAB = false.obs;
  var chats = <ChatTile>[].obs;
  var counter = 0.obs;

  @override
  void onInit() {
    for (int i = 0; i < 10; i++) createChat();
    super.onInit();
  }

  var images = <String>[];
  var messages = <String>[
    'Primero que nada, buenos días',
    'Primero que nada, buenas noches',
    'Viene en el pdf',
    'Buena idea!',
    'Busca en amazon',
    'Díselo al Covenant',
    'Se lo comunicaré',
    'Qué bonito, gracias por compartirlo'
  ];

  void createChat() {
    final sender = Random().nextBool();
    chats.add(
      new ChatTile(
          icon: 'https://picsum.photos/200?random=${chats.length + 1}',
          name: Faker().company.name(),
          lastMessage: messages[Random().nextInt(messages.length) - 1],
          lastDate: DateTime(2020, Random().nextInt(11) + 1, Random().nextInt(27) + 1),
          watched: Random().nextBool(),
          lastSender: sender ? Faker().person.firstName() : null,
          unreadCount: sender ? Random().nextInt(10) : 0),
    );
    chats.sort((a, b) => b.lastDate.compareTo(a.lastDate));
  }
}
