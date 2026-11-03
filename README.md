# Currency and Weather CLI

## Problem Statement

Freelancers and other individuals in Cameroon who receive payments in foreign currencies such as US Dollars (USD) and Euros (EUR) often need a quick way to convert their earnings into local currency (XAF). Additionally, planning daily activities can be challenging without access to current weather information, especially during rainy seasons.

Checking exchange rates and weather conditions manually can be inconvenient and time-consuming.

## Project Goals

The goal of this project is to develop two Bash command-line tools that retrieve real-time information from external APIs.

- **Currency Converter (`fx.sh`):** Convert between different currencies using live exchange rates.
- **Weather Tool (`meteo.sh`):** Retrieve current weather conditions, including temperature, description, and humidity, for any specified city.

The project also aims to demonstrate how Bash scripts can communicate with external APIs, process JSON responses, validate user input, and handle network errors.

## Tech Stack

- **Bash:** Scripting language.
- **cURL:** Making HTTP requests to external APIs.
- **jq:** Extracting and processing JSON data.
- **awk:** Performing currency calculations.
- **ExchangeRate API:** Providing live currency exchange rates.
- **wttr.in:** Providing current weather information.
- **Git and GitHub:** Version control and project hosting.

## Features

### Currency Converter (`fx.sh`)

- Converts currencies using live exchange rates.
- Accepts uppercase and lowercase currency codes.
- Validates amounts and currency codes.
- Displays converted amounts to two decimal places.
- Handles unsupported currencies and API errors.

### Weather Tool (`meteo.sh`)

- Retrieves current weather information for a specified city.
- Uses Yaounde as the default city.
- Supports city names containing spaces.
- Displays temperature, weather description, and humidity.
- Handles network errors.

## Installation and Setup

1. Clone the repository:

   ```bash
   git clone YOUR_REPOSITORY_URL
   ```

2. Navigate into the project directory:

   ```bash
   cd bash-11-currency-weather-cli
   ```

3. Install the required dependencies:

   ```bash
   sudo apt install curl jq gawk
   ```

4. Make the scripts executable:

   ```bash
   chmod +x fx.sh meteo.sh
   ```

## Usage

### Currency Conversion

```bash
./fx.sh 100 USD XAF
```

General format:

```bash
./fx.sh AMOUNT FROM TO
```

### Weather Information

```bash
./meteo.sh
```

Specify a city:

```bash
./meteo.sh Bamenda
```

Specify a city with spaces:

```bash
./meteo.sh "Douala Bonaberi"
```

## Screenshots

### Currency Converter

<!-- Add your currency converter screenshot below -->
![alt text](<screenshots/Screenshot From 2026-11-03 01-21-28.png>)

### Weather Tool

<!-- Add your weather tool screenshot below -->
![alt text](<screenshots/Screenshot From 2026-11-03 01-20-14.png>)

## What I Learned

- Writing reusable Bash functions.
- Validating command-line arguments.
- Making API requests using cURL.
- Processing JSON responses with jq.
- Performing calculations using awk.
- Handling API and network errors.
- Managing project versions with Git and GitHub.

## Author

**Tata Stanley Mbajing**  
Frontend Developer  
Email: YOUR_EMAIL_ADDRESS
