function generatePassword (longitud) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()';
  let password = '';
  const maxIndex = characters.length - 1;

  for (let i = 0; i < longitud; i++) {
    const randomIndex = Math.floor(Math.random() * (maxIndex + 1));
    password += characters[randomIndex];
  }
  return password
}

let password = generatePassword(15);
console.log("Generated password: " + password);
