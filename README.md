## What is this?
For AcademyPGH book club, we wanted to explore some different data structures. I chose to look at a priority queue, where you can insert items with priorities, and the highest priority one is the one you get when you call `pop`.

Herein we have:
- `array_sort_prioritizer.rb`: This is a naive implementation using an array as the base data structure and keeping it sorted with .sort.
- `sorted_list_prioritizer.rb`: This is a slightly less naive implementation using a linked list as the base data structure and inserting the new item in place in the list to keep it sorted.