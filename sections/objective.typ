#import "@preview/typslides:1.3.0": *

#slide(title: "Making Prolog Package Managing Better?", outlined: true)[
  - Workspace management
  - ISO Prolog compliance
  - Package registry
  - License management
]

#slide(title: "Workspace management", outlined: true)[
  - Shared dependencies across packages
  - Unified commands
  - Linking of local packages
  - Potential inspiration: #link("https://doc.rust-lang.org/cargo/")[Cargo (Rust)], #link("https://yarnpkg.com/")[Yarn (JavaScript)]
]

#slide(title: "ISO Prolog compliance", outlined: true)[
  - Work with "any" Prolog implementation
  - Implementation compatibility
    - Automatic/semi-automatic polyfills for incompatibilities
  - Potential inspiration: #link("https://logtalk.org/manuals/devtools/packs.html")[Packs (Logtalk)]
]

#slide(title: "Well-designed package registry", outlined: true)[
  - Centralized package software registries can be very expensive
    - #link("https://talkpython.fm/episodes/show/64/inside-the-python-package-index")[#quote("Running PyPI costs around $35,000 per month in infrastructure and bandwidth alone")]
    - Of course, Python-level traffic wouldn't be expected overnight
      - #link("https://talkpython.fm/episodes/show/64/inside-the-python-package-index")[343 terabytes of traffic and 3 billion requests per month]
  - Must be secure and safe
    - Prevent malicious package versions
    - Prevent spam
    - Ensure high availability/uptime
    - Enforce copyright compliance
]

#slide(title: "Package registry", outlined: true)[
  - Decentralized registry exists
    - Go
      - Uses Git repositories for package hosting
      - Supports semantic versioning, Git hashes, and branches
      - Has a search #link("https://pkg.go.dev/")[engine for packages]
        - Indexes packages and caches them on a #link("https://proxy.golang.org/")[proxy server]
      - Ensures dependency immutability through the proxy server
      - Proxy servers are configurable
    - #link("https://ziglang.org/")[Zig]
      - Fetches packages directly from source URLs (no proxy servers)
      - Validates content hash of downloaded code
      - More decentralized
        - No *official* search engine (community indexes like #link("https://zigistry.dev/")[Zigistry] exist)
        - Immutability enforced through hashes
]

#slide(title: "License management", outlined: true)[
  - Licenses are critical for software development
  - By default, authors retain exclusive copyright over their code in most countries due to the #link("https://www.wipo.int/wipolex/en/text/283698")[Berne Convention for the Protection of Literary and Artistic Works]
  - When using third-party packages, their licenses must be reviewed for compliance
  - Modern package managers provide license inspection tools:
    - Yarn: `yarn licenses list`
    - Cargo: `cargo-license`
    - #link("https://pypi.org/project/pip-licenses/")[Pip]: `pip-licenses`
]
