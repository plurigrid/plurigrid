import requests
from bs4 import BeautifulSoup
import json
import os
import time
from os import environ
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By



def login():
    # if environment variables set, use them
    # otherwise, prompt user to enter them
    if os.getenv('CHATORG_EMAIL'):
        email = os.getenv('CHATORG_EMAIL')
    else:
        email = input('Enter your Chatorg email: ')
        os.environ.setdefault('CHATORG_EMAIL', email)

    if os.getenv('CHATORG_PASSWORD'):
        password = os.getenv('CHATORG_PASSWORD')
    else:
        password = input('Enter your Chatorg password: ')
        os.environ.setdefault('CHATORG_PASSWORD', password)

    # check environment variables
    assert email == os.getenv('CHATORG_EMAIL')
    assert password == os.getenv('CHATORG_PASSWORD')

    login_url = 'https://app.chatorg.ai/login'
    driver = webdriver.Chrome()

    print("logging in as...")
    print(environ.get("CHATORG_EMAIL"))
    # Navigate to login page
    driver.get(login_url)

    # Find login fields
    email_input = driver.find_element(By.NAME, "email")
    password_input = driver.find_element(By.NAME, "password")

    # Fill & submit login form
    email_input.send_keys(email)
    password_input.send_keys(password)
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
    login()
    time.sleep(5)
    url = 'https://app.chatorg.ai'
    scrape_chat(url)
