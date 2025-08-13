import React from 'react';
import './styles.css';

function App() {
  return (
  <div className="container">
    <h1>Welcome to My React App</h1>
    <p>This app is running in Kubernetes!</p>
    <p>
      It only took 47 `kubectl apply`s, 3 existential crises, and a port that ghosted me harder than my last date.
    </p>
    <p>
      But hey—if you're reading this, the YAML gods have finally smiled upon us.
    </p>
  </div>
);

export default App;
