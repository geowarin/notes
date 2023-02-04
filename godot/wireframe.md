Viewport has four drawing modes:

enum DebugDraw:

    DEBUG_DRAW_DISABLED = 0 Objects are displayed normally.

    DEBUG_DRAW_UNSHADED = 1 Objects are displayed without light information.

    DEBUG_DRAW_OVERDRAW = 2 Objected are displayed semi-transparent with additive blending so you can see where they intersect.

    DEBUG_DRAW_WIREFRAME = 3 Objects are displayed in wireframe style.

Overdraw is displayed on the right side of the picture.

You can set these modes during runtime and the renderer will change between then, except for wireframe. Grrr...!

However, if you do this VisualServer.set_debug_generate_wireframes(true), then set get_viewport().debug_draw=DEBUG_DRAW_WIREFRAME, then anything drawn after that point will be wireframe.

So this bit of code will allow you to press P and rotate between the drawing modes:

```gdscript
func _init():
VisualServer.set_debug_generate_wireframes(true)

func _input(event):
	if event is InputEventKey and Input.is_key_pressed(KEY_P):
		var vp = get_viewport()
		vp.debug_draw = (vp.debug_draw + 1 ) % 4
```
