import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/responsive/responisive.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({
    super.key,
    required this.sw,
  });

  final double sw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _mode = ref.watch(modeProvider);
    return Drawer(
        backgroundColor: _mode ? Color(0xFF878484) : Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU"),
            ),
            ListTile(
              title: Text(
                "name",
                style: TextStyle(
                    color: !_mode ? Color(0xff0a141c) : Colors.white,
                    fontFamily: "Righteous",
                    fontSize: sw * (14 / Responsive.width)),
              ),
              subtitle: Text(
                "aswal p",
                style: TextStyle(
                    color: !_mode ? Color(0xff0a141c) : Colors.white,
                    fontFamily: "Righteous",
                    fontSize: sw * (20 / Responsive.width)),
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Email",
                style: TextStyle(
                    color: !_mode ? Color(0xff0a141c) : Colors.white,
                    fontFamily: "Righteous",
                    fontSize: sw * (14 / Responsive.width)),
              ),
              subtitle: Text(
                "aswalpt@gmail.com",
                style: TextStyle(
                    color: !_mode ? Color(0xff0a141c) : Colors.white,
                    fontFamily: "Righteous",
                    fontSize: sw * (20 / Responsive.width)),
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Help",
                style: TextStyle(
                    color: !_mode ? Color(0xff0a141c) : Colors.white,
                    fontFamily: "Righteous",
                    fontSize: sw * (20 / Responsive.width)),
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Mode",
                style: TextStyle(
                    color: !_mode ? Color(0xff0a141c) : Colors.white,
                    fontFamily: "Righteous",
                    fontSize: sw * (20 / Responsive.width)),
              ),
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.white,
                value: _mode,
                onChanged: (value) {
                  ref.read(modeProvider.notifier).state = value;
                },
              ),
            ),
            const Divider(),
          ],
        ));
  }
}

final modeProvider = StateProvider<bool>((ref) => true);
