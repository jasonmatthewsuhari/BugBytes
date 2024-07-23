function point_to_edge(_sx, _sy, _tx, _ty, _inner, _pad) {
   
    //gets coordinates for drawing an arrow on the edge of the screen, pointing to a destination
    //https://yal.cc/gamemaker-pointing-to-an-off-screen-object/
   
    ///@sx        real    source x
    ///@sy        real    source y
    ///@tx        real    target x
    ///@ty        real    target y
    ///@inner    real    distance to goal under which the pointing object should start to fade out
    ///@pad        real    distance between pointing object and edge
   
    var _dx, _dy, _vx, _vy, _vl;
    //_sx = src.x; _sy = src.y // source position
    //_tx = dst.x; _ty = dst.y // destination position
    _dx = _tx - _sx; _dy = _ty - _sy // difference
    _vl = sqrt(_dx * _dx + _dy * _dy) // distance
    if (_vl != 0) {
        _vx = _dx / _vl; _vy = _dy / _vl
    } else {
        _vx = 0; _vy = 0;
    }
    if (_vl > _inner * 2) {
        _vl -= _inner
        image_alpha = 1
    } else {
        image_alpha = max(0, (_vl - _inner) / _inner)
        _vl /= 2
    }
    image_angle = point_direction(_sx, _sy, _tx, _ty)
    if (_vy < 0) {
        _vl = min(_vl, ((camera_get_view_y(view_camera[0]) + _pad) - _sy) / _vy)
    } else if (_vy > 0) {
        _vl = min(_vl, ((camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - _pad) - _sy) / _vy)
    }
    if (_vx < 0) {
        _vl = min(_vl, ((camera_get_view_x(view_camera[0]) + _pad) - _sx) / _vx)
    } else if (_vx > 0) {
        _vl = min(_vl, ((camera_get_view_y(view_camera[0]) + camera_get_view_width(view_camera[0]) - _pad) - _sx) / _vx)
    }
    x = _sx + _vx * _vl
    y = _sy + _vy * _vl   
}

point_to_edge(obj_camera.x, obj_camera.y, obj_flag.x, obj_flag.y, 100, 40);