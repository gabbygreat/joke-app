import 'package:api_demo/model/joke_model.dart';
import 'package:api_demo/network/network.dart';
import 'package:flutter/material.dart';

class AnyJokes extends StatefulWidget {
  const AnyJokes({Key? key}) : super(key: key);

  @override
  State<AnyJokes> createState() => _AnyJokesState();
}

class _AnyJokesState extends State<AnyJokes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FutureBuilder(
            future: GetRequest.getJokes('any'),
            builder:
                (BuildContext context, AsyncSnapshot<JokeModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data == null) {
                  return const Center(
                      child: Text('Check your internet connection'));
                } else {
                  if (snapshot.data!.error == true) {
                    return const Center(child: Text('Incorrect category'));
                  } else {
                    if (snapshot.data!.type == 'single') {
                      if (snapshot.data!.joke != null) {
                        return Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text(
                                snapshot.data!.category,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Text(snapshot.data!.joke!)
                            ]));
                      } else {
                        return const Center(
                            child: Text('Sorry something went wrong'));
                      }
                    } else if (snapshot.data!.type == 'twopart') {
                      if (snapshot.data!.setup != null &&
                          snapshot.data!.delivery != null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.category,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Que: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                TextSpan(
                                    text: snapshot.data!.setup!,
                                    style:
                                        const TextStyle(color: Colors.black)),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Ans: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                TextSpan(
                                    text: snapshot.data!.delivery!,
                                    style:
                                        const TextStyle(color: Colors.black)),
                              ])),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                            child: Text('Sorry something went wrong'));
                      }
                    } else {
                      return const Center(
                          child: Text('Sorry something went wrong'));
                    }
                  }
                }
              }
            },
          ),
          ElevatedButton(
              onPressed: () => setState(() {}), child: const Text('Next'))
        ],
      ),
    );
  }
}
