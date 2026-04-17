import math
from typing import List, Tuple

def build_divided_array(arr: List[float], n: int) -> Tuple[List[str], float]:
    """
    Given an array with an initial float arr[0], repeatedly append:
        arr[-1] / (6)^(1/n)
    until the array has n elements.

    Returns:
      - list of strings formatted to 5 decimal places
      - sum of the numeric floats (not rounded)
    """
    if n <= 0:
        raise ValueError("n must be a positive integer.")
    if not arr:
        raise ValueError("arr must contain at least one initial float.")
    if len(arr) > n:
        raise ValueError("arr already has more than n elements.")

    ratio = 6 ** (1.0 / n)  # (6)^(1/n)

    while len(arr) < n:
        arr.append(arr[-1] / ratio)

    formatted = [f"{x:.5f}" for x in arr]
    total = sum(arr)
    return formatted, total


if __name__ == "__main__":
    # Example usage:
    n = 8
    arr = [5.0]  # initial float in an array

    formatted_arr, total = build_divided_array(arr, n)

    print("Array (5 d.p.):", formatted_arr)
    print(f"Sum:", f"{total:.5f}")
