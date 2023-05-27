import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_request/repository/repositories.dart';

import 'blocs/users_api/users_api_bloc.dart';
import 'models/user_model.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => UsersApiBloc(UserRepository())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The BloC App Api Request')),
      body: blocBody(),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UsersApiBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UsersApiBloc, UsersApiState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          '${userList[index].firstName}  ${userList[index].lastName}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${userList[index].email}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userList[index].avatar.toString()),
                        ),
                      ),
                    ),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
