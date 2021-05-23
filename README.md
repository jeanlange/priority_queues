## What is this?
For AcademyPGH book club, we wanted to explore some different data structures. I chose to look at a priority queue, where you can insert items with priorities, and the highest priority one is the one you get when you call `pop`.

Herein we have:
- `array_sort_prioritizer.rb`: This is a naive implementation using an array as the base data structure and keeping it sorted with .sort.
- `sorted_list_prioritizer.rb`: This is a slightly less naive implementation using a linked list as the base data structure and inserting the new item in place in the list to keep it sorted.
- `gap_array_prioritizer.rb`: This is a broken implementation!! Very fast, though
- `heap_prioritizer.rb`: Pushes into a max binary heap.

Some performance results:
```
performance comparisons
sorting 5000 random numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     10.856191          0.0005
SortedListPrioritizer    1.547606           0.000588
GapArrayPrioritizer      0.003299           0.001384
HeapPrioritizer          0.01125            0.003895

sorting 5000 small to big numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     2.503629           0.000532
SortedListPrioritizer    0.002647           0.000571
GapArrayPrioritizer      0.006918           0.001736
HeapPrioritizer          0.008984           0.004642

sorting 5000 big to small numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     19.827923          0.000575
SortedListPrioritizer    3.162693           0.000567
GapArrayPrioritizer      0.005476           0.001799
HeapPrioritizer          0.004779           0.004771
  ```