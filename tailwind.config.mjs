/** @type {import('tailwindcss').Config} */
export default {
	content: [
		'./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}',
		'./node_modules/flowbite/**/*.js',
	],
	theme: {
		extend: {
			colors: {
				'custom-primary': '#7574b5',
				'custom-secundary': '#464473',
				'custom-tertiary': '#14275b',
				'custom-quaternary': '#eff0f4',
				'custom-quinary': '#b7bfe3',
				'custom-senary': '#8e65a9',
				'custom-septenary': '#478dca',
				'custom-nonary': '#4a4b97',
				'custom-denary': '#e77a82',
				'custom-undenary': '#f29140',
				'custom-Tredenary': '#859fd2',
				'custom-Quattuordenary': '#4e4f9d',
				'custom-Quinquadrenary': '#f73131',
				'custom-Sedenary': '#27a243',

				
				'custom-select': '#6b7280',
			},
			fontSize: {
				'min': '0.6rem',
			}
		}
	},
	plugins: [
		//
		require('flowbite/plugin'),
	],
}
