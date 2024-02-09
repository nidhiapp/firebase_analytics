import 'package:flutter/material.dart';

class ThemeSheet extends StatefulWidget {
  const ThemeSheet({super.key});

  @override
  State<ThemeSheet> createState() => _ThemeSheetState();
}

class _ThemeSheetState extends State<ThemeSheet> {
 int _themeIndex = 0; 
    final List<String> themes = ["Light", "Dark", "Default"];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, left: 24, bottom: 10),
                              child: Text(
                                "Change Theme",
                                style:TextStyle(color:Colors.black, fontWeight: FontWeight.w500, fontSize: 20)
                              ),
                            ),
                            
                             RadioListTile( 
                                title: const Text('Dark'), 
                                value: 0, 
                                groupValue: _themeIndex, 
                                onChanged:(value) {
                                setState(() {
                                  _themeIndex = value!;
                                });
                              },
                              ), 
                             RadioListTile( 
                                title: const Text('Light'), 
                                value: 1, 
                                groupValue: _themeIndex, 
                                onChanged: (value) {
                                setState(() {
                                  _themeIndex = value!;
                                });
                              }, 
                              ), 
                               RadioListTile( 
                                title: const Text('Default'), 
                                value: 2, 
                                groupValue: _themeIndex, 
                                onChanged: (value) {
                                setState(() {
                                  _themeIndex = value!;
                                });
                              },
                              ), 

                            
                            SizedBox(
                              height: 24,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Text("press to change theme")),
      ),
    );
  }

   void _handleThemeChange(int? value,) { 
        setState(() { 
              _themeIndex = value!; 
        }); 
      } 
}
