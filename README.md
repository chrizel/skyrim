# Skyrim Perk Calculator and Respec Tool

This is the source repository of the Skyrim perk calculator at [chrizel.github.io/skyrim/](https://chrizel.github.io/skyrim/).

## Build and Development

This project uses [TypeScript](https://www.typescriptlang.org/), so if you make changes to the source code please make them in the TypeScript files under `src/`. The js files in `build/` are only the build products from the TypeScript compiler. The `build/` directory is also part of the versioned repository because the site is hosted via GitHub Pages.

To build this project yourself you need a current [NodeJS](https://nodejs.org/en/) version.

After cloning this repository you should run `npm install` inside of the repository root directory to get the latest build dependencies from `package.json`. Then you have the following possibilities:

- `npm run build` to compile the files from `src/` to `build/`. The `index.html` uses the JavaScript files from `build/` to run the site.
- `npm test` to run the unit tests.
- `npm run test:dev` to run the unit tests in watch mode.
- `npm run server` to launch a local HTTP server to run the site on your local machine for testing.

## History

This project was originally developed in 2011 by using [CoffeeScript](https://coffeescript.org/). At the time, this was one of the preferred tools because it was new, hip and cool. More than ten years later the web has changed and our tools also changed. Beginning of 2022 the original author decided to port the code base over to a more modern foundation using [TypeScript](https://www.typescriptlang.org/) and `package.json` for build dependencies.
