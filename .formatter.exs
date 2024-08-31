# .formatter.exs

[
  # Define the file patterns to include for formatting
  inputs: [
    "mix.exs",
    "config/**/*.exs",
    "lib/**/*.ex",
    "test/**/*.exs",
    "priv/repo/**/*.exs" # Include migrations and other repo files
  ],

  # Define the line length for formatting
  line_length: 80,

  # Define any additional options you want
  import_deps: [:phoenix, :ecto],

  # Define the range of formatting to apply to specific files
  exclude: [
    "deps/**",
    "node_modules/**"
  ]
]
