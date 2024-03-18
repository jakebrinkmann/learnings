# References

- [freeCodeCamp](https://www.freecodecamp.org/news/get-started-with-tailwindcss/)

# Using NodeJS

````
npm install tailwindcss
npx tailwindcss init
```

[Config docs](https://tailwindcss.com/docs/configuration/)

Using tailwind directives (not valid CSS)

```
// tailwind.css
@tailwind base;
@tailwind components;
@tailwind utilities;
h1 {
  color: purple;
}
```

```
npx postcss tailwind.css -o public/style.css
```

# Import via CDN

```
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.10/tailwind.min.css">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@1.2.0/dist/tailwind.min.css">
```

# Usage


flex - display: flex.
justify-center - justify-content: center.
mt-10 - margin-top: 2.5rem
items-center - align-items: center
text-xl - font-size: 1.25rem
md:text-xl
bg-red-300 - background-color: #feb2b2
rounded - border-radius: 0.25rem
mx-20 - margin-left: 5rem and margin-right: 5rem
hover:bg-red-600 - applies a background color of #e53e3e on hover pseudo state.
hover:text-white - applies a color of white on hover pseudo state.
underline: text-decoration: underline
font-bold: font-weight: bold

```
<div
  className='flex justify-center mt-10 items-center'
>
  <h1 className='text-xl md:text-4xl'>
    Hello
  </h1>
  <button
    className='bg-red-300 p-2 rounded mx-20 hover:bg-red-600 hover:text-white'
  >
    Click me!
  </button>
  <a
    href='https://google.com'
    className='underline font-bold'
  >
    Google
  </a>
</div>
```
