import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:flutter/material.dart';

class WeeklyScreen extends StatelessWidget {
   
  const WeeklyScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 10
              ),
                child: Column(  
                  children: [
                      Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Compra Despensa',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('29/04/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('50.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                     Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_gas_station_rounded, size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Combustile',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('29/04/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('50.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                     Row( 
                        
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.restaurant,size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Almuerzo',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('28/04/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('20.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                     Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Compra Super',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('28/04/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('150.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                     Row( 
                        
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.restaurant,size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Cena',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('28/04/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('35.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),

                     Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_gas_station_rounded, size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Combustile',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('27/04/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('30.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                      Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Compra Super',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('30/03/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('200.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                     Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_gas_station_rounded, size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Combustile',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('30/03/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('100.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                      Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Compra Super',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('30/03/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('200.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                     Row( 
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_gas_station_rounded, size: 35,color: AppTheme.Onsecondary, weight: 2,
                          ),
                          Spacer(flex: 2,),
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              Text('Combustile',style: TextStyle(
                                fontSize: 20,
                                
                              ),),
                              Text('30/03/2024', style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.Onprimary
                              ),)
                            ],
                          ),
                          Spacer(flex: 2,),
                          

                          Text('100.000 Gs.',style: TextStyle(
                                fontSize: 20,))
                        ],
                     ),
                     Divider(color: AppTheme.primary,),
                  ],
                )
            );
  }
}