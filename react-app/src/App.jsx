import React from 'react';

function App() {
  return (
    <div className="container">
      <h1>Welcome to My React App</h1>
      <p>This app is running in Kubernetes!</p>
      <p>
        It only took 47 `kubectl apply`s, 3 existential crises.
      </p>
      <p>
        But hey—if you're reading this, the YAML gods have finally smiled upon us.
      </p>
      <footer>
        <p>🚀 Deployed by sheer willpower and caffeine.</p>
      </footer>
    </div>
  );
}

export default App;
