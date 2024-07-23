if (shake) 
{ 
   shake_time -= 1; 
   var _xval = choose(-shake_magnitude, shake_magnitude); 
   var _yval = choose(-shake_magnitude, shake_magnitude); 
   camera_set_view_pos(view_camera[0], obj_camera.x - (cam_width * 0.5) + _xval, obj_camera.y - (cam_height * 0.5) + _yval); 
   
   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         shake = false; 
      } 
   } 
}