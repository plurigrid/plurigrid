from playwright.sync_api import sync_playwright

def extract_local_storage_value(url, key):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        context = browser.new_context()
        page = context.new_page()
        page.goto(url)
        local_storage_value = page.evaluate(f"localStorage.getItem('{key}')")
        browser.close()
        return local_storage_value

if __name__ == "__main__":
    url = "http://localhost:5173/"
    key = "FLUX_REACT_FLOW_DATA"
    value = extract_local_storage_value(url, key)
    print(value)
