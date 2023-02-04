public static class Enumerables
{
    public static IEnumerable<T> NonNull<T>(params T?[] args)
    {
        foreach (var arg in args)
        {
            if (arg is not null)
            {
                yield return arg;
            }
        }
    }

    public static void Each<T>(this IEnumerable<T> enumerable, Action<T, int> action)
    {
        var i = 0;
        foreach (var e in enumerable) action(e, i++);
    }

    public static IEnumerable<T> Flatten<T>(this IEnumerable<IEnumerable<T>> enumerable) => enumerable.SelectMany(it => it);
    public static string JoinToString<T>(this IEnumerable<T> enumerable, string separator = ",") =>
        string.Join(separator, enumerable);

    public static Dictionary<TKey, List<T>> GroupToDictionary<TKey, T>(this IEnumerable<T> enumerable, Func<T, TKey> keySelector)
        where TKey : notnull => enumerable.GroupBy(keySelector).ToDictionary(group => group.Key, group => group.ToList());

    public static IEnumerable<TResult> SelectNonNull<TSource, TResult>(
        this IEnumerable<TSource> source,
        Func<TSource, TResult?> selector)
        where TResult : class =>
        source.Select(selector).Where(e => e != null)!;

    public static IEnumerable<TResult> SelectNonNull<TSource, TResult>(
        this IEnumerable<TSource> source,
        Func<TSource, int, TResult?> selector)
        where TResult : class =>
        source.Select(selector).Where(e => e != null)!;
}
