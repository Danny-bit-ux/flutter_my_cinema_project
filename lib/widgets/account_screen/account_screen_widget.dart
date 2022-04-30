import 'package:flutter/material.dart';

class AccountScreenWidget extends StatelessWidget {
  const AccountScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Container(
              height: 150.0,
              width: 150.0,
              child: Image.asset("images/photo.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: SizedBox(
              height: 50.0,
              width: 350.0,
              child: Text(
                "Новинки, эксклюзивы и прочие видео доступны после авторизации",
                maxLines: 4,
                textAlign: TextAlign.center,
                style: _styleTextButton(),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/auth');
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue[900])),
            child: Text("Войти",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
          ),
          _OutlinedButtonWidget(
            text: "История",
            icon: Icons.local_drink,
            press: () {},
          ),
          _OutlinedButtonWidget(
            text: "Настройки",
            icon: Icons.settings,
            press: () {},
          ),
          _OutlinedButtonWidget(
            text: "Обратная связь",
            icon: Icons.star_border,
            press: () {},
          ),
          SizedBox(
            height: 20.0,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.blue[900]),
            ),
            onPressed: () {},
            child: Text(
              "Пользовательское соглашение",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final icon;
  final press;

  const _OutlinedButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blue[900])),
      child: Row(
        children: [
          Icon(icon),
          Text(
            text,
            style: _styleTextButton(),
          )
        ],
      ),
    );
  }
}

_styleTextButton() {
  const TextStyle style = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
}
