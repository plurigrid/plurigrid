import requests
from bs4 import BeautifulSoup
import json
import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

def login():
    username = os.getenv('CHATORG_USERNAME')
    password = os.getenv('CHATORG_PASSWORD')

    login_url = 'https://app.chatorg.ai/login'
    driver = webdriver.Chrome()

    # Navigate to the login page
    driver.get(login_url)

    # Find the username and password input elements
    username_input = driver.find_element_by_name('username')
    password_input = driver.find_element_by_name('password')

    # Enter your login credentials
    username_input.send_keys(username)
    password_input.send_keys(password)

    # Submit the login form
    password_input.send_keys(Keys.RETURN)

    # Wait for the login to complete
    time.sleep(5)

    return driver


def scrape_chat(url):
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')

        # Find relevant content from the HTML using Beautiful Soup
        # Replace 'YOUR_SELECTOR' with the appropriate CSS selector for the desired content
        content = soup.select('body')

        # Extract relevant information from the content
        # Customize this according to your specific needs
        data = []
        for item in content:
            data.append({
                'property': item.get_text().strip(),
                # Add other properties as needed
            })

        # Save the extracted data as a JSON file
        with open('chatorg.json', 'w') as outfile:
            json.dump(data, outfile, indent=2)
    else:
        print(f'Failed to retrieve content from {url}. Status code: {response.status_code}')

if __name__ == '__main__':
    url = 'https://app.chatorg.ai'
    login()
    scrape_chat(url)
