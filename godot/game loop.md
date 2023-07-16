Game Loop

DisplayServer.ProcessEvents
    get cpu ticks
    physics steps
    SceneTree.PhysicsProcess
        emit "physics_frame"
        all nodes "physics process"
        any "call deferred"
        any timers
        any tweens
    navigation
    any "call deferred"
    SceneTree.Process
        emit "process_frame"
        any "call deferred"
        all node "_process"
        any "call deferred"
        any timers
        any tweens
    any "call deferred"
    draw
    frames ++
