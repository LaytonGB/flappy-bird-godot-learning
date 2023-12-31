GDPC                 p                                                                         P   res://.godot/exported/133200997/export-1ce5c86e8ca186dcaaeaa8726f1268db-menu.scn�      u      �g+�;M'���Q    T   res://.godot/exported/133200997/export-af6045514d6594cfdfeb6b4c806116ec-playing.scn        >      H�����D� ��26�    P   res://.godot/exported/133200997/export-c2a7af834e91ff64325daddf58e45dc0-game.scn`      n      �h�E�`X�u-��:�    P   res://.godot/exported/133200997/export-f940f59e8c0371f4d9097be09dc57eb2-bird.scn�      �      �[��a�}�	�=<�a\�    T   res://.godot/exported/133200997/export-fdcb52c644ee849bb85d33a97e78e218-pillar.scn               �H����n�)�:��    ,   res://.godot/global_script_class_cache.cfg   .             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex@      �      �̛�*$q�*�́        res://.godot/uid_cache.bin   2            :|D+�vm0K7���N��       res://characters/bird.gd        �      �.�L����]�F        res://characters/bird.tscn.remap�+      a       &��խ��o��A��ǫ	        res://characters/bird_emitter.gd@      Y       z����.Qc��]9#`Z       res://characters/pillar.gd  p	      �      C��Юl���Q��qx ]    $   res://characters/pillar.tscn.remap  `,      c       <�z���� yrE�       res://icon.svg  @.      �      C��=U���^Qu��U3       res://icon.svg.import    +      �       H��'쁋�|n�vN       res://project.binary 3      �      �qQ�� ���3��       res://scenes/game.gd�      u      {}�$������������       res://scenes/game.tscn.remap�-      a       Og��a�c��X07�I       res://scenes/menu.gdP      �       e����3d�0ے�?{�       res://scenes/menu.tscn.remap�,      a       ��.���;;h��L=�       res://scenes/playing.gd        8      R,[9��AF�d>��        res://scenes/playing.tscn.remap @-      d       KI����a��l4$c�                extends CharacterBody2D


const MAX_ROTATION = 70.0

@export var speed_delta = 16.0
@export var max_speed = -600.0
signal died

func _physics_process(delta):
	
	if get_slide_collision_count() > 0:
		died.emit()
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = max_speed
	else:
		velocity.y = velocity.y + speed_delta * delta * 60
	
	$Sprite2D.global_rotation_degrees = clamp(velocity.y * (-MAX_ROTATION / max_speed), -MAX_ROTATION, MAX_ROTATION)
	
	move_and_slide()


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script !   res://characters/bird_emitter.gd ��������   Script    res://characters/bird.gd ��������
   Texture2D    res://icon.svg ��D]$,_      local://CircleShape2D_kc5gl �         local://PackedScene_jw6nt �         CircleShape2D            �A         PackedScene          	         names "         Bird    script    Node2D    CharacterBody2D 	   Sprite2D    scale    texture    CollisionShape2D    shape    _on_character_body_2d_died    died    	   variants                          
     �>  �>                         node_count             nodes     &   ��������       ����                            ����                          ����                                ����                   conn_count             conns               
   	                    node_paths              editable_instances              version             RSRC           extends StaticBody2D


const MAX_Y := 235.0
const SCREEN_WIDTH := 550

@export var speed := 4.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var y_pos := randf_range(-MAX_Y, MAX_Y)
	global_position = Vector2(550.0, y_pos)


func _process(delta):
	var x = global_position.x
	var y = global_position.y
	global_position = Vector2(x - speed * delta * 60, y)
	
	if x < -50.0:
		queue_free()
        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://characters/pillar.gd ��������
   Texture2D    res://icon.svg ��D]$,_      local://RectangleShape2D_lab5o �         local://PackedScene_aprpu �         RectangleShape2D       
     @B  D         PackedScene          	         names "         Pillar    Node2D    StaticBody2D    script    Top_Sprite2D 	   position    scale    texture 	   Sprite2D    Top_CollisionShape2D    shape    CollisionShape2D    Bottom_Sprite2D    Bottom_CollisionShape2D    	   variants    	             
   �����A
     �>
��@         
          A          
   ��� �ED
     �>�?�@
        �ED      node_count             nodes     @   ��������       ����                      ����                           ����                                   	   ����         
                       ����                                      ����         
                conn_count              conns               node_paths              editable_instances              version             RSRC               extends Node2D


signal game_over


func _on_character_body_2d_died():
	game_over.emit()
       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scenes/menu.gd ��������      local://PackedScene_dbtbr          PackedScene          	         names "         Menu    script    Node2D    Button    offset_left    offset_top    offset_right    offset_bottom    text    _on_button_pressed    pressed    	   variants                      ?C     �C    ��C     �C      START       node_count             nodes        ��������       ����                            ����                                           conn_count             conns               
   	                    node_paths              editable_instances              version             RSRC           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scenes/playing.gd ��������   PackedScene    res://characters/bird.tscn ���m��      local://PackedScene_gtvkh F         PackedScene          	         names "         Playing    script    Node2D    Bird 	   position    _on_bird_game_over 
   game_over    	   variants                          
     mC  �C      node_count             nodes        ��������       ����                      ���                         conn_count             conns                                      node_paths              editable_instances              version             RSRC  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scenes/game.gd ��������      local://PackedScene_0q2jc          PackedScene          	         names "         Game    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC  extends Node


var play_scene: Node
var menu: Node


func _ready():
	create_menu()


func _on_start_pressed():
	play_scene = preload("res://scenes/playing.tscn").instantiate()
	add_child(play_scene)
	play_scene.init(self)


func _on_game_over():
	create_menu()


func create_menu():
	menu = preload("res://scenes/menu.tscn").instantiate()
	add_child(menu)
	menu.init(self)
           extends Node2D


signal start_pressed


func _on_button_pressed():
	start_pressed.emit()
	queue_free()
	

func init(parent):
	start_pressed.connect(parent._on_start_pressed)
  extends Node2D


signal game_over

const Pillar := preload("res://characters/pillar.tscn")
const PILLAR_TIME_SEPARATION := 1.5

var last_time_survived := 0.0
var time_survived := 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_survived += delta
	
	if time_survived > last_time_survived + PILLAR_TIME_SEPARATION:
		add_child(Pillar.instantiate())
		last_time_survived = time_survived


func _on_bird_game_over():
	game_over.emit()
	queue_free()


func init(parent):
	game_over.connect(parent._on_game_over)
        GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c4yasyhujhhmp"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-f940f59e8c0371f4d9097be09dc57eb2-bird.scn"
               [remap]

path="res://.godot/exported/133200997/export-fdcb52c644ee849bb85d33a97e78e218-pillar.scn"
             [remap]

path="res://.godot/exported/133200997/export-1ce5c86e8ca186dcaaeaa8726f1268db-menu.scn"
               [remap]

path="res://.godot/exported/133200997/export-af6045514d6594cfdfeb6b4c806116ec-playing.scn"
            [remap]

path="res://.godot/exported/133200997/export-c2a7af834e91ff64325daddf58e45dc0-game.scn"
               list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ��D]$,_   res://icon.svg���m��   res://characters/bird.tscnfK����   res://characters/pillar.tscnT@E��G   res://scenes/game.tscnpmj��[   res://scenes/menu.tscnT@E��G   res://scenes/playing.tscnn�w��bv?   res://scenes/game.tscn��
:���   res://scenes/game.tscn       ECFG
      application/config/name         flappy-bird    application/run/main_scene          res://scenes/game.tscn     application/config/features   "         4.2    Mobile     application/config/icon         res://icon.svg  "   display/window/size/viewport_width      �  #   display/window/size/viewport_height            display/window/size/resizable          #   display/window/handheld/orientation         
   input/jump�              events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           echo          script            deadzone      ?#   rendering/renderer/rendering_method         mobile         