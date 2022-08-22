import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'contacts_list.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
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
    return Builder(builder: ((context) =>  Scaffold(
      appBar: AppBar(
        title: const Text('Nova Mensagem'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          )
        ],
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
             ContactsList()
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        heightFactor: 20,
        alignment: _dragAlignment,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.person_add),
        ),
      ),
    )),);
  }
}
