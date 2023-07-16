
```gdscript
@tool
extends EditorScript


func _run():
	var anims: AnimationLibrary = ResourceLoader.load("res://skeletons/Anims.res")

	for anim_name in anims.get_animation_list():
		var anim: Animation = anims.get_animation(anim_name)
		for idx in anim.get_track_count():
			var track_path = anim.track_get_path(idx)
			var new_name = "Skeleton3D:" + track_path.get_concatenated_subnames()
			print(track_path, " => ", new_name)
			anim.track_set_path(idx, new_name)

```
