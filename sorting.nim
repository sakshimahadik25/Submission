# Function to merge two halves of a sequence
proc merge(arr: var seq[int], l: int, m: int, r: int) =
  var
    n1 = m - l + 1
    n2 = r - m
  var
    L = newSeq[int](n1)
    R = newSeq[int](n2)

  # Copy data to temp sequences L[] and R[]
  for i in 0..<n1:
    L[i] = arr[l + i]
  for j in 0..<n2:
    R[j] = arr[m + 1 + j]

  # Merge the temp sequences back into arr[l..r]
  var
    i = 0
    j = 0
    k = l

  while i < n1 and j < n2:
    if L[i] <= R[j]:
      arr[k] = L[i]
      inc(i)
    else:
      arr[k] = R[j]
      inc(j)
    inc(k)

  # Copy the remaining elements of L[], if there are any
  while i < n1:
    arr[k] = L[i]
    inc(i)
    inc(k)

  # Copy the remaining elements of R[], if there are any
  while j < n2:
    arr[k] = R[j]
    inc(j)
    inc(k)

# Main function to sort arr[l..r] using merge()
proc mergeSort(arr: var seq[int], l: int, r: int) =
  if l < r:
    let m = l + (r - l) div 2  # Same as (l + r) / 2, but avoids overflow for large l and h
    mergeSort(arr, l, m)
    mergeSort(arr, m + 1, r)
    merge(arr, l, m, r)

# Example usage
var data = @[64, 34, 25, 12, 22, 11, 95]
mergeSort(data, 0, len(data) - 1)
echo "Sorted array: ", data
