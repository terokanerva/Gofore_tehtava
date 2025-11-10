"Gofore tehtävä" 

Tehtävässä luotu smoke-testi Demoblaze-verkkokaupansivustolle.

Testattavat asiat:
- Sivusto avautuu
    - Etsitään sivulta tekstiä "PRODUCT STORE"
    - Home-sivulta löytyvät elementit
        - Kuvakaruselli
        - Kategoriat-elementi
        - Elementti jossa tuotteiden kuvia
        - Edellinen sivu nappi
        - Seuraava sivu nappi
        - Footer

- Testataan linkkien toimivuus
    - Home: Paluu ostoskorista kotisivulle onnistuu
    - Contact: Modaali aukeaa
    - About us: Video aukeaa
    - Cart: Ostoskori aukeaa, tässä vaiheessa vielä tyhjä
    - Log in: Modaali aukeaa
    - Sign up: Modaali aukeaa

- Testataan Kategoriat elementin toimivuus
    - Tuotekohtaiset kategoriat avautuvat
    - Tuotteiden lisäys ostoskoriin onnistuu

- Testataan ostoskorin sisältö

    - Ostoskoriin lisätyt tuotteet löytyvät listattuina

 - Ajo-ohjeet:
   - Kloonaa repo omalle koneellesi
   - Avaa komentokehoite kansion johon kloonasit repon
   - Ajetaan komennolla: robot demoblaze_smoke_test.robot

- Asennettuna:
  - python
  - robot framwork
  - selenium library
