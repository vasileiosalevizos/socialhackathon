# Social hackathon

[![Update requirements.txt and package.json](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/github-actions.yml/badge.svg)](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/github-actions.yml)
[![python](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/python.yml/badge.svg)](https://github.com/vasileiosalevizos/socialhackathon/actions/workflows/python.yml)

_Το EcoBridge είναι μια εφαρμογή που ενώνει επιχειρήσεις, κοινωνικούς και περιβαλλοντικούς φορείς, και άτομα μέσω βιώσιμων εκδηλώσεων και δράσεων, αυξάνοντας την περιβαλλοντική συνείδηση με προσαρμοσμένες προτάσεις εκδηλώσεων. Οι χρήστες κινητοποιούνται μέσω ενός συστήματος που βασίζεται σε σημεία, ενώ η τεχνολογία blockchain και γεωγραφικής τοποθεσίας διασφαλίζουν ασφαλή, ακριβή παρακολούθηση συμμετοχής._

![image](https://github.com/vasileiosalevizos/socialhackathon/assets/88648326/f14bcdd1-530a-4ea4-8b4e-1b1d81660c65)

Blockchain
![image](https://github.com/vasileiosalevizos/socialhackathon/assets/88648326/178c62d2-c4b3-4de8-8571-338abc4226a4)
![image](https://github.com/vasileiosalevizos/socialhackathon/assets/88648326/6e330286-0bfd-4e86-a76f-c4f52f6b4880)
![image](https://github.com/vasileiosalevizos/socialhackathon/assets/88648326/309641e9-31f1-4f8c-9520-0ad2802ff5b5)
![image](https://github.com/vasileiosalevizos/socialhackathon/assets/88648326/f1856329-236b-435f-bcf7-3fa85b43a954)
![image](https://github.com/vasileiosalevizos/socialhackathon/assets/88648326/2239f2cc-c475-492c-a726-e5ff058917bd)


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

* Ilias Georgousis
* Vasileios Alevizos
* Nikitas Gerolimos
* Mathaios Tasios
* Antonis Messinis
* Georgios Hobis
* Dimitra Maliarou
* Sotiria Karipidou
* Alexis Stathopoulos
* Christiana Gardikioti

<p align="right">(<a href="#readme-top">back to top</a>)</p>
