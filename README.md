# Plots Creator

Plots Creator is a Phoenix LiveView application that allows users to create and share data visualizations. Users can input datasets and expressions, generate plots using Plotly.js, and collaborate with others.

## Features

- **User Authentication:** Secure login and registration system with password reset functionality.
- **Data Visualization:** Create plots by inputting a dataset and an expression.
- **Plotting Library:** Plots are rendered using [Plotly.js](https://plotly.com/javascript/), a powerful JavaScript graphing library.
- **Real-Time Updates:** Leverages Phoenix LiveView for dynamic and real-time user interactions.
- **User Dashboard:** Manage your plots and view plots shared with you.
- **Flash Messages:** Auto-dismissing flash messages for a better user experience.

## Getting Started

### Prerequisites

- **Elixir**: v1.12 or higher
- **Phoenix Framework**: v1.6 or higher
- **Node.js**: v14 or higher (for asset management)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/imahmedismail/plots-creator.git
   cd plots-creator
   ```

2. Install dependencies:

    ```bash
    mix deps.get
    npm install --prefix assets
    ```

3. Set up the database:

    ```bash
    mix ecto.setup
    ```

4. Start the Phoenix server:

    ```bash
    mix phx.server
    ```

5. Visit `http://localhost:4000` in your browser to see the application.

## Video Recording

[Watch the video on YouTube](https://youtu.be/ONVOaSrUlz4)

## Usage

- **Creating a Plot:** Navigate to 'Your Plots' and click 'New Plot'. Enter the plot name, dataset, and expression, then click 'Create'.
- **Sharing Plots:** Plots can be shared with other users via the 'Shared with you' page.
- **Plot Examples:** Explore the sample dataset provided (earthquake.csv) for quick plotting.

## Acknowledgments

- **Plotly.js:** Used for rendering the plots.
- **Phoenix Framework:** Provides the web and real-time backend.