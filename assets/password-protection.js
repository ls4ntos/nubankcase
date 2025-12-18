/**
 * Simple Password Protection for Presentation
 * Uses browser prompt (not modal) for password entry
 */

(function() {
  'use strict';
  
  // SET YOUR PASSWORD HERE
  const PASSWORD = 'nubank2025'; // Change this to your desired password
  
  // Check if password is already entered (stored in sessionStorage)
  const PASSWORD_KEY = 'presentation_authenticated';
  
  function checkPassword() {
    // Check if already authenticated in this session
    if (sessionStorage.getItem(PASSWORD_KEY) === 'true') {
      return; // Already authenticated, show content
    }
    
    // Prompt for password using browser's native prompt
    const enteredPassword = prompt('Please enter the password to access this presentation:');
    
    if (enteredPassword === PASSWORD) {
      // Correct password - store in session
      sessionStorage.setItem(PASSWORD_KEY, 'true');
      // Content will show automatically
    } else if (enteredPassword !== null) {
      // Wrong password - show error and retry
      alert('Incorrect password. Please try again.');
      checkPassword();
    } else {
      // User cancelled - show access denied message
      document.body.innerHTML = '<div style="display:flex;align-items:center;justify-content:center;height:100vh;background:#000;color:#fff;font-family:Arial,sans-serif;text-align:center;"><div><h1>Access Denied</h1><p>Password required to view this presentation.</p><button onclick="location.reload()" style="padding:10px 20px;margin-top:20px;background:#fff;color:#000;border:none;cursor:pointer;font-size:16px;border-radius:8px;">Try Again</button></div></div>';
    }
  }
  
  // Initialize password check when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', checkPassword);
  } else {
    checkPassword();
  }
})();

