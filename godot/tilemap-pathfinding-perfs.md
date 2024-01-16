If you do not need pathfinding to any possible position inside a surface and your project works ok with just simple
point-based pathfinding AStar2D is the way to go. AStar2D is a very simple pathfinding helper and performance friendly
to map changes because it does not care about any TileMap cell layouts. All it does is define a point and a few manual
connections to other points.

The NavigationServer2D and navigation mesh pathfinding are a different beast. The navigation meshes allow you to define
entire traversable surfaces instead of just points, but this comes at a higher performance cost for updates to build the
edge graph. Every navigation mesh edge adds the same cost to the pathfinding graph in 2D or 3D. While a common 3D
navigation map can cover large gameplay scenes with a navigation mesh consisting of just a few hundred edges the TileMap
in 2D is very wasteful with edges resulting in its general low pathfinding and update performance.

The new 2D navigation mesh baking can help with this so far as it removes a high number of unnecessary navigation mesh
edges in the navigation map by merging the cells. This results in better path corridors and better performance. It also
allows to offset the navigation mesh by agent size which removes this "agent walks through or gets stuck on corner"
problems of the TileMap.

The navigation mesh baking also can be done with background threads and a single NavigationRegion2D with an optimized
navigation mesh costs far less to sync on the navigation map than updating 1.000+ TileMap cells with each having its own
region and small navigation polygon.

If you have a very large TileMap it might take a second to bake a new navigation mesh but the baking can be done on a
background thread so wouldn't directly impact your frame rate. The parsing of the TileMap data needs to be done on the
main thread but this data can be cached in a NavigationMeshSourceGeometryData2D resource and only changes added on top
so this can be worked around as well.

But as mentioned before, what really makes your project freeze for 5-10 seconds are the edge connection calculations due
to having nearly 14.000 free and never merge-able edges in the project.

The edge connections are a feature designed for smaller projects to help beginners connect navigation meshes when hand
placed. They are costly to calculate because every free edge is compared against other free edges by angle, distance and
connectable edge segment until a match is found. So if not a single edge can be connected of those free edges, which is
the case in your layout, you are running a very costly near 14.000 x 14.000 loop with 196.000.000 costly calculations.
Nothing will safe that performance with this map size and layout except disabling the edge connection feature. You can
do that in the ProjectSettings 2D navigation submenu or with the NavigationServer2D.map\_use\_edge\_connection()
function.

https://github.com/godotengine/godot/issues/77741#issuecomment-1778204190