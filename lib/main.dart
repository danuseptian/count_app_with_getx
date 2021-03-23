import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Text(
                '${controller.counter}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: controller.decrementCounter,
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: controller.resetCounter,
                  child: Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  onPressed: controller.incrementCounter,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  var counter = 0.obs;

  incrementCounter() {
    counter++;
  }

  resetCounter() {
    counter.value = 0;
  }

  decrementCounter() {
    counter--;
  }
}
