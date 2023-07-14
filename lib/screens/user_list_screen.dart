import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_c/bloc/user_bloc/user_bloc.dart';
import 'package:tt_c/models/user_model.dart';
import 'package:tt_c/screens/user_datail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListSreen extends StatefulWidget {
  const UserListSreen({Key? key}) : super(key: key);

  @override
  State<UserListSreen> createState() => _UserListSreenState();
}

class _UserListSreenState extends State<UserListSreen> {
  late UserBloc bloc;
  @override
  void initState() {
    bloc=UserBloc();
    bloc.add(GetUsers());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    return  BlocConsumer<UserBloc, UserState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is UsersErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
            ));
          }
        },
        builder: (context, state) {
          if (state is UsersFetchedState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor:Colors.lightBlueAccent,
                title: Text(localizations!.users),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.usersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailScreen(
                              user: state.usersList[index],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Card(
                          color: Colors.lightBlueAccent[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                            visualDensity: VisualDensity.adaptivePlatformDensity,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(state.usersList[index].avatarUrl,fit: BoxFit.cover,),
                            ),
                            title: Text('${localizations.login}:${state.usersList[index].login}'),
                            subtitle: Text('${localizations.type}: ${state.usersList[index].type==Type.USER?localizations.user:localizations.organization}'),
                            trailing: Text('id: ${state.usersList[index].id}'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }

          if(state is SplashScreen){
            return Container(
              color: Colors.white,
            child: ClipRRect(
              child: Icon(Icons.accessibility_new_sharp,size: 30,),
            ),
            );
          }
          return Container(
            child: Column(
              children: [],
            ),
          );
        },
      )
    ;
  }
}
