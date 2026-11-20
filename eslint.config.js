import js from '@eslint/js'
import globals from 'globals'
import pluginReact from 'eslint-plugin-react'
import eslintConfigPrettier from 'eslint-config-prettier/flat'
import { defineConfig } from 'eslint/config'

export default defineConfig([
    {
        files: ['**/*.{js,mjs,cjs,jsx}'],
        ...js.configs.recommended,
        languageOptions: {
            ...js.configs.recommended.languageOptions,
            globals: globals.node,
        },
    },
    pluginReact.configs.flat.recommended,
    eslintConfigPrettier,
])
