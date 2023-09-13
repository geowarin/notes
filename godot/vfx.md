[VFX Series. Shaders: Lesson 1. Power of curves | by DreadlocksDude | Jul, 2023 | Medium](https://medium.com/@dreadlocksdude/vfx-series-shaders-lesson-1-power-of-curves-9be476ba6e93)

> # Welcome to the first lesson in the VFX Shader Series
>
> This series doesn’t expect you to be good at programming or math, though if you are it will help. You need a very basic understanding of what program code is, how to create a function, a variable, and an _if_ statement (in any programming language). Programming skills beyond that aren’t required, and while having some background in programming helps, most of the advanced software engineering skills are not applicable to shaders. Our main goal is to develop an intuitive understanding of how shader effects are created and learn to create a mental image of the process before we even start implementing them.
>
> > Note: this is not a “tutorial” in a usual internet sense of this word: I am not going to show you how to do one specific thing following me step by step. Instead we are going to navigate through tools, concepts and principles required to create anything you want with shaders and other useful technology. Each lesson has a [link to Github](https://github.com/dreadlocks-dude/godot-fvx-series) with project files and code.
>
> I use [Godot Game Engine](https://godotengine.org/) for game development, educational materials, and visual art. This series is going to use it too. If you never used Godot before — worry not, it’s completely free and extremely simple to learn, with a very active community that can help you at any time. If you know your way around Godot, or just installed it, but never worked with shaders before, here is a very gentle intro into shaders overall: [Lesson 0. Your first Godot Shader](https://medium.com/@dreadlocksdude/vfx-series-lesson-0-your-first-godot-shader-99798e2c567d). If you don’t need to or don’t want to use a game engine, it’s ok too — the material we are going through is applicable to any software that uses shaders. Other two important tools that aren’t required for this course, but are a must for actual work are [Blender](https://www.blender.org/) and [Krita](https://krita.org/). They are free and powerful tools anyone in the industry of gamedev should be familiar with.
>
> Before we get to do really cool stuff, we need to learn a few principles that are simple but powerful. Some of the most important ones are:
>
> -   curves
> -   noise
> -   vertex manipulations
> -   particles
> -   light
> -   simulations
>
> As we progress through the topics, we will be creating progressively more complex and interesting effects. All the source files used to create illustrations and examples used in this series are available online at [GitHub](https://github.com/dreadlocks-dude/godot-fvx-series).
>
> This lesson explores the role of curves as a fundamental building block of all effects.
>
> # Intuition about the curves
>
> Curves are used everywhere: 3d modeling, animation, photo editing, drawing, AI programming, etc. They could be branded as “shape”, “path” or even “easing”, but it always means the same thing — there is a curve there. There are many ways to define the word “curve”, and different ways to think of it. I am offering you two definitions, which may seem unrelated at first. **_A curve is … :_**
>
> -   **_… a collection of points connected into a continuous sequence_**
> -   **_… a visualization of relationship between two sets of values_**
>
> The first and the more intuitive definition works when we use curves for modeling and animation — points can be vertices of a mesh or keyframes of an animation, and they are connected into a sequence. When we draw with a pencil we create curves that are physically made of little dots left on a piece of paper that connect into lines. However, for purposes of shader coding, color correction, AI, and some aspects of animation — this definition doesn’t work.
>
> > **We will start with an example that is seemingly unrelated to shaders, but you will see how it ties everything together later**
>
> Let’s open any photo you have in some photo editor (I use [Krita](https://krita.org/), but any editor will have this feature). Open the “Color Adjustment Curves” filter. If you use other tools, like Photoshop, they have very similar features, usually with “curves” in the name.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*HpmRDc320aZda8WzEuSYXQ.png)
>
> Color Adjustment Window in Krita
>
> We have a nice curve editor here. It lets us create any curve imaginable (_seemingly_). But this is very different from the other usages of the curves — this one won’t appear anywhere in our picture. It’s not drawing any points on the photo itself (at least not directly) and once we click OK or Cancel — it’s gone. This curve has an interesting purpose — to instruct our photo editor how to adjust image colors. More precisely — to tell which new color corresponds to each of the original colors. Let’s modify our curve to mean something. The picture I’ve chosen looks a bit too bland to me, we will do some color correction using this curve: add some contrast and brightness, then apply it. This is a pretty standard workflow if you work with photo editing or image processing.
>
> ![](https://miro.medium.com/v2/resize:fit:1000/1*p4byBGJSxoq5wL5S1prKMQ.png)
>
> Before and After applying the curve. Photo by the author.
>
> The image changed — every pixel of it became brighter, but the amount of added brightness was different depending on the original color value. Krita went through the photo, pixel by pixel, looked up that pixel on the horizontal axis of the curve, and applied the value corresponding to the vertical axis. You can say that curve was **_“mapping”_** original colors to new colors, which is exactly what our second definition of a curve is!
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*URmn6OZVvcadeAmN52ROyg.png)
>
> “Mapping” or “Lookup” process. Each pixel is being looked up on the horizontal axis, then mapped to the vertical axis
>
> > **Nerd Alert**: the concept of a “map” in programming is different from the same concept in history or geography. Computer science “map” isn’t something that tells you where to go, or where a certain thing is located. It rather answers the question of “what’s located at these specific coordinates?”. In this sense all textures are called “maps” in shader programming because given exact coordinates X and Y — it tells you what pixel values are located there. Curves are maps — given one coordinate it tells you what value is located there. Lookup tables are also maps, for the same reason. There are even data structures that are called “maps” in some programming languages, sometimes also called “dictionaries”. Verb “to map” in programming means “to serve as a lookup table” or “convert one set of values to another set of values”.
>
> Why is this example relevant to our subject? What Krita did there, is how shaders work. For every pixel covered by an image, rendered object (or the whole screen), GPU executes a shader program, that outputs resulting pixel properties: color, transparency, light emission, etc. And curves play a huge part in how those final properties are calculated.
>
> # What curves REALLY are
>
> If you play around with the curve editor here you will notice it won’t let you do one specific thing — make a curve in such a way that two points are on top of each other (on the same vertical line) and that’s on purpose. The main property of this type of curve is that for each value of horizontal axis (X), there is exactly 1 possible value of vertical axis (Y). In math, this relationship is called a **_function._** It may sound unexpected, but if you think about what a function does it starts making sense — functions are taking an input value and return an output value, think y=sin(x) as an example. For the same input, it is always returning the same output (e.g. sine of 30 degrees is always equal to 0.5). And that is why there is a restriction on not having two points corresponding to the same input value — so there is only one deterministic lookup value. In math, it would be said that “_the resulting color is a function of the input color”. Y_ou can encounter this phrase written in many different ways, for example:
>
> > **{resulting color} = F({input color})**
>
> or simply
>
> > **_y = f(x)_**
>
> or even
>
> vec3 curve(vec3 original\_color) {  
>     // New color calculation here  
> }
>
> So the curve is really just a way to visualize (graph) or define some mathematical function. Indeed, even if you just drew that curve by hand, there is some formula that describes it. You can describe anything with a math formula, but it doesn’t mean that you should. Instead of thinking about math, you can visually edit a curve by dragging your mouse — very practical and intuitive. Though sometimes the curve is so simple that it’s easier to write **_(Y=X²)_** and you will be understood by people and computers. Defining it with formula also has the benefit of you being able to copy-paste its definition from an online tutorial or between different software. And that is how shaders are usually written — some simple but super-useful functions (curves) are already implemented in the shader language itself, the rest you can either write with a formula (if they are simple enough) or just draw visually and store in a texture _(a “map”)._ **The further we go the more useful it becomes — thinking about textures, maps, curves, and functions interchangeably.** This is the first important intuitive rule we need to learn: formulas, curves, maps, textures, lookup tables, and _changes (yes, that broadly!)_ can be the same thing. To change something in your shader effect means finding a way to define how its current look should be mapped to its desired look. Initially, every point on the screen (or surface of an object) has some color, coordinates, the direction they are facing, etc. Every shader effect is a set of rules/formulas/curves/textures that map those bland boring default values to new ones that look exciting — explosions, ocean surfaces, lightning bolts, and so on. This may sound counter-intuitive at first, but eventually, it will “click” with you.
>
> # Finally, we get to write shaders!
>
> Let’s implement one of the simple functions. Create a QuadMesh or a PlaneMesh and put a new shader material onto it:
>
> // We will go into detail about each line a bit later  
> shader\_type spatial;
>
> void fragment() {  
>  float curved\_value = pow(UV.x, 3.0); // This is our curve right here  
>  vec3 red\_color = vec3(1.0, 0.0, 0.0);  
>  ALBEDO = red\_color \* curved\_value;  
> }
>
> You will see something like this:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*P9do_W2CEvoSDQYd6bAjsg.png)
>
> Added a simple floor texture underneath to retain the sense of space. The floor texture is taken from [here](https://opengameart.org/content/grid-placeholder-texture)
>
> Every pixel on our rectangle has a coordinate value UV, relative to its top left corner (0,0). For each pixel, we map the horizontal coordinate UV.x to color. Function input (UV.x) represents the position on the strip: 0 — left edge, 1 — right edge, fractional values — everything in between. Higher values of UV.x map to more saturated red. In other words we turned coordinates into colors. It’s conceptually very similar to the color correction exercise we’ve done in the beginning. Just coordinate to color this time. Also, we didn’t draw the curve this time, we defined it with shader code. The curve that we just implemented is called the exponentiation function (though it doesn’t really matter how it’s called :)). Spelled as one of the:
>
> -   **_X to the power of N_**
> -   **_x^n_**
> -   **_Xⁿ_**
> -   **_pow(X, n)_**
>
> We introduced a new letter here: **N**. It’s not a function input, because we aren’t mapping this value to anything, but it affects how the function behaves — it’s called a **parameter**. A function can have many parameters or none at all. The parameter value in our code is equal to 3.0.
>
> > **Nerd Alert! Long read — skip if you aren’t into linguistics.**
> >
> > There is a small “gotcha” here — shader concepts are borrowing deeply from math, yet use programming as their tool. Concepts of “**function**”, “**variable**” and “**parameter**” appear in both areas and are slightly different between math and computer science.
> >
> > In programming a **“function” is a set of commands** (just a piece of any code, really) that can be executed with some parameters passed to it. **Anything that goes into the function is called a “parameter” or “argument”**. All the values (including parameters and function output) **that can have more than 1 possible value are called “variables”.** Those **values that are fixed in your code are called constants**. You can create your own constants and use them, and then change them anyway.
> >
> > Now, in mathematics it’s different: **a function is something that maps one set of values to another set of values.** **The values that are being mapped are called “independent variables” or “arguments”** — they change between calls to the function. Additional **values sent into the function that are picked once are “parameters”**. Finally, math constants are never changed, not just in your math, **everyone’s math shares the constants** (e.g. Pi — is the same value for everyone, it’s a constant).
> >
> > This is a bit of a mess. To avoid too much confusion, shader programs have their own new term — the concept of math parameter is called a **“uniform” or “shader parameter”**. The thinking is the following: the values of variables change — every pixel has its own color, its own coordinate on the screen, facing direction vector, etc. But (in case of Y=Xⁿ function) the power to which we raise the value (n) is the same for every pixel. **We pick it once, and then it’s uniform for every pixel.**
> >
> > “**Variable**” , “**Function**”, **“Argument”** and “**Parameter”** are used in computer science sense. When we refer to math parameter — we say**“uniform”.** When we refer to math independent variable (X, Y, Z, etc) — we just say what it is — “Color”, “Angle”, “Width”, “Coordinates”, “Normal Vector” and so on.
>
> Let’s see how different parameter values affect the final image:
>
> ![](https://miro.medium.com/v2/resize:fit:1000/1*LrkiXe34zLxKM0Wmz5YxAg.png)
>
> Different values of the parameter **n** in **pow(UV.x, n)**. Charts plotted with [GeoGebra](https://www.geogebra.org/graphing)
>
> What we see is the effect of “bending” a linear color gradient into a custom falloff. Low exponent (values under 1.0) bends the curve upwards, making even the darkest colors bright, high numbers do the opposite: almost all of the color range becomes dark, except the most saturated part of it. Do you see why we started with curves as a tool for color correction? Color gradients are very intuitive and easy to visualize in your head. When you think about complex effects and shader programs, one mental trick is to think about functions as if they all were color gradients and curves. And this is the real power of the curves — **they are tools to easily visualize even the most complex process.** If you learn to visualize curves and their combinations in your head you will be able to create anything imaginable with shaders pretty quickly.
>
> Here are some real-world examples of using this exact curve. This time it maps the viewing angle to color:
>
> ![](https://miro.medium.com/v2/resize:fit:1000/1*8PzW3rs8doY3xKY966QUHw.png)
>
> Simple gradient effect “in the wild”. res://scenes/orb.tscn
>
> You can quickly recreate this effect yourself:
>
> ![](https://miro.medium.com/v2/resize:fit:1000/1*Uc8_YfV-VYwU_En49omKQw.png)
>
> How to create a simple shader in Godot.
>
> And here is the code:
>
> shader\_type spatial;  
> render\_mode unshaded;      // No default shading  
> render\_mode blend\_add;     // Only add bright areas  
> // render\_mode blend\_mix;     // Mix dark areas as well as bright ones  
> render\_mode cull\_disabled; // Show back side of the model
>
> // Make color selectable in UI  
> uniform vec4  base\_color:   source\_color;
>
> // Make curvature selectable in UI with a slider, equal to 3 by default.  
> uniform float curve\_power: hint\_range(0.01, 10.0) = 3.0;
>
> // We custom function to wrap around out formula, we can re-use it later  
> float curve(float x) {  
>    // Our "magic formula" - just a simple <X> to the power of <curve\_power>  
>    return pow(x, curve\_power);  
> }
>
> // Built-in function name, without it nothing gets drawn  
> void fragment() {  
>    // Dot product = cosine of the angle between vectors  
>    // One of the most useful shader tricks, used literally everywhere   
>    // It tells us where the pixel "looks at"  
>    // 1.0 == "looks straight at us"  
>    // 0.0 == "looks" to the side (left, right, up, anywhere on the rim)  
>    // -1.0 == It looks away from camera view  
>    float VdotN = dot(VIEW, NORMAL);
>
>    // Makes model transparent in the middle, and "thick" at the rim   
>    float view\_angle = 1.0 - abs(VdotN);
>
>    // Now we apply curve to the original color  
>    // We calculate "how much of the color to retain"  
>    // When curve() gives us low number - model is transparent  
>    // Hight number - model is visible  
>    vec4 new\_color = base\_color \* curve(view\_angle);
>
>    // We apply new color, only RGB component.   
>    // There is also new\_color.a - ALPHA (transparency) component  
>    // But it just looks cooler not to use it :) You can experiment and see  
>    ALBEDO = new\_color.rgb;
>
>    // Use original transparency that user picked in the UI  
>    // If we don't put ALPHA value, model won't be transparent at all  
>    ALPHA = base\_color.a;  
> }
>
> I encourage you to copy-paste this code into a new empty shader applied to several different objects. It will make “Shader Parameters” appear in the dock. You can play around with the curvature slider and color (including transparency) to see in real-time how our curve affects the visuals. Also, try swapping between **blend\_add** and **blend\_mix** render modes. The orb example above is using blend\_mix, to allow the orb's dark back to mix into the background. blend\_add mode will only add more light to the existing picture. I’ve applied it to a robot model as an example:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*Gx8tUsL30ku21qVDY9vFrA.gif)
>
> Exactly the same shader code as before, using a different model and color
>
> All the code written for this lesson is available in [this GitHub repo](https://github.com/dreadlocks-dude/godot-fvx-series/). It has comments where needed. If we remove all the comments and educational elements from our code above, the real-world version of the shader could look like this:
>
> shader\_type spatial;  
> render\_mode unshaded, blend\_mix, cull\_disabled;
>
> uniform vec4  base\_color:  source\_color;                   
> uniform float curve\_power: hint\_range(0.01, 10.0) = 3.0;
>
> void fragment() {  
>    ALBEDO = base\_color.rgb \* pow(1.0 - abs(dot(VIEW, NORMAL)), curve\_power);  
>    ALPHA = base\_color.a;  
> }
>
> This is exactly the same program. And this is how most of the code you find online is going to look. Once you learn to understand the basic building blocks of the shader code, you will read this more easily. Meanwhile, if you want to learn from shaders that people share online — you can split the long lines into building blocks and give them names based on what you see, make your best guess about the purpose of each block. I still have to do this sometimes, as it can be tricky to guess what the shader author meant when they wrote their code. Even if the author is yourself 6 months ago. Makes you realize how much we change and how things that were “obvious” once can turn into “Who wrote this?! Oh it was me….”. Do a favor to your future self and document your thought process, break long lines into shorter ones, and **_write comments!_** Comments are an interesting topic, but outside of the scope of this lesson. I am sure we will touch on it more in future lessons. As with any skill, it will come with practice.
>
> Using programming to create shader effects isn’t the only way: if you looked at shaders before, you might have heard about visual editors that allow users to create complex custom effects without a single line of code. They do deliver as advertised, but it takes way more effort and time to use them than it would have taken to write actual code. Also, your shader coding skills are easily transferrable to any visual editor, but not the other way around. We are going to focus on writing shaders through code, and then you can decide if visual editors work better for you. Here is an example of building the code we just wrote above with the Blender Shader Nodes editor:
>
> ![](https://miro.medium.com/v2/resize:fit:1000/1*x-NUJ0m5pUlmrzo9_aGYhQ.png)
>
> Without a single line of code, indeed.
>
> I find it an impractical and slow process. You can’t copy-paste it from some article or an online repository, and you have to implement this whole thing manually or hope someone shares the source file and that it’s compatible with your version of the editor.
>
> # More Curves
>
> There are 3 basic curves that are present in almost every shader out there — **pow()**, **cos(),** and **smoothstep().** We are already familiar with pow(X, n) and its “bending” properties, here are the other two:
>
> ## smoothstep
>
> Visual intuition behind this is threefold:
>
> -   it’s a contrast operation — dark becomes darker, bright becomes brighter
> -   It creates edges and steps in otherwise smooth gradients or surfaces
> -   It defines thresholds or cutoff points for other calculations
>
> Smoothstep() curve has two parameters: **left edge** and **right edge**. Everything to the left of the left edge turns into 0, and everything to the right of the right edge turns into 1. Values in between form a line that gets smoothed when it approaches 0 and 1.
>
> ![](https://miro.medium.com/v2/resize:fit:1000/1*EXd6XYFDzIazNwm2XpmQUw.png)
>
> Smoothstep() function with different parameter values. res://scenes/smooth\_step.tscn
>
> When the left and right edge values are close to each other it creates a threshold or step effect, but it’s not completely abrupt, there is a little bit of gradient left, so the step remains smooth — hence the name. By moving both left and right edge values left and right we move the threshold, which is a vital feature of any shader effect. Let’s take a simple noise “cloud” texture and apply smoothstep() to it:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*RK1ESQUFGIAuAJDj2neFQA.gif)
>
> smoothstep() contrast effect
>
> Now we are going to move both edges together:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*ex9ufKSBSzZiAAm014OcZw.gif)
>
> Threshold movement
>
> This may look familiar to you. This is how most games implement “dissolve” effects.
>
> > **Nerd Alert.** If you were interested, the formula for this curve is pretty simple: **y=3x²-2x³.** To apply edge shift: **x’=(x-left) / (right-left)**
>
> ## sine / cosine
>
> This is another fundamental building block you remember from school, it turns lines into waves, it creates oscillation effects (the animations above use it) and it’s good for creating patterns of all sorts because of its rhythmical repeating nature.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*oFQmnn1MKUaJFGcrZ3Qmpw.png)
>
> y = cos(x)
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*5anRt-HTN4LkxBBrsaHpGg.png)
>
> Cosine visualization. See res://scenes/ripples.tscn
>
> Unlike in previous visualizations, we are trying something different here: instead of color, we map our curve to drive surface properties. Height of the surface on the left, and reflective material values on the right (_metallic and roughness_). We can say that **_distance to center maps to height_** or that **_roughness is a function of position_.** Which is how you may see it referred to.
>
> Quick recap of the first 3 building blocks we’ve learned:
>
> -   **Power curve: Xⁿ**. It lets you “bend” value back and forth, changing the overall strength of the effect you are creating. Yet extreme points 0 and 1 remain the same;
> -   **smoothstep()**. It creates contrasts, smooth edges, steps and lines, and applies thresholds. Guarantees the output to be within the 0 .. 1 range;
> -   **sinusoid: cos(x) or sin(x)**. Creates a natural oscillation and rhythm, repeated patterns. Makes animation feel smooth. Output values are always in the -1 .. 1 range.
>
> You might have noticed a pattern here. It’s the range of input and output values: we try to keep them between 0 and 1. Cosine output is usually scaled to be 0 to 1 from its natural -1 .. 1 too. There are two main reasons for this:
>
> -   most values are already between 0 and 1: Texture and UV coordinates, color component values, transparency, material roughness, animation phase _(0% — just starting, 50% — halfway through, 100% — completed),_ and anything expressed as a percent. Making it very convenient and intuitive to use
> -   We can use the output of one function as input of another, multiply them, combine their values, mixing and matching them.
>
> Most calculations within shader code tend to be normalized to some predefined range, most often 0 … 1. It makes playing with these building blocks feel like you are playing with legos, you can plug them into each other and get something interesting. This is why visual shader editors seem so intuitive — you literally plug blocks into each other with a mouse.
>
> > **Nerd Alert! This note is about coordinate systems, we are going to cover them in later lessons in more detail.**
> >
> > There are two coordinate systems that are used in 3D: **XYZ** and **UV**. The first one, XYZ is what you expect from it — 3D coordinates inside our virtual space. UV is a 2D system that refers to **the surface of a given object.** In the most simple case, when we are drawing on the surface of a quad, UV corresponds to XY on its surface, so **UV.x** is intuitive here — it’s a position on the surface from left to right, **UV.y** — from the top to bottom. More complex meshes have less intuitive UV interpretations. Assigning which point on the surface of the mesh corresponds to which UV coordinate is called **UV mapping —** a very important part of 3D modeling process. You probably see the pattern of every other thing in 3D and gamedev being called some sort of “mapping”**.** When any texture is painted over the 3d model — that’s UV mapping in action.
> >
> > Another difference with regular coordinate system is that UV coordinates don’t have any units. It’s not in meters or feet, it’s just a number between 0 and 1, regardless of the objects size and dimentions. (0.5, 0.5) Point within UV coordinates refers to the center of the surface as defined by the model itself, regardless of where the object is located in our 3D space, and regardless of any tranformations and deformations that the object was subjected to.
> >
> > **EVEN NERDIER ALERT!**
> >
> > If you still insist that there MUST be some unit of measurement here that answers the question “when I say UV.x = 1, it’s 1 of what?” Then you can think of it as “1 of itself”. 0.5 means “I’m halfway through it”. 1.0 means “That’s, it. It’s complete, I’ve reached the edge”. UV.x = 1.5 means “Half of myself worth of distance over the edge in the direction of x”
>
> # Let’s Play
>
> While the Lego blocks analogy is convenient, it has some limitations. Unlike physical blocks, functions can be twisted, squashed, bent, and changed in a way that makes them “fit” places where they wouldn’t fit otherwise. And all these operations are also done with functions. Functions (curves) are simultaneously building blocks, glue, and building tools. They are your everything, and that’s why we need very good intuition and mental visualization techniques to use them. Most of the trial and error happens in your head, not in your code.
>
> To start playing with our blocks we need to learn a few basic tools: how to “move”, “stretch” and “wrap” different curves. Let **cos(x)** be our example.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*fNSRAPWqrCPNzSNHHGuU-g.gif)
>
> **cos(X + n).** Move the curve left and right by adding to / subtracting from the **argument**
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*ohp-s25j4vkDFbG09bOhOg.gif)
>
> **cos(X) + n.** Our parameter is added to the function **output,** moving it up and down
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*Etfh3Xjfe4XrYpBoQCMCJQ.gif)
>
> **cos(X / n).** Dividing the **argument** stretches it, multiplying by it — shrinks
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*pXoAEvMu_OQi9iLGdlQfqw.gif)
>
> **cos(X) \* n.** Multiplying the function **output** by n — stretches or flattens it vertically
>
> Here is another important modifier to any curve: **abs()** — it turns negative values into positive ones. If you apply it to the function output it would “bounce” off the floor
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*NWfzIcdkLIx6oayPLBfqeQ.gif)
>
> **abs(cos(x) + n).** The curve can’t go below y=0 line.
>
> When you apply abs() to the argument X, it creates a mirroring effect:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*rZpbPolQgER0lbQ5XJCjsw.gif)
>
> **cos(abs(x) + n).** Mirror around the vertical axes
>
> Now we have our building blocks and the tools to make them fit. How do we combine them together? There are several ways we can do this:
>
> -   We multiply the outputs of different curves by each other. E.g. **pow(x, 0.5) \* cos(x \* 10)**
> -   We **mix** the values, averaging them in different proportions. Like this: **mix(pow(x, 0.5), cos(x \* 10), 0.3).** This means: make it 70% power curve, 30% cosine.
> -   We chain different modifiers and pass them as parameters to the next function. Like this: **cos(pow(x, 2) \* 10))** or **pow(cos(x \* 10), 0.5).** Which is going to give you different results based on the order
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*9wRbe6MKjsJUS77Hwf5Uqw.png)
>
> **pow(x, 0.5) \* cos(x \* 10)**
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*kUMdJ4tAbg66G2kD4Zyfmw.png)
>
> **mix(pow(x, 0.5), cos(x \* 10), 0.3)**
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*BOl4lJao-xfMv-3Tx9O1Pg.png)
>
> **cos(pow(x, 2) \* 10))**
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*Md-x5VRyhqKynlI3YeOtKw.png)
>
> **pow(cos(x \* 10), 0.5)**
>
> All 4 examples above use the same 2 curves, the only difference is how they are combined.
>
> This chapter above might seem a bit overwhelming. And it’s fine if it is. You don’t have to remember any of it — as you practice more you will inevitably learn this :)
>
> We are finally equipped with tools to start creating something interesting. We mostly worked with the cos(x) curve in the examples above. How far can we get with it? What will the effect made of cosines only look like?
>
> Well, it could be something like this:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*mwEq5WyumsljJehvfH2tvQ.gif)
>
> Everything is a cos(X) here :) res://scenes/torus.tscn
>
> Ribs, twists, animation, and colors are created using cos(x) function. We will return to this example later when we talk about vertex manipulations. It will remain here as a teaser for lesson 3 :)
>
> # Practice: step-by-step effect breakdown
>
> Enough theory for today :) We arrived at a place that will walk through an effect step by step:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*ey7T5kw3DwYTKPkUSdgwvQ.gif)
>
> Simple teleport effect, with no textures involved. Side and Top views. res://scenes/teleport.tscn
>
> The challenge I set for us here is not to use particles or textures, just to see how far we can go with basic curves only.
>
> Let’s break this effect down. It has 3 major components:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*TwBmmU-fT6-gmRJ5vH9KMQ.png)
>
> The effect can be split into 1) Light source; 2) Pillars; 3) Portal
>
> The first one — the light source is the simplest one, it’s just a built-in OmniLight3D. Nothing special here, it makes the whole effect cast light onto items around.
>
> The middle one — light pillars, is simple, elegant, and very versatile, you can adapt it to many different effects. It can be split further into several simple components, each of them being a curve.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*r0uE1sRdIqQe7aEpzOi_Aw.png)
>
> “Light Pillars” effect components.
>
> There are 5 components: I’ve labeled them **A, B, C, D, and E** for simplicity of reference. The first three components look similar and familiar: they are **A = cos(3x), B = cos(2x),** and **C = cos(x).** Let’s see how the effect looks if we add them together:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*tXkk3bod79qO95aVbGc9RA.png)
>
> Adding 3 pillars in different combinations
>
> Usually, 3 different cosine waves added together is enough to create a pattern that isn’t immediately obvious. You can see that just A + C is still a bit too regular.
>
> > Adding things together makes the overall effect brighter, that’s why we either scale the sum down, multiplying it by something less than 1, or use **mix(A, B, 0.5)** to add things together, which is like averaging them, keeping the sum less than 1.
>
> Looking at the result we can clearly tell it’s just a rectangle with some effect on top of it. We need to hide edges somehow. If we were to just add D and E on top of existing pillars, we would make the middle part of the effect even brighter, but the hard edges would remain the same. Instead, we are going to multiply the sum of A+B+C by D and E. When either D or E is equal to 0 — the whole result is 0. This is called a **“mask”**. Whenever we want to apply a certain transparency shape to an existing effect or image — we just multiply by it.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*SihDWJZ12XsP2WJW5CNBkw.png)
>
> Applying masks D and E. Can you guess what’s the formula for D and E?
>
> Good, we are almost there. Though, we forgot something, didn’t we? Animation! Our pillars need to be animated. The simplest way to do it is to use built-in constant **TIME.** It is always equal to the number of seconds since the program started. If we add time to X inside cos(x) — it will make the wave move horizontally, just like we did in the examples above in the “[Let’s Play](https://medium.com/@dreadlocksdude/vfx-series-shaders-lesson-1-power-of-curves-9be476ba6e93#f977)” chapter. If we multiply TIME by some number n — it will make animation faster or slower (n > 1 faster, n < 1 — slower). If we multiply by a negative number — the animation direction will reverse.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*3xZx4XnVt4xGqNmkFt1DRg.gif)
>
> Applying animation with different speeds on each component and combining them together
>
> The final formula is:
>
> **F = (cos(x + TIME \* speed1) + cos(2\*x + TIME \* speed2) + cos(3\*x + TIME \* speed3)) \* pow(Y, n1) \* pow(X, n2);**
>
> _\*This formula is still subject to scalings and fine-tunings._
>
> Here is the full code:
>
> // This is a 3D shader  
> shader\_type spatial;  
> // Pure light, no default shadows and shades  
> render\_mode blend\_add, unshaded;
>
> // Make color selectable  
> uniform vec4 albedo : source\_color;
>
> // Effects configuration  
> uniform float brightness: hint\_range(0.0, 10.0) = 1.0;  
> uniform float small\_lines: hint\_range(0.0, 1.0) = 1.0;  
> uniform float medium\_lines: hint\_range(0.0, 1.0) = 1.0;  
> uniform float big\_lines: hint\_range(0.0, 1.0) = 1.0;  
> uniform float horizontal\_fade: hint\_range(0.001, 1.0) = 1.0;  
> uniform float vertical\_fade: hint\_range(0.001, 10.0) = 2.0;  
> uniform float animation\_speed: hint\_range(0.01, 5.0) = 1.0;
>
> // Simple cosine wave, moving horizontaly over time  
> float animate\_cos(float phase, float speed) {  
>  return pow(0.5 \* cos(phase \* TAU + TIME \* speed \* animation\_speed) + 0.5, 2.0);  
> }
>
> void vertex() {  
>  // Make it always face camera direction, copied from Godot source code  
>  // Code imitted, see original on github  
> }
>
> void fragment() {  
>  // Apply user-selected color and transparency   
>  ALBEDO = albedo.rgb;  
>  ALPHA = albedo.a;
>
>  // Move point (0, 0) to quad center  
>  vec2 centered\_UV = UV \* 2.0 - 1.0;
>
>  // This is where the "magic" happens  
>  float vertical\_lines = 0.0;  
>  vertical\_lines += animate\_cos(centered\_UV.x \* 0.9, \-2.1) \* big\_lines;  
>  vertical\_lines += animate\_cos(centered\_UV.x \* 1.9, \-1.1) \* medium\_lines;  
>  vertical\_lines += animate\_cos(centered\_UV.x \* 2.9, 3.1) \* small\_lines;  
>  vertical\_lines \*= brightness;
>
>  // Apply lines if there are any, keep solid color otherwise  
>  // This is done for demo purposes only, to make components   
>  // Of the effect visible  
>  if (small\_lines + medium\_lines + big\_lines > 0.01) {  
>   ALPHA \*= vertical\_lines;  
>  }
>
>  // Fade out left and right edges  
>  ALPHA \*= pow(cos(centered\_UV.x \* PI) \* 0.5 + 0.5, horizontal\_fade);
>
>  // Fade out top and bottom  
>  ALPHA \*= pow(1.0 - abs(centered\_UV.y), vertical\_fade);
>
>  // We implement fading differently for vertical and horizontal,   
>  // just to illustrate the idea that  
>  // different curves can achieve very similar effects  
> }
>
> To make things faster and more fun we are using “uniforms”. **Uniforms** (or “**Shader Parameters**” when displayed in UI) allow you to avoid specifying parameter values in the shader code itself and do it later in UI. They are immensely useful, defining them saves a lot of time and creates way better visual results, as they let you try many different combinations and values quickly — you choose the best option. You may not even need to ever touch that code again if enough parameters are exposed. This is exactly what game engines and 3d editing software do — they create enough parameters for you to play around with in UI and achieve great effects. It also lets you create presets (a.k.a. “Materials”): save different combinations of parameters, and apply them later when needed. You can store your shader and share it with others, who may not know how to write or read shaders code but still can use your shader to create visual effects. You can hand it over to your non-technical friends and ask them to play around with the parameters. Having to do it by manually changing values in code every time you want to try a new value would take forever. You eventually would give up and settle on a “good enough” value, which is going to be not the most good-looking one.
>
> Let’s combine this effect with a basic light and try a few different combinations of parameters (values for our uniforms):
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*V1QwWUs_HlSevxY5u0PdbA.gif)
>
> The same shader with 3 different variations, was made using UI parameters only.
>
> Now we start seeing something very important: shader programs aren’t one-off effects, they let you create whole classes of effects with one program, and then re-use it again and again, changing UI sliders and parameters.
>
> Finally, we are ready for the third component of our effect. Let’s split it into steps:
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*QUo4LQU1nM9vwSNEtyP-9A.png)
>
> Splitting the “Beam” effect into its components
>
> As you can see, all the things here are familiar. **A** and **B** are exactly the same effects as we have just seen above. **C** and **D** — same fading effect as we had before. **E** — remember the red orb and see-through robot? — that’s the same one. **F —** might be the only one that seems new. If you look at how the sides are getting wider near the bottom, you will recognize the **pow(X, n)** curve from the very beginning, just rotated to be vertical instead, and applied to vertex positions. We haven’t covered vertex manipulations yet, so don’t stress if you don’t know how to do this just yet. As a small challenge for yourself, try to achieve a similar effect, by using just a cylinder and a disk underneath it using only the things we learned so far.
>
> Let’s combine our effects back together and try different effect mixing combinations. Just like the last time¹.
>
> > ¹**Nerd Alert:** What we actually are doing here is slightly different:
> >
> > **A \* (B \* effect strength + 1.0 — effect strength) \* C \* D \* E**
> >
> > This neat trick of X \* n + (1 — n) allows you to mix two values gradually, in this case turning B into 1, so when we set effect\_strength to 0, it will be equal to **B \* 0 + 1.0–0,** effectively to 1.0, and when you multiply by one — nothing happens. In other words, you can gradually fade certain components of the effect away. This feature is already built-in into shader languages. It will be this:
> >
> > A \* **mix(1.0, B, strength)** \* C \* D \* E
> >
> > You can mix any two values in certain proportions. Very useful in combination with uniforms. You can add multiple effects, and then let the user (or yourself) fine-tune their combinations. Also, you can apply a function to the **strength** variable, creating even more effects. E.g. shine brighter as the player becomes closer.
>
> ![](https://miro.medium.com/v2/resize:fit:700/1*q-ftnxdgHSnwNyUoSVN-Iw.gif)
>
> Different parameter combinations and object sizes, same shaders.
>
> Just like in the previous step — depending on the values we give to our shader parameter sliders we can get drastically different results. Each combination can be saved as a separate **material.** When multiple materials use the same shader, they all get affected by shader code changes. Which can be very handy in cases when you find a bug or want to add a new cool feature to your shader. I encourage you to open the project files, play around with the values, and see how far you can take this. The full code of the shader is [here](https://github.com/dreadlocks-dude/godot-fvx-series/blob/master/shaders/teleport.gdshader).
>
> This has been a very long “tutorial”. Let me know if you have any questions or suggestions. I will appreciate any feedback you might have (seriously, everything helps). Was it too long or too short? Too difficult or too simple? Not enough examples/images or maybe too many? Does the way I describe and explain this work for you? You can reach me through [reddit](https://www.reddit.com/user/Dreadlocks_Dude/) or [patreon](https://www.patreon.com/DevJourney), I’m also checking godot [community](https://www.reddit.com/r/godot/) frequently. Github repository for this article is [here](https://github.com/dreadlocks-dude/godot-fvx-series).
>
> Thank you so much for reading!
