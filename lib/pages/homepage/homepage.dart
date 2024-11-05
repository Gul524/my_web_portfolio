import 'package:flutter/material.dart';
import 'package:my_web_portfolio/pages/homepage/desktop/desktoppage.dart';
import 'package:my_web_portfolio/pages/homepage/mobilepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder : (context , constraints ){ 
      if(constraints.maxWidth > 600){
        return  HomeDesktop();
      }
      else {
        return  HomeMobile();
      }  
      });
  }
}