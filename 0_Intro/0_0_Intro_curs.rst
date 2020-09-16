==============================
Tema 0: Intro al curs
==============================

Introducció al curs
=================================================


Em presento
-------------

.. figure::  /_static/0_Intro/arnau_pic.jpg
    :width: 200px
    :align: center

    arnau.tibau@uab.cat | `@ArnauTibau <https://twitter.com/ArnauTibau>`_

* PhD en EECS, U of Michigan, Ann Arbor
* Cap de Data Science a `letgo <https://www.letgo.com/>`_
* 10 anys experiència com a Científic de Dades (*Data Scientist*)
* Qualsevol pregunta: contacteu-me per email o pel Campus Virtual!
* Horaris tutoria: Dilluns i Dimecres de 15h a 17h (**Envieu-me una invitació `Calendar`!**)

Què és l'inferència estadística?
----------------------------------

.. figure::  /_static/0_Intro/stat_inference.png
    :height: 280px
    :align: center

"Població" aquí es refereix al concepte estadístic, que definirem en breu. Per
inferència entenem:

1. Inferir propietats d'un objecte (la població)
2. Deduïr validesa d'una premisa

a partir de d'un nombre **finit** de mostres

Exemples d'aplicació
------------------------

**Exemple 1**: Caracterització de plantes (`R. A. Fisher 1936 <https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-1809.1936.tb02137.x>`_)

Mesurem la longitud i amplada dels sèpals i els pètals de 50 exemplars de tres espècies diferents del gènere *Iris*

.. image::  /_static/0_Intro/iris_pics.png
    :width: 600px
    :align: center
    :alt: Iris Images

.. nextslide::
	:increment:

.. image::  /_static/0_Intro/iris_dataset_sample.png
    :width: 500px
    :align: center
    :alt: Iris dataset (13 primeres mostres)

* Quan solen mesurar els pètals de les *Iris*?
* Hi ha alguna relació entre la morfologia i cada espècie d'*Iris*?
* Donades les mesures d'un especímen nou, el podríem classificar en l'espècie correcta?

.. nextslide::
	:increment:

.. image::  /_static/0_Intro/iris_dataset_sample.png
    :width: 500px
    :align: center
    :alt: Iris dataset (13 primeres mostres)

* Quan solen mesurar els pètals de les Iris? :math:`\rightarrow` **Estimació**
* Hi ha alguna relació entre la morfologia i cada espècie d'*Iris*? :math:`\rightarrow` **Estimació**
* Donades les mesures d'un especímen nou, el podríem classificar en l'espècie correcta? :math:`\rightarrow`  **Predicció**

.. nextslide:: Assaig clínic

**Exemple 2**: Eficacitat d'un tractament profilàctic per als contactes de casos COVID-19
(`O. Mitjà et al. 2020 <https://www.medrxiv.org/content/10.1101/2020.07.20.20157651v1>`_)

Seleccionem **aleatòriament** (en realitat l'experiment fa
`cluster-randomization <https://en.wikipedia.org/wiki/Cluster_randomised_controlled_trial>`_)
dos grups de pacients de COVID-19:

.. figure::  /_static/0_Intro/hcq_example.png
    :height: 325px
    :align: center

.. nextslide:: Assaig clínic (2)
	:increment:

Al cap de 14 dies, contem quants individus en cada grup  tenen símptomes **i** dónen
positiu en una prova PCR.

.. rst-class:: build

* Quants pacients hem de seleccionar per prendre una decisió sobre la població general? :math:`\rightarrow` **Mostreig**
* Com sabem si hem seleccionat els grups adequadament? :math:`\rightarrow`  **Mostreig, Estimació**
* Com determinem si el tractament funciona? :math:`\rightarrow`  **Tests d'hipòtesi**, **Intervals de confiança**

.. figure::  /_static/0_Intro/mitja_et_al_resultats.png
    :width: 600px
    :align: center

.. nextslide:: Assaig clínic (3)
	:increment:


.. figure::  /_static/0_Intro/abc_hcq.png
    :height: 325px
    :align: center

    Un assaig clínic busca falsificar l'hipòtesi nul.la: que el tractament no té efecte. No trobar evidència contra la mateixa no és un fracàs, és progrés científic! `Font <https://www.abc.es/espana/catalunya/abci-fracasa-ensayo-oriol-mitja-hidroxicloroquina-no-previene-coronavirus-202006121016_noticia.html>`_

.. nextslide:: Recomanacions de pel.lícules

**Exemple 3**: Tenim una plataforma de vídeo en streaming i volem millorar les nostres recomanacions.
En particular volem saber si, donat un usuari i un producte, a l'usuari li agradarà.

.. figure::  /_static/0_Intro/movielens.png
    :width: 600px
    :align: center
    :alt:

.. nextslide:: Recomanacions de pel.lícules (2)
	:increment:

Disposem d'un històric amb les `següents dades <http://files.grouplens.org/datasets/movielens/ml-latest-small-README.html>`_:

* Les evaluacions (0-5 estrelles) que cada usuari ha fet de les películes que ja ha vist
* Informació sobre cada película (ex: gènere, actors)

.. code-block:: R

    install.packages('recommenderlab')
    library(recommenderlab)
    data(MovieLense)
    # Veure primeres 3 evaluacions d'un dels usuaris
    head(as(MovieLense[1,], "list")[[1]], 3)
    > Toy Story (1995)  GoldenEye (1995) Four Rooms (1995)
    >        5                 3                 4
    MovieLenseMeta[MovieLenseMeta$title=="Toy Story (1995)", ]
    >      title         year                url                                       unknown Action Adventure ....
    > 1 Toy Story (1995) 1995 http://us.imdb.com/M/title-exact?Toy%20Story%20(1995)       0      0         0

.. nextslide:: Recomanacions de pel.lícules (3)
	:increment:

.. rst-class:: build

* Donada una película que l'usuari encara no ha vist, podem determinar si li agradarà o no? :math:`\rightarrow`  **Regressió**
* Si implementem un model estadístic de recomanacions de pel.lícules, com podem saber si millora l'experiència dels nostres usuaris o no? :math:`\rightarrow`  **Mostreig, Tests d'hipòtesi, Estimació**

Organització del curs
-------------------------------------------------

**Classes de teoria**: Estadística matemàtica

.. rst-class:: build

* Rigor matemàtic: el just
* Centrades en l'aplicació i l'aspecte computacional
* Després de cada classe, penjaré les transparències/notes de classe al Campus Virtual

.. warning::

    Es recomana la lectura **prèvia** dels temes a tractar abans de cada llicó

.. nextslide::
	:increment:

**Classes de problemes**: Resolució de problemes proposats per l'estudi autònom

.. rst-class:: build

* Complement a les classes teòriques
* Molt difícil (veure impossible) resoldre els problemes sense seguir les classes
* Molt difícil aprovar sense treballar els problemes

.. warning::

    Part de la teoria s'exposarà en els problemes

.. nextslide::
	:increment:

**Classes pràctiques** amb programari (R/Python)

.. rst-class:: build

* Complement a les classes teòriques
* Implementarem/experimentarem amb els mètodes descrits a classe
* Instal.leu-vos `Rstudio <https://rstudio.com/products/rstudio/>`_ i/o `Python 3+ <https://www.python.org/downloads/>`_ (si feu servir Python, us recomano que instal.leu també `Miniconda <https://docs.conda.io/en/latest/miniconda.html>`_ per gestionar-ne els paquets)

.. warning::

    Per ser evaluat, el programari entregat haurà de córrer sense modificacions al meu ordinador.


.. nextslide:: Semi-presencialitat en temps de pandèmia
	:increment:

* Com ja sabeu, hem de mantenir l'ocupació de l'aula a 32
* Mantindrem l'alternança entre Grup 1, Grup 2 i virtual (`calendari <https://www.uab.cat/doc/hor-grau-MatCAD-20-21>`_)
* Si m'ajudeu podem mirar de gravar les classes per penjar-les al Campus Virtual
* Haurem de ser una mica flexibles


.. figure::  /_static/0_Intro/flexibilitat.jpg
    :height: 250px
    :align: center

    `Font de l'imatge <https://www.centralyoga.com.au/blog/beware-the-allure-of-extreme-poses>`_



.. nextslide:: Temari i Calendari provisional
	:increment:

Hem estructurat el curs en 5 parts:

* Tema 1. Preliminars (Setmanes 1 i 2)
* Tema 2. Introducció a l’Inferència Estadística (Setmana 2, 3 i 4)
* Tema 3. Estimació (Octubre)
* Tema 4. Tests d’hipòtesi (Novembre)
* Tema 5. Regressió i predicció (Desembre)

Per més detalls sobre el contingut de cada tema, consulteu la `guia docent penajda al Campus Virtual <https://e-aules.uab.cat/2020-21/course/view.php?id=7622#section-0>`_

Bibliografia recomanada
-------------------------------------------------

Pel desenvolupament teòric, seguiré majoritàriament *[Casella & Berger]*,
excepte pel `Tema 4. Tests d’hipòtesi`, on seguiré més aviat el desenvolupament
de *[Rice]*:

* *[Casella & Berger]* `Statistical Inference, 2nd Edition <https://cataleg.uab.cat/iii/encore/record/C__Rb1522633__Sstatistical%20inference__Orightresult__U__X7?lang=cat&suite=def>`_
* *[Rice]* `Mathematical Statistics and Data Analysis, J. Rice, 3rd edition <https://cataleg.uab.cat/iii/encore/record/C__Rb1953551__SMathematical%20Statistics%20and%20Data%20Analysis__Orightresult__U__X7?lang=cat&suite=def>`_

Bibliografia complementària:

* [Efron & Hastie] `Computer Age Statistical Inference <https://web.stanford.edu/~hastie/CASI/index.html>`_

Avaluació curs
-------------------------------------------------

Avaluació continuada:

* :math:`C`: Nota mitjana del control de problemes
* :math:`P`: Control de pràctiques

Exàmens:

* :math:`E_1`: Nota examen final
* :math:`E_2`: Nota examen de recuperació

Si l'alumne es presenta a un dels dos examens:

:math:`N = 0.50 x \max\left(E_1, E_2\right) + 0.20 x C + 0.30 × P`

(:math:`C, P, E_1, E_2, N \in \left[0, 10\right]`) i aprova si :math:`N \geq 5`.

Si l'alumne no es presenta a cap dels dos examens:

:math:`N = \mbox{No Presentat}` (independentment de :math:`C` i :math:`P`)


.. nextslide:: Problemes
	:increment:

* Alguns dels problemes els proposaré durant les classes de teoria (exemple: completar una demostració).

* En cualsevol cas, miraré de donar sempre un mínim de 5 dies entre l'enunciat dels problemes i l'entrega/correcció de sol.lucions.

* Alguns dels problemes els corregirem a classe (després d'entregar-los).

* Ho sento però per qüestions logístiques no acceptaré entregues amb retard.


.. nextslide:: Avaluació continuada (problemes i pràctiques)
	:increment:

Ho repeteixo, perquè quedi clar:

.. rst-class: build

* Tant les sessions de problemes com les de pràctiques són complementàries a les classes teòriques
* /!\\ part de la teoria s'exposarà en els problemes i les pràctiques
* Molt difícil (veure impossible) resoldre els problemes sense seguir les classes
* Molt difícil aprovar (`aprendre!`) sense treballar els problemes
* **IMPORTANT**: Per ser evaluat, el programari de cada pràctica haurà de córrer sense modificacions al meu ordinador.


Algunes coses a tenir en compte
-------------------------------------------------

.. figure::  /_static/0_Intro/we_need_you.jpg
    :height: 300px
    :align: center

    Aquest curs és la primera vegada que el preparo!

    * Pot haver-hi alguna errada a les slides/apunts
    * En particular en la traducció de termes en anglès <--> català
    * Qualsevol problema durant o després de la classe: arnau.tibau@uab.cat


Qüestionari
---------------

Durant el curs faré servir qüestionaris i exercicis per ajudar-vos a reflexionar i recordar
el material que anem desenvolupant.

Comencem amb el primer :)

.. rst-class:: build

1. Calcular el nombre de pacients necessaris per un assaig clínic és un problema de _________.
2. Es podràn resoldre els problemes sense assistir a les classes de teoria?
3. Per determinar si un tractament clínic funciona, normalment es fa servir la tècnica dels _____________.
4. Si trec un 10 en l'avaluació de problemes i pràctiques i no em presento a l'exàmen final, puc aprovar?
5. Perquè una pràctica s'evalui, m'he d'assegurar que el meu codi ___________.
