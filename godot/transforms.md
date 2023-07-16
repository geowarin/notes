

# Cross product

Returns a vector perpendicular to two other vectors.

Useful for creating a basis for a rotation on a single plan.

```csharp
var leftAxis = Vector3.Up.Cross(direction).Normalized();
var rotationBasis = new Basis(leftAxis, Vector3.Up, direction).Orthonormalized();
```

Note: if both vectors are units and perpendicular, then the
resulting vector is also unit.

Hence, basis is orthonormal.


# Dot product

Measures how much two vectors are orthogonal

if `dot(v1, v2) = 0`, they are orthogonal.

if `dot(v1, v2) = 1`, they are parallel.
