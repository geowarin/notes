I am once again reverse engineering t3ssel8r tech, as is my passion. Per one of his comments
on [this video](https://www.youtube.com/watch?v=fSNdZ82I-eQ):

> what I'm sampling is the light space depth map (maybe what you refer to as shadow map) based on world-space
> coordinates of a series of parallel planes aligned with the light direction to test whether each position is shadowed.

So that's the idea. I use a multimesh instance and custom shader to position and align the some quad meshes with the
sun. In the vertex function I find the nearest plane, place the xy coordinates at the screen corners and solve for z on
that plane. In the light function I use the `ATTENUATION` to affect the `ALPHA`. Then it's just adding depth fade and
fading the instances in/out as the camera moves and rotates.