/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			colors: {
				'custom-primary': '#7574b5',
				'custom-secundary': '#464473',
				'custom-tertiary': '#14275b',
				'custom-quaternary': '#eae6f4',
			
			},
			fontSize: {
				'min': '0.6rem',
			}
		}
	},
	plugins: [],
}
