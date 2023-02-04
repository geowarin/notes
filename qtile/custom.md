Want to be able to resize and move floating windows from keypress? Just add some functions and bind them to keys...

```python
@lazy.window.function 
def resize_floating_window(window, width: int = 0, height: int = 0): 
    window.cmd_set_size_floating(window.width + width, window.height + height)

@lazy.window.function 
def move_floating_window(window, x: int = 0, y: int = 0): 
    window.cmd_set_position_floating(window.float_x + x, window.float_y + y) 
```

Or want to enable "back and forth" for groups (like i3's back_and_forth)? 
Just add a function and use it in place of the default lazy.groups.toscreen.

```python
@lazy.function 
def toscreen(qtile, group_name): 
    if group_name == qtile.current_screen.group.name: 
        return qtile.current_screen.set_group( qtile.current_screen.previous_group ) 
    for i, group in enumerate(qtile.groups): 
        if group_name == group.name: 
            return qtile.current_screen.set_group(qtile.groups[i])
```

This is what makes qtile (and awesomewm with lua for that matter) very powerful for allowing user customization.
