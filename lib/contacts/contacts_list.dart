import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/authentication_bloc.dart';
import 'package:telegram_clone/authentication/authentication_state.dart';

import 'contact_item.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      state as AuthenticationAuthenticated;
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.user.contacts.length,
          itemBuilder: (context, index) {
            return ContactItem(
                contact: state.user.contacts[index],
                position: index,
              );
          });
    });
  }
}
