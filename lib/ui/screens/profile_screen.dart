import 'package:flutter/material.dart';
import 'package:jewellry_shop/SQLite/sqlite.dart';
import 'package:jewellry_shop/authtentication/login_screen.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final db = DatabaseHelper();

  String? name;
  String? surname;
  bool isExpanded = false;

  logout() {
    // Дополнительные действия, если необходимо
    // Например, очистить контроллеры или какие-то другие переменные

    // Переход на экран входа
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    Map<String, String?> userData = await db.getUserData();
    setState(() {
      name = userData['usrName'];
      surname = userData['usrSurname'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset(AppAsset.profileIcon, height: 60, width: 60,),
                  Expanded(
                    child: Column(
                      children: [
                        Text('$name $surname', style: Theme.of(context).textTheme.displaySmall,),
                        Text("Профиль", style: Theme.of(context).textTheme.headlineSmall,)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 23,
                      height: 23,
                      child: IconButton(
                        icon: isExpanded
                            ? const Icon(Icons.expand_more, size: 32,)
                            : const Icon(Icons.arrow_forward_ios, size: 20,),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isExpanded) ...[
              ListTile(
                title: Text('Редактировать данные', style: Theme.of(context).textTheme.headlineMedium,),
                onTap: () {
                },
              ),
              ListTile(
                title: const Text('Выйти', style: TextStyle(color: Colors.red),),
                onTap: () {
                  logout();
                },
              ),
            ],
            const Divider(color: Colors.grey, thickness: 1),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFF7f83d2),),
              title: Text('Местоположение', style: Theme.of(context).textTheme.headlineMedium,),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Color(0xFF7f83d2),),
              title: Text('Заказы', style: Theme.of(context).textTheme.headlineMedium,),
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFF7f83d2),),
              title: Text('История заказов', style: Theme.of(context).textTheme.headlineMedium,),
            ),
            SwitchListTile(
              activeColor: const Color(0xFF7f83d2),
              title: Text('Темная тема', style: Theme.of(context).textTheme.headlineMedium,),
              value: Theme.of(context).brightness == Brightness.dark,

              onChanged: (value) {
                JewState().toggleTheme();
                // Действие при изменении состояния переключателя темы
              },
              activeTrackColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}


