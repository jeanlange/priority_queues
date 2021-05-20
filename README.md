## What is this?
For AcademyPGH book club, we wanted to explore some different data structures. I chose to look at a priority queue, where you can insert items with priorities, and the highest priority one is the one you get when you call `pop`.

Herein we have:
- `array_sort_prioritizer.rb`: This is a naive implementation using an array as the base data structure and keeping it sorted with .sort.
- `sorted_list_prioritizer.rb`: This is a slightly less naive implementation using a linked list as the base data structure and inserting the new item in place in the list to keep it sorted.

Some performance results:
```
performance comparisons
sorting 5000 random numbers
    ArraySortPrioritizer: 10.988809 seconds.
    SortedListPrioritizer: 1.543593 seconds.
sorting 5000 small to big numbers
    ArraySortPrioritizer: 2.697733 seconds.
    SortedListPrioritizer: 0.002756 seconds.
sorting 5000 big to small numbers
    ArraySortPrioritizer: 20.72474 seconds.
    SortedListPrioritizer: 3.223767 seconds.
  ```