from colorama import Fore, Back, Style
import requests

def color(content):
	return Fore.GREEN + content + Fore.RESET

def getter():
	r = requests.get("https://ipinfo.io/json")

	data = r.json()

	print(f"\t{color('IP:'.ljust(10))} {data['ip']}")
	print(f"\t{color('City:'.ljust(10))} {data['city']}")
	print(f"\t{color('Country:'.ljust(10))} {data['country']}")
