# Tears Of The Kingdom Yuzu Setup Guide (60+ FPS UP TO DATE)

![](https://www.redditstatic.com/desktop2x/img/renderTimingPixel.png)

.t3\_149zxws.\_2FCtq-QzlfuN-SwVMUZMM3 { --postTitle-VisitedLinkColor: #edeeef; --postTitleLink-VisitedLinkColor: #6f7071; --postBodyLink-VisitedLinkColor: #6f7071; }

[u/Maxlastbreath](https://www.reddit.com/user/Maxlastbreath/)

•

Posted by

[u/Maxlastbreath](https://www.reddit.com/user/Maxlastbreath/)

4 months ago

[

### Tears Of The Kingdom Yuzu Setup Guide (60+ FPS UP TO DATE)



](https://www.reddit.com/user/Maxlastbreath/comments/148o725/tears_of_the_kingdom_yuzu_setup_guide_60_fps_up/)

![](https://www.redditstatic.com/desktop2x/img/renderTimingPixel.png)

.t3\_148o725.\_2FCtq-QzlfuN-SwVMUZMM3 { --postTitle-VisitedLinkColor: #edeeef; --postTitleLink-VisitedLinkColor: #6f7071; --postBodyLink-VisitedLinkColor: #6f7071; }

**Last Updated: 17th October 2023 - 13:54 UTC -** [**THE CHANGELOG**](https://www.reddit.com/u/Maxlastbreath/comments/148o725/comment/jo12ja8/?utm_source=share&utm_medium=web2x&context=3)

[YouTube](https://youtube.com/@maxlastbreath) - [Kofi](https://ko-fi.com/maxlastbreath) - [Github](https://github.com/MaxLastBreath/TOTK-mods)

**Recommended Version(s) LATEST mainline (currently)**

NOW SUPPORTS STEAMDECK and LINUX!

If you are experiencing weird bugs check out the [Bug Megathread](https://www.reddit.com/user/Maxlastbreath/comments/148p4wh/yuzu_totk_bugmegathread/) TBA before commenting, there's also FAQ/Q&A at the bottom of the guide, including some common bugs.

This is the most up to date guide to get YUZU working with the latest available patches/mods & fixes. This guide will be updated daily (or weekly). if you are facing any problems you can check my other post [Bug Megathread](https://www.reddit.com/user/Maxlastbreath/comments/148p4wh/yuzu_totk_bugmegathread/) which is also up to date with this guide :). Feel free to ask anything, I've already answered close to 4000+ comments and counting on the original posts, that have been removed from reddit! :) If you are having trouble following the text, there's also a step by step [Video Guide](https://www.youtube.com/watch?v=TZShKClU80w).

The Long Awaited [Video Guide](https://www.youtube.com/watch?v=TZShKClU80w) is here!

**Wondering if you should upgrade to EA3602+ check this** [Performance Review](https://youtu.be/wce7mZcCrs0).

The Guide:

**Download these files:**

- Latest available Early Access Yuzu Build from [Pineapple Github](https://github.com/pineappleEA/pineapple-src/releases) (Recommended) or Main [Official Yuzu Site](https://yuzu-emu.org/)

- ToTK rom - Both XCI & NSP work with Yuzu

- ToTK Updates: Any Update will work.

- 16.0.3 Title & Prod Keys: Dump your own keys.

- [TOTK Optimizer V1.4.0 (Mod Manager)](https://github.com/MaxLastBreath/TOTK-mods/releases/tag/manager-1.4.0) - [More Info About The Manager](https://www.reddit.com/user/Maxlastbreath/comments/179xs32/totk_optimizer_mod_manager_release_140_dfps_for/) - [Mod Folders (OLD)](https://rentry.org/modfolder)

    - [Dynamic FPS vs DynamicFPS++/FPS++ (NEW)](https://www.youtube.com/watch?v=5zMMAq4hfsQ)


Mod Folder Log up in my profile now, includes all versions.

Setup Guide:

1. Unzip/Install Yuzu and open the application.

2. Open Yuzu and at the top left, click `file>open yuzu folder`, unzip/extract the contents of the Title & Prod Keys, then run the [Mod Optimizer](https://github.com/MaxLastBreath/TOTK-mods/releases/tag/manager-1.3.3) with your desired preset(s)! (Your Yuzu folder should now contain a `load` folder and `keys` folder as well as all settings configured)

3. Setup your game directory (where you have your ToTK rom) and make sure Yuzu recognizes the game

4. In Yuzu select ToTK, go to Files in the top left corner - `Install to NAND` and select your 1.1 update file

5. In Yuzu select ToTK -> Properties -> Enable all mods and 1.1 update


Still can't setup yuzu? Follow through with [Video Guide](https://youtu.be/TZShKClU80w).

Settings

- **If you are using the TOTK Optimizer, the settings will be set automatically by choosing a setting preset.**


System:

- Multicore CPU Emulation ✓

- Memory Layout - 6GB DRAM (Unsafe) - DFPS 1.5.5 requires this.


Graphic Settings: (Use preset in manager)

- Accelerate ASTC Texture Decoding ✓ - Recommended on for most GPUs.

- API: Vulkan Use Disk pipeline ✓

- Use Asynchrous GPU emulation ✓

- Resolution (1x) - Mod Optimizer sets internal resolution, don't touch this.

- Windows Adapting Filter (AMD FSR, Nearest, Bilinear, Bicubic)

- Anti Aliasing Method (SMAA) Sharpness 0


Advanced Graphic Settings: (Use preset in manager)

- (NEW) ATSC recompression ✓ BC3 (6- 8gb vram) BC1 (4gb vram or under) BC1 (Steamdeck)

- Decode ATSC Textures Asynchronosly(HACK) X <-- **DISABLE: GAMEBREAKING**

- Enable Asynchronos Presentation ✓ <-- Could cause stuttering (updated)

- Force Maximum Clocks (Vulcan only) ✓ (Only if GPU is RTX 3070 or higher)

- Enable Reactive Flushing ✓ <-- ON (Turning it off, breaks the game)

- Use Asynchronos Shader builder (HACK) X <-- Reduces shader stutter but breaks Icons

- Use Fast GPU Time (HACK) ✓ <-- Some people reporting crashing.

- Use Vulkan Pipeline ✓

- Accuracy LEVEL (Normal) - Weirdness with physics use HIGH

- Antistrophic Filtering (16x) - Free Visual bump




[Every Setting Explained in a Video Format and It's Impact on performance or the game.](https://www.youtube.com/watch?v=qBTmgGqflQk)

Steamdeck should run quite a lot better on EA3606+ with the above settings :).



System Information:

- **Please ensure that your GPU drivers are up-to-date**

- **Please note that only very high-end PCs can achieve stable 60FPS**

- **If you have less than 32GB of RAM, consider increasing your Page File size to 32GB**


Minimum Specs:

- 16GB RAM (32GB recommended)

- Installed on SSD

- 4GB+ VRAM (8GB+ for 2x Render Res.)


Extra Notes:

- **Requirements for yuzu to work properly** - Install C++ Libraries

- **FPS Lock (Dynamic FPS Mod)** - For 30 FPS = Limit Yuzu Config speed to 50%, for 45FPS = 75%

- **HDR for Windows 11** - Rename Yuzu.exe to Cemu.exe to benefit from your HDR TV/Monitor, works very well. (WINDOWS 11 ONLY)


Extra Sources:

[TOTK Mod Collection Holographic Wings](https://github.com/HolographicWings/TOTK-Mods-collection)

[First Person Mod](https://gamebanana.com/mods/452336)

[Reshade Guide](https://www.youtube.com/watch?v=HvEYyovI-eo)

[Interpolated 60 fps Cutscenes](https://www.reddit.com/r/totkmods/comments/14fx65l/totk_interpolated_60fps_cutscenes_v21/)



Mods guide

- Right click on TOTK, Open Mod Data Location put any mod you want here.


Questions & Answers:

- **Q: Stuck in BLACK SCREEN after trying to LOAD the game**

    - COMMON solved ISSUE, IRC fitgirl repack ROM is buggy with 1.1 UPDATE

    - please remove update and install it again left click on totk, remove>remove update

    - if you have RTX 2000 or under download NVIDIA drivers 472.12 Newest Drivers.

    - If none of those worked for you, get a different rom or stick to 1.0 update.

- **Q: Will this work on Steamdeck/Linux?**

    - Yes, make sure you download an appimage the rest is the same

- **Q: Do I need Vulkan Shaders?**

    - It's not adviseable to use other people's shaders, because it could cause unexplained issues. That being said using only the vulkan.bin will build your own shaders, also keep in mind sharing shaders is considered **Piracy**.

    - Steamdeck users can still use other Steamdeck users shaders.

- **Q: I want to install a new Version of yuzu how do I?**

    - Download the new yuzu version from [Early Access Yuzu Version](https://pineappleea.github.io/) and copy the User folder in the new directory, it contains all your saves mods and shaders.

- **OP, I can't get stable 60 FPS what do i do, my RTX4090, rx7800x3D is not enough!?**

    - Switch emulation is VERY complex and the fact this is running 2 DAYS after TOTK release is a miracle by itself. (tho that config shoud be able to get you pretty close), if you are having a lot of stutters delete your shader cache.

    - [Here's a comparison between Cemu and Yuzu, you can decide if it Yuzu will work for you.](https://www.youtube.com/watch?v=pRZ7S5II3wI)


Version Log

1. [3602 to 3609 changes](https://www.youtube.com/watch?v=fDR5Lyb8jUY)

2. [3609 to 3621 changes](https://www.youtube.com/watch?v=ZNgDdmQZfIQ)

3. [3621 to 3652 changes](https://www.youtube.com/watch?v=8agPUyyU7zA)

4. [3652 to 3700 changes](https://youtu.be/M71ttpy8EmQ)


Please check the [Bug Megathread](https://www.reddit.com/user/Maxlastbreath/comments/148p4wh/yuzu_totk_bugmegathread/) for any issues you may be having.



- **CREDITS:**


[u/ChucksFeedAndSeed](https://www.reddit.com/u/ChucksFeedAndSeed/) - Shadow, resolution, Dynamic FPS mod

[u/PixelKiri](https://www.reddit.com/u/PixelKiri/) - Cutscene mod

[Randomguy FPS Mod](https://gbatemp.net/download/loz-tears-of-the-kingdom-dynamic-fps-static-fps-and-visual-fixes-patch-collection.37996/updates) - 60 FPS Mod credit

[u/MarethyuX](https://www.reddit.com/u/MarethyuX/) - Blackscreen when switching weapons mod fix

theboy181 - Credit for cutscene fix

Thank you [u/Zel\_La](https://www.reddit.com/u/Zel_La/) - BIG HELP WITH FORMATTING! <3





If you want to support my work, I have a kofi link at [https://ko-fi.com/maxlastbreath](https://ko-fi.com/maxlastbreath)