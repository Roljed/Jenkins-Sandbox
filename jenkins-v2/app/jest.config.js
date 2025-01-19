const nextJest = require('next/jest');

const createJestConfig = nextJest({
    dir: './',
});

const customJestConfig = {
    setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
    testEnvironment: 'jest-environment-jsdom',
    reporters: [
        'default',
        ['jest-junit', { outputDirectory: './reports', outputName: 'junit.xml' }],
    ],
    testPathIgnorePatterns: [
        '<rootDir>/playwright/', // Ignore Playwright tests
        '<rootDir>/node_modules/', // Ignore node_modules (default behavior)
    ],
};

module.exports = createJestConfig(customJestConfig);
