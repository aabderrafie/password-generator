import random
import string
import time
import os
from colorama import Fore, Back, Style, init

init(autoreset=True)

def clear_screen():
    """Clear the terminal screen based on operating system"""
    os.system('cls' if os.name == 'nt' else 'clear')

def print_banner():
    """Print a colorful banner for the password generator"""
    banner = f"""
{Fore.CYAN + Style.BRIGHT}╔══════════════════════════════════════════════════════════╗
║                                                          ║
║  {Fore.YELLOW}██████╗  █████╗ ███████╗███████╗██╗    ██╗ ██████╗ ██████╗ ██████╗{Fore.CYAN}  ║
║  {Fore.YELLOW}██╔══██╗██╔══██╗██╔════╝██╔════╝██║    ██║██╔═══██╗██╔══██╗██╔══██╗{Fore.CYAN} ║
║  {Fore.YELLOW}██████╔╝███████║███████╗███████╗██║ █╗ ██║██║   ██║██████╔╝██║  ██║{Fore.CYAN} ║
║  {Fore.YELLOW}██╔═══╝ ██╔══██║╚════██║╚════██║██║███╗██║██║   ██║██╔══██╗██║  ██║{Fore.CYAN} ║
║  {Fore.YELLOW}██║     ██║  ██║███████║███████║╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝{Fore.CYAN} ║
║  {Fore.YELLOW}╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ {Fore.CYAN} ║
║                                                          ║
║  {Fore.GREEN}██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗{Fore.CYAN} ║
║  {Fore.GREEN}██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗{Fore.CYAN}║
║  {Fore.GREEN}██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝{Fore.CYAN}║
║  {Fore.GREEN}██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗{Fore.CYAN}║
║  {Fore.GREEN}╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║{Fore.CYAN}║
║  {Fore.GREEN}╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝{Fore.CYAN}║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
    """
    print(banner)
    print(f"{Fore.MAGENTA + Style.BRIGHT}     Created by: {Fore.WHITE}Abderrafie     {Fore.BLUE}GitHub: {Fore.WHITE}github.com/aabderrafie")
    print(f"{Fore.CYAN + Style.BRIGHT}══════════════════════════════════════════════════════════════")

def generate_password(length):
    """
    Generate a strong password of specified length that includes:
    - Uppercase letters
    - Lowercase letters
    - Numbers
    - Special characters
    """
    uppercase_letters = string.ascii_uppercase
    lowercase_letters = string.ascii_lowercase
    digits = string.digits
    special_chars = "!@#$%^&*()-_=+[]{}|;:,.<>?/"
    
    password = [
        random.choice(uppercase_letters),
        random.choice(lowercase_letters),
        random.choice(digits),
        random.choice(special_chars)
    ]
    
    # Fill the rest of the password with random characters from all sets
    all_chars = uppercase_letters + lowercase_letters + digits + special_chars
    password.extend(random.choice(all_chars) for _ in range(length - 4))
    
    # Shuffle the password to make it more random
    random.shuffle(password)
    
    # Convert the list to a string
    return ''.join(password)

def animate_loading():
    """Display an animated loading effect"""
    print(f"\n{Fore.YELLOW}Generating secure password", end="")
    for _ in range(5):
        time.sleep(0.3)
        print(f"{Fore.YELLOW}.", end="", flush=True)
    print("\n")

def display_password_strength(length):
    """Display a visual indicator of password strength"""
    if length < 8:
        strength = f"{Fore.RED}Weak"
        bar = f"{Fore.RED}[{'█' * 2}{' ' * 8}]"
    elif length < 12:
        strength = f"{Fore.YELLOW}Medium"
        bar = f"{Fore.YELLOW}[{'█' * 5}{' ' * 5}]"
    elif length < 16:
        strength = f"{Fore.GREEN}Strong"
        bar = f"{Fore.GREEN}[{'█' * 8}{' ' * 2}]"
    else:
        strength = f"{Fore.CYAN + Style.BRIGHT}Very Strong"
        bar = f"{Fore.CYAN}[{'█' * 10}]"
    
    print(f"{Fore.WHITE}Password Strength: {strength}")
    print(f"Security Level: {bar}")

def main():
    clear_screen()
    print_banner()
    
    try:
        length = int(input(f"\n{Fore.WHITE + Style.BRIGHT}Enter password length {Fore.CYAN}(minimum 8 recommended){Fore.WHITE}: "))
        if length < 4:
            print(f"\n{Fore.RED + Style.BRIGHT}Password length must be at least 4 characters to include all character types.")
            return
        
        animate_loading()
        password = generate_password(length)
        
        print(f"\n{Fore.CYAN + Style.BRIGHT}╔═══════════════════ YOUR PASSWORD ═══════════════════╗")
        print(f"{Fore.CYAN + Style.BRIGHT}║                                                      ║")
        
        # Center the password in the display box
        padding = (52 - len(password)) // 2
        print(f"{Fore.CYAN + Style.BRIGHT}║{' ' * padding}{Fore.WHITE + Style.BRIGHT}{password}{' ' * (52 - padding - len(password))}{Fore.CYAN + Style.BRIGHT}║")
        
        print(f"{Fore.CYAN + Style.BRIGHT}║                                                      ║")
        print(f"{Fore.CYAN + Style.BRIGHT}╚══════════════════════════════════════════════════════╝")
        
        # Display password strength
        display_password_strength(length)
        
        print(f"\n{Fore.YELLOW + Style.BRIGHT}Remember to store your password securely!")
        print(f"{Fore.YELLOW + Style.BRIGHT}Never share your password with anyone!")
        
    except ValueError:
        print(f"\n{Fore.RED + Style.BRIGHT}Please enter a valid number for the password length.")

if __name__ == "__main__":
    main()