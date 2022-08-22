import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/repository/user_repository.dart';
import 'package:telegram_clone/contacts/contacts_page.dart';
import 'package:telegram_clone/conversation/conversation_bloc.dart';



import '../conversation/conversation_page.dart';
import 'widgets/home_drawer.dart';


class HomeContainer extends StatelessWidget {
   HomeContainer({ Key? key }) : super(key: key);
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          final contactsBloc = ConversationBloc(_userRepository);
          contactsBloc.getConversation();
          return contactsBloc;
        }),
      ],
      child: const HomePage(),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;
  bool isFabVisible = true;
  Alignment _dragAlignment = const Alignment(1, 1);

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _runAnimation(bool hide) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: hide ? const Alignment(1, 1) : const Alignment(1, 1.3),
      ),
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: ((context) =>  ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Telegram'),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            )
          ],
        ),
        drawer: const Drawer(
          child: HomeDrawer(),
        ),
        body: NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            if (notification.direction == ScrollDirection.forward) {
              if (!isFabVisible) {
                setState(() {
                  isFabVisible = true;
                  _runAnimation(true);
                });
              }
            } else if (notification.direction == ScrollDirection.reverse) {
              if (isFabVisible) {
                setState(() {
                  isFabVisible = false;
                  _runAnimation(false);
                });
              }
            }
            return true;
          }),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                 SizedBox(
                  height: 8,
                ),
               ConversationPage()
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          heightFactor: 20,
          alignment: _dragAlignment,
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (newContext) => BlocProvider.value(
                  value: BlocProvider.of<ConversationBloc>(context),
                  child: const ContactPage()))),
            child: const Icon(Icons.edit),
          ),
        ),
      ),
    )),);
  }
}
