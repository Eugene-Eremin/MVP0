/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}"
  ],
  theme: {
    screens: {
      '0.5sm': '500px',
      'sm': '640px',
      'md': '768px',
      'lg': '1280px',
      'xl': '1280px',
      '1.5xl': '1430px',
      '2xl': '1536px',
    }
  },
  plugins: [],
}
