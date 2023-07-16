[Add a V-Sync editor setting by Calinou · Pull Request #48364 · godotengine/godot](https://github.com/godotengine/godot/pull/48364)

> Right now, V-Sync in the editor is controlled by the V-Sync project setting. Since 4.0, you can also use the `--disable-vsync` [command line](https://docs.godotengine.org/en/stable/tutorials/editor/command_line_tutorial.html) argument when opening the editor directly on the project.
>
> If you have a variable refresh rate monitor (and VRR is enabled on windowed applications[1](https://github.com/godotengine/godot/pull/48364#user-content-fn-1-5bfc832269ee9f4ecc152278a15b547d)), remember that you can leave V-Sync enabled and set a framerate cap by changing **Low Processor Mode Sleep Usec** in the editor settings to `ceil(1.0 / vrr_fps_cap * 1000000)`, where `vrr_fps_cap` is determined by the formula `refresh_rate - (int(refresh_rate / 60.0) + 1)`.
>
> For instance, on a 60 Hz display, this is 58 FPS (`17242` usec). On a 120 Hz display, this is 117 FPS (`8548` usec), and on a 144 Hz display, this is 141 FPS (`6945` usec). This allows you to get the best of both worlds (no tearing, low input lag).
>
> See [https://blurbusters.com/howto-low-lag-vsync-on/](https://blurbusters.com/howto-low-lag-vsync-on/) for more information, and [godotengine/godot-proposals#5451](https://github.com/godotengine/godot-proposals/issues/5451) which provides an automatic VRR-friendly framerate cap that can be selected by the user. (There's unfortunately no standard API to detect whether the user is currently using VRR, so this cannot be enabled automatically.)
>
> > (And after trying this option, I have no idea why one would default vsync to on...
>
> I'd also prefer to have V-Sync off by default in the editor, but this should be discussed separately. reduz was against it last time I brought this up, since it results in noticeable tearing when panning in the 2D/3D editor viewports.
>
> > the compositor seems to be already taking care of any tearing and the vsync seems to be just adding a huge unnecessary lag
>
> See also [#71795](https://github.com/godotengine/godot/issues/71795). We don't know why this is occurring yet – input lag should _not_ be higher than in 3.x in apples-to-apples comparisons. While disabling V-Sync will help a lot, we should still aim to resolve the original issue.
>
> ## Footnotes
>
> 1.  VRR is always enabled on windowed applications on X11 (if VRR is enabled in general), but VRR only affects fullscreen apps by default on Windows. [![leftwards_arrow_with_hook](https://github.githubassets.com/images/icons/emoji/unicode/21a9.png)](https://github.com/godotengine/godot/pull/48364#user-content-fnref-1-5bfc832269ee9f4ecc152278a15b547d)
