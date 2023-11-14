import 'package:flix_movie/presentation/misc/methods.dart';
import 'package:flix_movie/presentation/pages/profile_page/methods/profile_item.dart';
import 'package:flix_movie/presentation/pages/profile_page/methods/user_info.dart';
import 'package:flix_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              verticalSpace(20),
              ...userInfo(ref),
              verticalSpace(20),
              const Divider(),
              verticalSpace(20),
              profileItem('Editar seu perfil'),
              verticalSpace(20),
              profileItem('Mude sua senha'),
              verticalSpace(20),
              const Divider(),
              verticalSpace(20),
              profileItem('Entre em contato'),
              verticalSpace(20),
              profileItem('Termos e condições'),
              verticalSpace(60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Sair'),
                  onPressed: () {
                    ref.read(userDataProvider.notifier).logout();
                  },
                ),
              ),
              verticalSpace(20),
              const Text(
                'Version 0.0.1 (Versão teste para OAT)',
                style: TextStyle(fontSize: 12),
              ),
              verticalSpace(100)
            ],
          ),
        )
      ],
    );
  }
}
