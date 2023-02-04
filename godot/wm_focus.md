
Here's a neat little trick to pause/unpause your game when the window loses/gains focus.

```gdscript
func _notification(what: int) -> void:
    match what:
        MainLoop.NOTIFICATION_WM_FOCUS_OUT:
            get_tree().paused = true
        MainLoop.NOTIFICATION_WM_FOCUS_IN:
            get_tree().paused = false
```
