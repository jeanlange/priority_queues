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
ArraySortPrioritizer     10.56228           0.000493
SortedListPrioritizer    1.486182           0.000561
GapArrayPrioritizer      0.003143           0.001507
HeapPrioritizer          0.010624           0.016742

sorting 5000 small to big numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     2.468454           0.000482
SortedListPrioritizer    0.002601           0.000505
GapArrayPrioritizer      0.006451           0.001788
HeapPrioritizer          0.008582           0.016696

sorting 5000 big to small numbers
Prioritizer type         push time          pop time
ArraySortPrioritizer     18.461632          0.000479
SortedListPrioritizer    2.997177           0.000507
GapArrayPrioritizer      0.006048           0.00168
HeapPrioritizer          0.004734           0.016672
  ```