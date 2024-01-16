I have mine disabled since graphics pipeline was enabled
something that makes shader compilation a lot closer to dx11 so you don't notice stutters/hitches
it is enabled by default since some time this year

that was dxvk-async
in fact, dxvk-async dev (original one) stopped developing because of graphics pipeline library
it is good enough nowadays
the only "downside" of disabling pre cached shaders is videos
some games videos are delivered with this shader pre cache thingie
but for those, you have Proton-GE
licensing stuff basically
Valve have to transcode the videos because codec copyright/license bs

so in that case I can just set GE as default, right? Just to be sure and don't have to fiddle around
You can't..
because there is a steam "bug" that resets your default if it is a custom proton version
per game is fine
I suggest using protonup-qt
it has a "assign proton version" or something like that
it lets you set a given proton version to all games
without changing your default inside steam

My advice here is:
Disable shader pre-caching and play your games normally
If you notice missing cinematics or anything like that, give GE a try for that game
I still think Proton[places.sqlite](..%2F..%2F..%2F.mozilla%2Ffirefox%2Fda2bwsif.default-release%2Fplaces.sqlite) Experimental as the default is your best bet

I disabled pre-caching as well because I remember it taking around 11gb when I was playing borderlands 3 😛
I heard its so useful on the deck, because everyone that has a deck uses the same hardware, so it's just easy to use tailored pre shader cache

I mean, using a pre-compiled shader is always faster than compiling on demand
but nowadays graphics pipeline library is in pretty good shape and GE have a lot of codec support
something nice to read
even if you don't get it
https://www.khronos.org/blog/reducing-draw-time-hitching-with-vk-ext-graphics-pipeline-library

yeap... transcoded videos and shaders
one thing everyone is pissed about is not having the pre-caching per game

Allow background processing of vulkan shaders
if you disable the pre-caching shader this have no effect
the background processing of vulkan shaders is good to avoid you seeing the step of "processing vulkan shaders" when you start a game

but if you want to check it is on your steam folder
near the compatdata and common folders
~/.local/share/Steam/steamapps/shadercache
or something like that
for nvidia I know it is on ~/.cache/nvidia/GLCache
for amd I have no idea
probably will be in .cache as well
apparently 1GB is the max
https://docs.mesa3d.org/envvars.html#envvar-MESA_SHADER_CACHE_MAX_SIZE


RADV Driver Enables Graphics Pipeline Library Support By Default
https://www.phoronix.com/news/RADV-GPL-Mesa-23.1-Default