<h1> My Personal Website Template </h1>

<p>
  <img align="right" height="100px" src="./IMG/kitty.png">
</p>
<p align="left">
  This is a space where I share my projects, blog posts, and more.
</p>
<img src="https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a" alt="Built with Nix">

## Contents
- [Blog Pages - with RSS feed](https://moskas.github.io/POSTS)
- [About Me Section](https://moskas.github.io/about)
- [Project Showcase](https://moskas.github.io/projects)

## Styling and Design
- Created with responsive design in mind
- Dynamic light/dark theme selection based on browser color preferences.  
- Colors are based on the Gruvbox color scheme.  
- Single-column design for ease of reading on a big screen.
- **Made with pure HTML and CSS, no JavaScript.**

## Development Environment
The repository contains Nix flake for development with formatters for HTML and CSS.
To enter the development environment you need to have installed **Nix** and run the following command in the projects directory:
```shell
nix develop
```
If you already have nix and direnv, you just need to allow direnv to run autoamtically when entering the projects directory:
```shell
direnv allow
```
### Non-Nix/NixOS Systems
If you aren't using nix you need the following packages for the formatting:
- html-tidy
- prettier