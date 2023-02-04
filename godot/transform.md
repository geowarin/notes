The Z vector on the transform/basis points back (aka south), not forward (aka north). This is intentional and can't easily be changed, and is not something that will be changed, the behavior is already ideal. This is just something that developers have to learn about when jumping into Godot. If you have a suggestion for a documentation improvement, that would be welcome.

If you want a shorthand for Vector3(0, 0, 1) you can use Vector3.BACK.

The purpose of Vector3.FORWARD is such that moving by this vector will move a character forward. For games where the camera angle does not change you always want Vector3(0, 0, -1) as the forward vector. For first person games, you need this in local space, so it's better to use -transform.basis.z, but you can also use basis.xform(Vector3.FORWARD).

These names correspond with other values like Vector3.RIGHT and Vector3.UP. If you have a character facing forward towards Vector3.FORWARD, and they are upright, their right hand will be in the direction of Vector3.RIGHT, etc.


```cs
using Godot;
// Include this line for Godot 3 projects, remove it for Godot 4+ projects.
using Transform3D = Godot.Transform;

public static class TransformExtensions
{
    public static Vector3 Right(this Transform3D transform)
    {
        return transform.basis.x.Normalized();
    }

    public static Vector3 Left(this Transform3D transform)
    {
        return -transform.basis.x.Normalized();
    }

    public static Vector3 Up(this Transform3D transform)
    {
        return transform.basis.y.Normalized();
    }

    public static Vector3 Down(this Transform3D transform)
    {
        return -transform.basis.y.Normalized();
    }

    public static Vector3 Forward(this Transform3D transform)
    {
        return -transform.basis.z.Normalized();
    }

    public static Vector3 Back(this Transform3D transform)
    {
        return transform.basis.z.Normalized();
    }

    public static Vector2 Right(this Transform2D transform)
    {
        return transform.x.Normalized();
    }

    public static Vector2 Left(this Transform2D transform)
    {
        return -transform.x.Normalized();
    }

    public static Vector2 Up(this Transform2D transform)
    {
        return transform.y.Normalized();
    }

    public static Vector2 Down(this Transform2D transform)
    {
        return -transform.y.Normalized();
    }
}
```
