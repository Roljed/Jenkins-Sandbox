import { render, screen } from '@testing-library/react';

import Home from '../pages/index-v2';

describe('Home', () => {
    it('renders a heading', () => {
        render(<Home />);

        const heading = screen.getByText(/hello, next\.js!/i);
        expect(heading).toBeInTheDocument();
    });

    it('renders a button', () => {
        render(<Home />);

        const button = screen.getByRole('button', { name: /click me/i });
        expect(button).toBeInTheDocument();
    });
});
