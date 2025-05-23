import subprocess
import sys

# IMPORTANT:
# This script needs to be run with administrative privileges to successfully register a DLL.
# You can do this by running your command prompt or terminal as an administrator
# and then executing the script from there.
#
# Example usage:
# python register_dll.py "C:\path\to\your.dll"

# Check if a command-line argument (DLL path) is provided.
if len(sys.argv) < 2:
    print("Usage: python register_dll.py <path_to_dll>")
    sys.exit(1)

# Get the DLL path from the first command-line argument.
dll_path = sys.argv[1]

# Construct the command to register the DLL.
# regsvr32.exe is a command-line utility in Windows that registers and unregisters OLE controls,
# such as DLLs and ActiveX controls, in the Windows Registry.
# The /s flag stands for "Silent" mode, which means it won't display any dialog boxes.
command = f"regsvr32.exe /s \"{dll_path}\""

try:
    # Execute the command.
    # shell=True is used for simplicity here, allowing the command to be passed as a string.
    # Be mindful of security implications if the input (dll_path) were not controlled.
    # check=False prevents subprocess.run() from raising an exception for non-zero return codes,
    # allowing us to handle the return code manually.
    result = subprocess.run(command, shell=True, check=False, capture_output=True, text=True)

    # Check the return code.
    if result.returncode == 0:
        print(f"DLL registered successfully: {dll_path}")
    else:
        print(f"Failed to register DLL: {dll_path}. Return code: {result.returncode}")
        if result.stdout:
            print(f"stdout: {result.stdout}")
        if result.stderr:
            print(f"stderr: {result.stderr}")

except FileNotFoundError:
    print(f"Error: regsvr32.exe not found. Ensure it is in your system's PATH.")
except Exception as e:
    print(f"An unexpected error occurred: {e}")
