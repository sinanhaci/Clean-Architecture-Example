import 'package:example/presentation/blocs/user_detail/user_detail_bloc.dart';
import 'package:example/presentation/blocs/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_configs/app_init.dart';
import 'app_configs/route/router.dart';
import 'app_configs/theme/app_theme.dart';
import 'core/main_builder/main_builder.dart';
import 'injector.dart';


void main() async => await AppInit.init();

class ExampleApp extends StatelessWidget {
 ExampleApp({super.key});
  final _appRouter = AppRouter(); 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Injector.injector<UsersBloc>()),
        BlocProvider(create: (_) => Injector.injector<UserDetailBloc>()),
      ],
      child: MaterialApp.router(
        builder: MainBuild.build,
        title: 'Example App',
        theme: AppTheme.instance.theme,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
