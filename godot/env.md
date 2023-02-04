[godot 4 lighting got me like 🥴 - r/godot](https://libreddit.spike.codes/r/godot/comments/ze52zz/godot_4_lighting_got_me_like/)

> Sure! To start with, if you want a realistic look, you generally always want to use ACES tonemapping. This is true
> regardless of whether you're on Godot 4, Godot 3, or even Unity. You can set tonemapping in Godot in WorldEnvironment.
>
> For surfaces to interact with light and reflections, plausibly you're gonna want to use PBR materials and textures. In
> Godot this is done by using the Standard Material for your objects and providing it with all the proper texture maps (
> Albedo, Metallic, Roughness, and a Normal Map). I use ArmorPaint for my PBR texture authoring needs, but the industry
> standard is Substance Painter.
>
> For PBR to look good and "correct", it needs to be fed with lighting and reflection data that are as grounded as
> possible. If an object is in an enclosed space, for example, but the lighting and reflection data hitting it is just
> generic ambient data from the skybox then objects will look flat, overly bright, and too blue (if the sky is blue). You
> want lighting and reflections to have directionality, occlusion, and illumination. The classical way to achieve this in
> games is with baked lightmaps and reflections, but in Godot 4, SDFGI can take care of all of this for you in a way
> that "just works". So just flip on SDFGI in your WorldEnvironment, and make sure to properly set the Global Illumination
> mode to static/dynamic on the meshes in your scene!
>
> Now for this scene specifically, it's basically just really thick Volumetric Fog, with a strong, high-range point
> light, at a high angle, that moves from right to left, and lights up the Volumetric Fog in a dramatic way.
>
> So just turn on Volumetric Fog in WorldEnvironment. Set the density to 0, because we don't want an even density of fog
> all over. Not only is it not realistic, it'll also make it hard to see the ground from the high position of our camera.
>
> Create a FogVolume and set the shape to World. In the Fog Material, set a Height Falloff (I think I used 0.2 for this
> scene). This will make the fog fade out in density the higher from origin it gets, which is realistic behaviour compared
> to a flat, even fog density.
>
> Now just set up an OmniLight, set a high range and brightness to it, and turn on it's shadows. Set it at a relatively
> low height above the ground, move it from right to left, and voila! I used a pinkish color for the fog, and an orangeish
> color for the light, to get the colors in the video.
