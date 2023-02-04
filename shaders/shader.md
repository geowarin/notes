
Heightmaps

https://heightmap.skydark.pl/

```
// texture
uniform sampler2D tex: source_color, filter_linear_mipmap, repeat_enable;
// color
uniform vec3 color : hint_color;
// range
uniform float transparency: hint_range(0.0, 1.0);
```

hint_albedo => source_color

WORLD_MATRIX rename to MODEL_MATRIX
WORLD_NORMAL_MATRIX rename to MODEL_NORMAL_MATRIX

CAMERA_MATRIX rename to INV_VIEW_MATRIX
INV_CAMERA_MATRIX rename to VIEW_MATRIX


MODELVIEW_MATRIX ?

```glsl
vec3 object_world_pos = NODE_POSITION_WORLD; // returns the object position in world space
vec3 camera_pos = CAMERA_POSITION_WORLD; // returns the camera position in world space
vec3 camera_world_eye = CAMERA_EYE_WORLD; // returns the camera eye vector in world space direction of the camera
vec3 object_view_pos = NODE_POSITION_VIEW; // returns the object position in view space 
```
