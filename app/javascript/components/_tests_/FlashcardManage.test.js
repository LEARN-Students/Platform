import React from 'react';
import ReactDOM from 'react-dom';
import FlashcardManage from '../FlashcardManage';

it('renders without crashing', () => {
   const div = document.createElement('div');
   ReactDOM.render(<FlashcardManage />, div);
});
