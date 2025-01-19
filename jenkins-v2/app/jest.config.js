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
};

module.exports = createJestConfig(customJestConfig);
