module.exports = {
  transform: {
    '^.+\\.ts?$': 'ts-jest'
  },
  testEnvironment: 'jsdom', 
  
  moduleNameMapper: {
    '^(\\..*)\\.js$': '$1',
  },
  
  testRegex: './src/.*\\.(test|spec)?\\.(ts|ts)$',
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
  "roots": [
    "<rootDir>/src"
  ]
};
