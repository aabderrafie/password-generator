# Password Generator

A powerful and visually appealing password generator available in both Python and Bash versions. This tool creates strong, secure passwords with customizable length and displays the password strength with a colorful interface.

![Password Generator Demo](https://github.com/aabderrafie/password-generator/raw/main/demo.gif)

## Features

- 🔐 Generates strong passwords with a mix of uppercase letters, lowercase letters, numbers, and special characters
- 📊 Displays password strength indicators
- 🎨 Beautiful ASCII art interface with colors
- 🔄 Password shuffling for increased randomness
- ⏱️ Loading animation for a better user experience

## Python Version

### Requirements

- Python 3.6+
- Colorama library

### Installation

1. Clone the repository:
```bash
git clone https://github.com/aabderrafie/password-generator.git
cd password-generator
```

2. Create and activate a virtual environment (recommended):
```bash
# On Windows
python -m venv venv
venv\Scripts\activate

# On macOS/Linux
python -m venv venv
source venv/bin/activate
```

3. Install the required packages:
```bash
pip install colorama
```

### Usage

Run the Python script:
```bash
python password_generator.py
```

## Bash Version

### Requirements

- Bash shell (available on most Unix-like systems)

### Installation

1. Clone the repository (if you haven't already):
```bash
git clone https://github.com/aabderrafie/password-generator.git
cd password-generator
```

2. Make the script executable:
```bash
chmod +x password_generator.sh
```

### Usage

Run the Bash script:
```bash
./password_generator.sh
```

## How It Works

Both versions of the password generator:

1. Display a colorful ASCII art banner
2. Prompt you to enter the desired password length
3. Generate a secure password that includes:
   - At least one uppercase letter
   - At least one lowercase letter
   - At least one number
   - At least one special character
4. Shuffle the characters to ensure randomness
5. Display the generated password in a styled box
6. Show the password strength based on its length

## Security Recommendations

- 🔒 Use passwords of at least 12 characters for strong security
- 📝 Store your passwords in a secure password manager
- 🔄 Use different passwords for different accounts
- 🚫 Never share your passwords with anyone

## Screenshot

![Python Version](https://github.com/aabderrafie/password-generator/blob/master/py.png)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- [@Abderrafie](https://github.com/aabderrafie)

## Acknowledgments

- Inspired by the need for strong, secure passwords in today's digital world
- ASCII art generated with the help of various online tools
