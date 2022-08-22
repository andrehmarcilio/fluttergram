import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/authentication_bloc.dart';
import '../../authentication/authentication_event.dart';

class HomeDrawerBody extends StatelessWidget {
  const HomeDrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          drawerBodyItem('Novo Grupo', Icons.group_outlined),
          drawerBodyItem('Contatos', Icons.person_outline_sharp),
          drawerBodyItem('Chamadas', Icons.call_outlined),
          drawerBodyItem('Pessoas Próximas', Icons.radar_outlined),
          drawerBodyItem('Mensagens Salvas', Icons.bookmark_outline_rounded),
          drawerBodyItem('Configurações', Icons.settings_outlined),
          const Divider(
            thickness: 0.6,
          ),
          drawerBodyItem('Convidar Amigos', Icons.person_add_outlined),
          drawerBodyItem('Recursos do Telegram', Icons.help_outline),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.person),
            ),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Logout"),
              content: const Text("Têm certeza que deseja sair?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('não')),
                TextButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(LoggedOut());
                      Navigator.pop(context);
                    },
                    child: const Text('sim'))
              ],
            ));
  }

  Widget drawerBodyItem(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(icon),
      ),
    );
  }
}
