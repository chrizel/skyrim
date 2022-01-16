# Skyrim Perk Calculator and Respec Tool

This is the source repository of the Skyrim perk calculator at [chrizel.github.io/skyrim/](https://chrizel.github.io/skyrim/).

## Build and Development

This project uses [TypeScript](https://www.typescriptlang.org/), so if you make changes to the source code please make them in the TypeScript files under `src/`. GitHub Actions is used to build and deploy the project on every push to [chrizel.github.io/skyrim/](https://chrizel.github.io/skyrim/).

To build this project yourself locally you need a current [NodeJS](https://nodejs.org/en/) version.

After cloning this repository you should run `npm install` inside of the repository root directory to get the latest build dependencies from `package.json`. Then you have the following possibilities:

- `npm run build` to build the project.
- `npm test` to run the unit tests.
- `npm run test:dev` to run the unit tests in watch mode.
- `npm run server` to launch a local HTTP server to run the site on your local machine for testing. This requires a build run beforehand.

## History

This project was originally developed in 2011 by using [CoffeeScript](https://coffeescript.org/). At the time, this was one of the preferred tools because it was new, hip and cool. More than ten years later the web has changed and our tools also changed. Beginning of 2022 the original author decided to port the code base over to a more modern foundation using [TypeScript](https://www.typescriptlang.org/) and `package.json` for build dependencies.
