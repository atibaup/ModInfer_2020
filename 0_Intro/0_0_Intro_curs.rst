=================================================
Benvinguts a `104392 - Modelització i Inferència`
=================================================

`104392 - Modelització i Inferència`
=================================================

.. image::  /_static/0_Intro/arnau_pic.jpg
    :width: 600px
    :align: center
    :alt: Iris Images

arnau.tibau@uab.cat
Phd in EECS, U of Michigan
Head of DS at letgo
>10 anys experiència com a Científic de Dades en indústria


Què és l'inferència estadística?
-------------------------------------------------


Exemples d'aplicació: Caracterització de plantes
-------------------------------------------------

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
    :width: 300px
    :align: center
    :alt: Iris dataset (13 primeres mostres)

* Quan solen mesurar els pètals de les Iris? :math:`\rightarrow` **Estimació**
* Hi ha alguna relació entre la morfologia i cada espècie d'*Iris*? :math:`\rightarrow` **Estimació**
* Donades les mesures d'un especímen nou, el podríem classificar en l'espècie correcta? :math:`\rightarrow`  **Predicció**

Exemples d'aplicació: Assaig clínic
-------------------------------------------------

**Exemple 2**: Eficacitat d'un tractament profilàctic per als contactes de casos COVID-19 (`O. Mitjà et al. 2020 <https://www.medrxiv.org/content/10.1101/2020.07.20.20157651v1>`_)

Seleccionem **aleatòriament** [*]_ dos grups de pacients de COVID-19:

* **Control**: Tractament convencional
* **Intervenció**: Administració d'*hidroxicloroquina*

Al cap de 14 dies, contem quants individus en cada grup  tenen símptomes **i** dónen positiu en una prova PCR.

.. [*] En realitat l'experiment fa `cluster-randomization <https://en.wikipedia.org/wiki/Cluster_randomised_controlled_trial>`_.

.. nextslide::
	:increment:

* Quants pacients hem de seleccionar per prendre una decisió sobre la població general? :math:`\rightarrow`  **Mostreig**
* Com sabem si hem seleccionat els grups adequadament? :math:`\rightarrow`  **Mostreig, Estimació**
* Com determinem si el tractament funciona? :math:`\rightarrow`  **Tests d'hipòtesi**

.. image::  /_static/0_Intro/mitja_et_al_resultats.png
    :width: 600px
    :align: center
    :alt:

Exemples d'aplicació: Recomanacions de pel.lícules
-------------------------------------------------

**Exemple 3**: Tenim una plataforma de vídeo en streaming i volem millorar les nostres recomanacions.
En particular, volem saber si, donat un usuari i un producte, a l'usuari li agradarà.


.. figure::  /_static/0_Intro/movielens.png
    :width: 600px
    :align: center
    :alt:

.. nextslide::
	:increment:

Disposem d'un històric amb les `següents dades <http://files.grouplens.org/datasets/movielens/ml-latest-small-README.html>`_:

* Les evaluacions (0-5 estrelles) que cada usuari ha fet de les películes que ja ha vist
* Informació sobre cada película (ex: gènere)

.. code-block:: R

    > install.packages('recommenderlab')
    > library(recommenderlab)
    # Veure primeres 3 evaluacions d'un dels usuaris
    > head(as(MovieLense[1,], "list")[[1]], 3)
    Toy Story (1995)  GoldenEye (1995) Four Rooms (1995)
            5                 3                 4

.. nextslide::
	:increment:

* Donada una película que l'usuari encara no ha vist, podem determinar si li agradarà o no? :math:`\rightarrow`  **Regressió**
* Si implementem un model estadístic de recomanacions, com podem saber si millora l'experiència dels nostres usuaris o no? :math:`\rightarrow`  **Mostreig, Tests d'hipòtesi, Estimació**


Organització del curs
-------------------------------------------------

**Classes de teoria**: Estadística matemàtica

* Rigor matemàtic: el just
* Focus en l'aplicació i l'aspecte computacional
* Després de cada classe, penjaré les transparències/notes de classe al Campus Virtual
* **IMPORTANT**: Es recomanara la lectura

**Classes de problemes**: Resolució de problemes proposats per l'estudi autònom

* Complement a les classes teòriques
* Molt difícil (veure impossible) resoldre els problemes sense seguir les classes
* Molt difícil aprovar sense treballar els problemes
* **IMPORTANT**: part de la teoria s'exposarà en els problemes

**Classes pràctiques** amb programari (R/Python)

* Complement a les classes teòriques
* **IMPORTANT**: El programari haurà de córrer sense modificacions al meu ordinador.


Temari i Calendari provisional
-------------------------------------------------


* Tema 1. Preliminars (Setmana 1)
* Tema 2. Introducció a l’Inferència Estadística (Setmana 2 i 3)
* Tema 3. Estimació
* Tema 4. Tests d’hipòtesi
* Tema 5. Regressió i predicció

Més detalls a la `guia docent <https://guies.uab.cat/guies_docents/public/portal/html/2020/assignatura/104392/ca>`_


Bibliografia recomanada
-------------------------------------------------

Pel desenvolupament teòric, seguiré majoritàriament [Casella & Berger],
excepte pel `Tema 4. Tests d’hipòtesi`, on seguiré més aviat el desenvolupament
de [Rice].

* [Casella & Berger] Stastistical Inference, 2nd Edition
* [Rice] Mathematical Statistics and Data Analysis, J. Rice, 3rd edition

Bibliografia complementària:

* [Efron & Hastie] Computer Age Statistical Inference


Avaluació curs
-------------------------------------------------

Avaluació continuada:

* :math:`C`: Nota mitjana del control de problemes (avaluació continuada)
* :math:`P`: Control de pràctiques (avaluació continuada)

Exàmens:

* :math:`E1`: Nota examen final
* :math:`E2`: Nota examen de recuperació

Si l'alumne es presenta a un dels dos examens:

:math:`N = 0.50 x \max\left(E1, E2\right) + 0.20 x C + 0.30 × P`

En cas contrari:

:math:`N = \mbox{No Presentat}` (independentment de :math:`C` i :math:`P`


Avaluació continuada (problemes i pràctiques)
-------------------------------------------------

Ho repeteixo, perquè quedi clar:


* Tant les sessions de problemes com les de pràctiques són complementàries a les classes teòriques
* /!\\ part de la teoria s'exposarà en els problemes i les pràctiques
* Molt difícil (veure impossible) resoldre els problemes sense seguir les classes
* Molt difícil aprovar (`aprendre!`) sense treballar els problemes
* **IMPORTANT**: Per ser evaluat, el programari de cada pràctica haurà de córrer sense
modificacions al meu ordinador.


Algunes coses a tenir en compte
-------------------------------------------------

Aquest curs és la primera vegada que l´ensenyo:

* Pot haver-hi alguna errada a les slides/apunts
* Termes anglès català

.. warning::

    Necessitaré la vostra col.laboració!
















