import 'package:flutter/material.dart';

class AppTheme {
    static  const Color primary = Color(0xFF00D09E); // Defina el Color Primario
    static  const Color Onprimary = Color(0xFF008F6D); // Defina el Color Primario
    static  const Color secondary = Color(0xFF0E3E3E); // Defina el Color Primario
    static  const Color Onsecondary = Color(0xFF003131); // Defina el Color Primario
    static  const Color error = Color(0xFF880401); // Defina el Color Primario
    static  const Color onError = Color(0xFFCC0300); // Defina el Color Primario
    static  const Color background = Color(0xFFF3FFFF); // Defina el Color Primario
    static  const Color onBackground = Color(0xFFDFF7E2); // Defina el Color Primario
    static  const Color surface = Color(0xFF003131); // Defina el Color Primario
    static  const Color onSurface = Color(0xFF00D09E);
  
}


class InputDecorations{
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData ? suffixIcon,
  }){
    return InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      
                      
                    ),
                    borderSide: BorderSide(
                      color: AppTheme.secondary
                      
                    )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                        color: AppTheme.primary
                      )
                    ),
                    hintText: hintText,
                    suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
                    labelText: labelText,
                  );
  }

}

class BoxDecorations{
  static BoxDecoration authBoxDecoration(
    
  ){
    return BoxDecoration(
        color: AppTheme.background,    
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(60),
          topStart: Radius.circular(60),
        ),
        
      );
  }
}