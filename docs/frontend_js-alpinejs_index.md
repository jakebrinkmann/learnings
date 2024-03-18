
https://www.freecodecamp.org/news/learn-alpine-js-in-this-free-tutorial-course/

# [Tutorial to Learn Alpine JS - Full Course for Beginners](https://www.youtube.com/watch?v=VerLjLcXsTk)

Compose JavaScript behavior in-line in the HTML. (More declarative than procedural)
Best use-case is when minimal JS is needed, awesome for server-rendered apps.

## Installation

```
<head>
	<script
    src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@2.8.2/dist/alpine.min.js"
		defer
    crossorigin="anonymous"
	></script>


</head>
```

## Toggle button

State is available within the scope of the div

```
<div x-data="{ isOpen: true }">
	<button x-on:click=" isOpen = !isOpen">Toggle</button>
	<h1 x-show="isOpen">index.html</h1>
</div>
```

## Dropdown/Modal

```
<div x-data="{ open: false }">
  <button @click="open = true">Open Dropdown</button>
  <ul
    x-show="open"
    @click.away="open = false"
    >
    Dropdown Body
  </ul>
</div>
```

## Tooltip

```
<div class="flex min-h-screen items-center justify-center">
  <div x-data="{ tooltip: false }" class="relative z-30 inline-flex">
    <div x-on:mouseover="tooltip = true" x-on:mouseleave="tooltip = false" class="rounded-md px-3 py-2 bg-indigo-500 text-white cursor-pointer shadow">
      Hover over me
    </div>
    <div class="relative" x-cloak x-show.transition.origin.top="tooltip">
      <div class="absolute top-0 z-10 w-32 p-2 -mt-1 text-sm leading-tight text-white transform -translate-x-1/2 -translate-y-full bg-orange-500 rounded-lg shadow-lg">
        Hi, I am Tooltip
      </div>
      <svg class="absolute z-10 w-6 h-6 text-orange-500 transform -translate-x-12 -translate-y-3 fill-current stroke-current" width="8" height="8">
        <rect x="12" y="-10" width="8" height="8" transform="rotate(45)" />
      </svg>
    </div>
  </div>
</div>
```

[Profile Page](profile-dropdown.html)
