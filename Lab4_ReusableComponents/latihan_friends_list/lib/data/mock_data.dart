import '../models/contact.dart';
import '../models/message.dart';

final List<Contact> mockContacts = [
  Contact(
    id: 1,
    name: 'Ambablow',
    avatar: 'images/ambablow.jpg',
    lastMessage: 'AMBABLOW!',
    time: '9:40am',
    online: true,
  ),
  Contact(
    id: 2,
    name: 'asfolto',
    avatar: 'images/asfolto.jpg',
    lastMessage: 'batang',
    time: 'Yesterday',
    online: false,
  ),
  Contact(
    id: 3,
    name: 'Jeffrey Epstein',
    avatar: 'images/EFN.webp',
    lastMessage: 'COME TO MY PIZZA PARTY!',
    time: 'Monday',
    online: true,
  ),
  Contact(
    id: 4,
    name: 'George Floyd',
    avatar: 'images/floyd.png',
    lastMessage: 'I can\'t breathe',
    time: '4 Years Ago',
    online: false,
  ),
  Contact(
    id: 5,
    name: 'Charlie Kirk',
    avatar: 'images/son.png',
    lastMessage: 'See you at the Pizza Party tonight!',
    time: 'Sunday',
    online: true,
  ),
  Contact(
    id: 6,
    name: 'Ado',
    avatar: 'images/hither.jpg',
    lastMessage: 'haa use use use use wa',
    time: 'Yesterday',
    online: false,
  ),
];

final Map<int, List<Message>> mockMessages = {
  1: [
    Message(id: 1, text: 'Hi ambablow', sent: true),
    Message(id: 4, text: "AMBABLOW!", sent: false),
    Message(id: 5, text: "No, Ambablow, no gooning", sent: true),
    Message(id: 8, text: 'AMBABLOW!', sent: false),
  ],
  2: [
    Message(id: 1, text: 'apakah kau batang or no batang?', sent: true),
    Message(id: 2, text: 'batang', sent: false),
  ],
  3: [
    Message(id: 1, text: 'Hey, wanna hang out?', sent: false),
    Message(id: 2, text: 'no thank you', sent: true),
    Message(id: 3, text: 'PLEASEEEE!', sent: false),
    Message(id: 4, text: 'COME TO MY PIZZA PARTY!', sent: false),
  ],
};