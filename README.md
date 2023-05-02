# Social hackathon

[![Update requirements.txt and package.json](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/github-actions.yml/badge.svg)](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/github-actions.yml)
[![python](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/python.yml/badge.svg)](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/python.yml)

_Descriptoin_

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#team">Team</a></li>
  </ol>
</details>

## About The Project

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Prerequisites

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Installation

#### Create python venv

```bash
python -m venv .dev
```

#### Activate python venv

```bash
source .dev/bin/activate
```

#### Install dependencies

```bash
pip freeze > requirements.txt

```

#### Start uvicorn server

```bash
cd api
uvicorn main:app --reload
```
You can then access the API documentation by navigating to ``http://localhost:8000/docs``.

#### Start front-end

```bash
cd my-app
npm start
```

You can now view app in the browser ``http://localhost:3000``.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Team

<p align="right">(<a href="#readme-top">back to top</a>)</p>
