import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Home/bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(RepositoryProvider.of(context),
      )..add(LoadAPIEVENT()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cities From API'),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeBloc,HomeState>(
          builder: (context,state){
            if (state is HomeLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if (state is HomeloadedState){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.Country1,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(state.Country2,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Text(state.Country3,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold)),
                  ],
                ),
              );

            }
            return Container();
          },
        ),
      ),
    );
  }
}
