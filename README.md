# ChatGP API Credits Check

This script was created following the instructions provided in the OpenAI community forum.
You can find the original discussion and detailed steps at this [link](https://community.openai.com/t/get-the-remaining-credits-via-the-api/18827/13).

## How to Execute the Script

To check your OpenAI API credits using the `check_openai_credits.sh` script, follow these steps:

1. Ensure you have `curl` and `jq` installed on your system. You can install them using the following commands:
   - For Debian/Ubuntu-based systems:

     ```sh
     sudo apt-get update
     sudo apt-get install curl jq
     ```

   - For macOS:

     ```sh
     brew install curl jq
     ```

   - For other systems, refer to your package manager's documentation.

2. Download the `check_openai_credits.sh` script to your local machine.

3. Make the script executable by running the following command:

   ```sh
   chmod +x check_openai_credits.sh
   ```

4. Execute the script by running:

   ```sh
   ./check_openai_credits.sh
   ```

5. Follow the on-screen prompts to log in to OpenAI and obtain your session key.

6. Paste your session key when prompted, and the script will display your remaining credits and expiration date.

By following these steps, you will be able to execute the `check_openai_credits.sh` script and check your OpenAI API credits.

## How to Find the Authorization Bearer

To check your OpenAI API credits, you need to obtain your session key, which will be used as the authorization bearer. Here are two methods to find it:

### Method 1: From a Browser

1. Open your browser and go to the [OpenAI login page](https://platform.openai.com/login).
2. Log in with your OpenAI account credentials.
3. Once logged in, open the browser's developer tools (usually by pressing `F12` or `Ctrl+Shift+I`).
4. Go to the "Network" tab in the developer tools.
5. Refresh the page or perform any action that makes a request to the OpenAI API.
6. Look for a request to `https://api.openai.com` in the list of network requests.
7. Click on the request and go to the "Headers" section.
8. Under "Request Headers," find the `Authorization` header. The value will be in the format `Bearer YOUR_SESSION_KEY`.
9. Copy the session key (the part after `Bearer `) and use it as your authorization bearer.

### Method 2: Using Proxyman

1. Download and install [Proxyman](https://proxyman.io/).
2. Open Proxyman and start a new session.
3. Configure your browser or device to use Proxyman as the proxy.
4. Open your browser and go to the [OpenAI login page](https://platform.openai.com/login).
5. Log in with your OpenAI account credentials.
6. In Proxyman, look for a request to `https://api.openai.com` in the list of captured network requests.
7. Click on the request and go to the "Request" tab.
8. Find the `Authorization` header. The value will be in the format `Bearer YOUR_SESSION_KEY`.
9. Copy the session key (the part after `Bearer `) and use it as your authorization bearer.

By following these steps, you will be able to obtain the authorization bearer needed to check your OpenAI API credits using the provided script.
