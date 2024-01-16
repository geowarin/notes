
```py
import bpy
for obj in bpy.context.selected_objects:
if obj.type == 'MESH':
obj.data.name = obj.name
```
