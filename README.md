## What is this?
For AcademyPGH book club, we wanted to explore some different data structures. I chose to look at a priority queue, where you can insert items with priorities, and the highest priority one is the one you get when you call `pop`.

Herein we have:
- `array_sort_prioritizer.rb`: This is a naive implementation using an array as the base data structure and keeping it sorted with .sort.
- `sorted_list_prioritizer.rb`: This is a slightly less naive implementation using a linked list as the base data structure and inserting the new item in place in the list to keep it sorted.
- `gap_array_prioritizer.rb`: Uses a sparse array of arrays, where the priority determines the position. Slower at popping.
- `heap_prioritizer.rb`: Pushes into a max binary heap. The 'usual implementation' of a priority queue.

Some performance results:
```
performance comparisons
sorting 5000 random numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     11.078591          0.000538
SortedListPrioritizer    1.540706           0.00056
GapArrayPrioritizer      0.002294           1.145813
HeapPrioritizer          0.00411            0.005171

sorting 5000 small to big numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     2.500763           0.000522
SortedListPrioritizer    0.002954           0.000549
GapArrayPrioritizer      0.000689           1.012277
HeapPrioritizer          0.004136           0.004615

sorting 5000 big to small numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     19.483607          0.00054
SortedListPrioritizer    3.076326           0.00057
GapArrayPrioritizer      0.001985           1.017181
HeapPrioritizer          0.005252           0.004831
  ```