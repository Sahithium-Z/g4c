Vim�UnDo� C}�����9�|��7��TKKD�i��j�                    -       -   -   -    c�jr    _�                             ����                                                                                                                                                                                                                                                                                                                                                             c�i     �                  extends Control           *# Declare member variables here. Examples:   # var a = 2   # var b = "text"           @# Called when the node enters the scene tree for the first time.   func _ready():   #	pass # Replace with function body.           K# Called every frame. 'delta' is the elapsed time since the previous frame.   #func _process(delta):   #	pass5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�i/     �                extends Control    �                �             5��                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c�i1     �             5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�i2     �               �               5��                                         {       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�i3     �                 5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�iL     �               �               5��                          �               �       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�iM     �         
    5��                          �                      5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             c�iS     �             �             5��                                         !       5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             c�iW    �                onready var money_label = $Money5��                          1                      5�_�   	              
      "    ����                                                                                                                                                                                                                                                                                                                                                             c�iz     �                 		�               5��                          O                     �                         P                     �                          O                     5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             c�i|    �               �               5��                          P              s       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�i�     �                 	�               5��                          �                     �                          �                     �                          �                     �                          �                     �                         �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c�i�     �                 func fade_in5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c�i�     �                 func fade_in()5��                         �                     �                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c�i�     �                �             5��                          �                      �                          �                      �                         �                      �                         �                     �                         �                      �                         �                      �                         �                      �                         �                      �                         �                      �                         �                     �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c�i�     �               onready5��                         �                     �                         �                     �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �               onready var name = get_node()5��                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �               onready var tween = get_node()5��              
          �       
              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �                 func fade_in():    �                  5��                         �                     �                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �                  5��                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �                 tween5��                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �                 	tween5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �               �               5��                          �              �       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �                	tweenH5��                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �               {		tween.interpolate_property(self, "color", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��                         �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       c�i�     �                 		tween.start()5��                         j                    5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                v       c�j     �               z	tween.interpolate_property(self, "color", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       #                                     5�_�                       =    ����                                                                                                                                                                                                                                                                                                                                                v       c�j     �               }	tween.interpolate_property(self, "modulate", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       =                 ,                    5�_�                       P    ����                                                                                                                                                                                                                                                                                                                                                v       c�j     �               }	tween.interpolate_property(self, "modulate", Color(0, 0, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       P                 ?                    5�_�                       4    ����                                                                                                                                                                                                                                                                                                                                                v       c�j     �               }	tween.interpolate_property(self, "modulate", Color(0, 0, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       4                 #                    5�_�                        5    ����                                                                                                                                                                                                                                                                                                                                                v       c�j-     �               	tween.interpolate_property(self, "modulate", Color(255, 0, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       5                  $                     5�_�      !                  5    ����                                                                                                                                                                                                                                                                                                                                                v       c�j.     �               ~	tween.interpolate_property(self, "modulate", Color(25, 0, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       5                  $                     5�_�       "           !      4    ����                                                                                                                                                                                                                                                                                                                                                v       c�j/     �               }	tween.interpolate_property(self, "modulate", Color(2, 0, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       4                 #                    5�_�   !   #           "      7    ����                                                                                                                                                                                                                                                                                                                                                v       c�j1     �               }	tween.interpolate_property(self, "modulate", Color(1, 0, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       7                 &                    5�_�   "   $           #      :    ����                                                                                                                                                                                                                                                                                                                                                v       c�j2     �               }	tween.interpolate_property(self, "modulate", Color(1, 1, 0, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       :                 )                    5�_�   #   %           $      G    ����                                                                                                                                                                                                                                                                                                                                                v       c�j4     �               }	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       G                 6                    5�_�   $   &           %      J    ����                                                                                                                                                                                                                                                                                                                                                v       c�j5     �               }	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       J                 9                    5�_�   %   '           &      M    ����                                                                                                                                                                                                                                                                                                                                                v       c�j6     �               }	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       M                 <                    5�_�   &   (           '      P    ����                                                                                                                                                                                                                                                                                                                                                v       c�j7    �               }	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)5��       P                 ?                    5�_�   '   )           (           ����                                                                                                                                                                                                                                                                                                                                                v       c�jU     �               	�             5��                          �                     �                          �                     �                      	   �             	       �                        �                    �                        �                    5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                v       c�jY     �               func _input(event):5��                        �                    �                        �                    �                         �                     �                       
   �              
       �       	                  �                     �                         �                     �                        �                    5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                v       c�jb     �               	event.is_action_pressed(5��                                              5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                v       c�jc     �               	event.is_action_pressed(""5��                                              �       '                                       �       (                                      �                                               5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                v       c�jo     �               (	event.is_action_pressed("ui_page_down")5��                         �                     5�_�   ,               -      +    ����                                                                                                                                                                                                                                                                                                                                                v       c�jq    �               +	if event.is_action_pressed("ui_page_down")5��       +                                       �       ,                                      �                                              �                         %                     �                         $                     �                         #                     �                     	   "             	       5��