FUCKING YES! IT'S DONE!

    Gloom working on my 4GB card (using medium setting)
    ASTC in advanced can be turned on (still some graphical bugs in the loading menu but will test after i've deleted my shaders to see if this fixes it, NO visual bugs in game after switching weapons etc like before!)
    HUGE performance bump in Lookout point (only area tested so far but this area is in line with what I got in Kakariko/Hateno performance wise) now taking me from the initial 22-27 fps to a much more stable 28-30fps

IT'S DONE, WE WON BROS, FULL 30FPS EXPERIENCE IS HERE.

EDIT - Can't believe i'm this hype to experience silky smooth 30 frames per second. What a time.

EDIT 2 - Newest Nvidia drivers, Maxwell GPU (980 4GB)

EDIT 3 - Getting asked a lot so here's my settings/mods:

Advanced Graphics

    Enable Async Presentation (small performance boost, as stated by Yuzu devs) = Yes
    Force Maximum Clocks = No (this is a good setting for beefier GPUs Yuzu devs said)
    Decode ASTC = No (Can improve perfs but also cause artifacting)
    Enable Reactive Flushing = Yes (though turning it to no is meant to give a performance bump. I noticed visual glitches with it off so I keep it on)
    use Async Shader building = Yes
    Use Fast GPU Time = Yes (might want this on no though because the GBAtemp mod guy said it can fuck with the dynamic FPS mods. However he didn't state this for his new FPS++ which is what I use so I keep it on. It gives a performance bump as stated by Yuzu devs)
    Use Vulkan Pipeline Cache = Yes

Now the important newly added setting

    ASTC Recompression = BC3 (this is good for 4GB cards, if you have a 2GB card or lower then use BC1. If you have an 8GB card or higher then leave it as uncompressed). I use BC3 because my GPU has 4GB VRAM

Mods:

    FPS++
    Visual Fixes - AO Fix
    Visual Fixes - DisableFSR
    Visual Fixes - Shadow Resolution
    1080p mod (meant to fuck with the AO but I don't care. Game looks way better than sub 1080p)
    I also have a serfrost reshade (one posted on this sub)

The main setting is the new ASTC compression setting.

Also, maybe consider flushing your shaders (I didn't but others recommend it so maybe consider it).

Finally, keep in mind i've only done about an hour of testing. Who knows what bugs/issues I get later but so far, this was a huge update for my build personally.

---

[Guide for 60 FPS in Zelda: Tears of the Kingdom - r/NewYuzuPiracy](https://libreddit.eu.org/r/NewYuzuPiracy/comments/13o8zpz/guide_for_60_fps_in_zelda_tears_of_the_kingdom/)

> # Guide for 60 FPS in Zelda: Tears of the Kingdom
>
> Hey guys, I've been helping people on Discord since the game launch and now I think we reached enough stability for mods.
>
> I will keep this thread updated the same way as the Discord post. Keep in mind that sudden changes can happen so old comments may not be applicable when you read this thread.
>
> Before start, read the "Recommendations for Tears of the Kingdom": [https://www.reddit.com/r/yuzu/comments/13gy1th](https://libreddit.eu.org/r/yuzu/comments/13gy1th)
>
> Requirements for 60fps:
>
> -   A modern hexa core processor or better.
> -   Game with the official update 1.1.1.
> -   Firmware 16.0.2 or newer
> -   Uninstall ANY OTHER MOD you may have.
> -   Be grateful to ChuckFeedAndSeed, patchanon, somerandompeople, theboy181, MarethyuX, and Socats that worked hard to make these mods!
>
> Installation:
>
> 1.  Download the MODS from [https://gbatemp.net/download/37996/](https://gbatemp.net/download/37996/)
> 2.  Install "fps++\_totk"
> 3.  Install "VisualFixes\_ShadowResolution\_totk"
> 4.  Install "VisualFixes\_DisableQualityReduction\_totk"
> 5.  Install the black screen fix: [https://pixeldrain.com/u/dmGxqQ58](https://pixeldrain.com/u/dmGxqQ58)
>
> DISCLAIMER: Don't use the black screen fix if you use any controller UI mod. In this case use only the version "fix" of the controller mod.
>
> OPTIONAL: Recommended mods for graphics
>
> -   Install VisualFixes\_1008P\_FXAA\_Off\_FSR\_Off\_totk and disable VisualFixes\_DisableQualityReduction (the newest version of 1008p don't need it)
> -   VisualFixes\_AnisotropicFix\_totk - after install, enable Anisostropic Filtering 16x in Graphics -> Advanced
>
> After testing, you can now install other mods.
>
> Troubleshooting:
>
> -   The background blur effect in the weapon switch UI is completely black: Install the black screen fix from step 5.
>
> Issues not fixed:
>
> -   Map/menus run at faster speed when above 30FPS.
> -   Ultrahand vertical sensitivity increases at higher FPS.
> -   Aiming with gyro seems faster (feature maybe?).
>
> FINAL NOTE: Even with the better hardware available you will always encounter occasional dips in certain areas. Mods and emulation are not 100% ready yet.
>
> EDIT: Here are my settings, maybe helps (I'm on mainline):
>
> EDIT2: New recommendations for the improved 1008p: The new method released today don't change just one resolution but all the resolutions table, making the DisableQualityReduction mod not needed since the LOD function is not triggered anymore.
>
> [https://preview.redd.it/op9yhv6t1a1b1.png?width=1000&format=png&auto=webp&v=enabled&s=9998a6382d110d084f429875a7dee937d7cce78c](https://preview.redd.it/op9yhv6t1a1b1.png?width=1000&format=png&auto=webp&v=enabled&s=9998a6382d110d084f429875a7dee937d7cce78c)
