===============================
Tema 1: Preliminars
===============================

Benvinguts a `104392 - Modelització i Inferència`
================================================

abc

Em presento
-------------

.. image::  /_static/0_Intro/arnau_pic.jpg
    :width: 600px
    :align: center
    :alt: Iris Images

arnau.tibau@uab.cat
Phd in EECS, U of Michigan
Head of DS at letgo
> 10 anys experiència com a Científic de Dades en indústria


Què és l'inferència estadística?
----------------------------------

abc

Exemples d'aplicació2
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
    :width: 300px
    :align: center
    :alt: Iris dataset (13 primeres mostres)

* Quan solen mesurar els pètals de les Iris? :math:`\rightarrow` **Estimació**
* Hi ha alguna relació entre la morfologia i cada espècie d'*Iris*? :math:`\rightarrow` **Estimació**
* Donades les mesures d'un especímen nou, el podríem classificar en l'espècie correcta? :math:`\rightarrow`  **Predicció**


.. nextslide:: Assaig clínic
	:increment:

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

.. nextslide:: Recomanacions de pel.lícules
	:increment:

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
* **IMPORTANT**: Es recomana la lectura **prèvia** dels temes a tractar abans de cada llicó

.. nextslide::
	:increment:

**Classes de problemes**: Resolució de problemes proposats per l'estudi autònom

* Complement a les classes teòriques
* Molt difícil (veure impossible) resoldre els problemes sense seguir les classes
* Molt difícil aprovar sense treballar els problemes
* **IMPORTANT**: part de la teoria s'exposarà en els problemes

.. nextslide::
	:increment:

**Classes pràctiques** amb programari (R/Python)

* Complement a les classes teòriques
* Implementarem/experimentarem amb els mètodes descrits a classe
* **IMPORTANT**: Per ser evaluat, el programari entregat haurà de córrer sense modificacions al meu ordinador.
* Instal.leu-vos `Rstudio <https://rstudio.com/products/rstudio/>`_ i/o `Python 3+ <https://www.python.org/downloads/>`_ (si feu servir Python, us recomano que instal.leu també `Miniconda <https://docs.conda.io/en/latest/miniconda.html>`_
    per gestionar-ne els paquets)


.. nextslide:: Temari i Calendari provisional
	:increment:

Hem estructurat el curs en 5 parts:

* Tema 1. Preliminars (Setmana 1)
* Tema 2. Introducció a l’Inferència Estadística (Setmana 2 i 3)
* Tema 3. Estimació
* Tema 4. Tests d’hipòtesi
* Tema 5. Regressió i predicció

Per més detalls sobre el contingut de cada tema, consulteu la `guia docent <https://guies.uab.cat/guies_docents/public/portal/html/2020/assignatura/104392/ca>`_

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

* :math:`E_1`: Nota examen final
* :math:`E_2`: Nota examen de recuperació

Si l'alumne es presenta a un dels dos examens:

:math:`N = 0.50 x \max\left(E_1, E_2\right) + 0.20 x C + 0.30 × P`

(:math:`C, P, E_1, E_2, N \in \left[0, 10\right]`) i aprova si :math:`N \geq 5`.

Si l'alumne no es presenta a cap dels dos examens:

:math:`N = \mbox{No Presentat}` (independentment de :math:`C` i :math:`P`)


.. nextslide:: Avaluació continuada (problemes i pràctiques)
	:increment:

Ho repeteixo, perquè quedi clar:


* Tant les sessions de problemes com les de pràctiques són complementàries a les classes teòriques
* /!\\ part de la teoria s'exposarà en els problemes i les pràctiques
* Molt difícil (veure impossible) resoldre els problemes sense seguir les classes
* Molt difícil aprovar (`aprendre!`) sense treballar els problemes
* **IMPORTANT**: Per ser evaluat, el programari de cada pràctica haurà de córrer sense modificacions al meu ordinador.


Algunes coses a tenir en compte
-------------------------------------------------

Aquest curs és la primera vegada que el preparo:

* Pot haver-hi alguna errada a les slides/apunts
* Termes en anglès --> català
* Si observeu qualsevol problema durant o després de la classe: arnau.tibau@uab.cat

.. warning::

    Necessitaré la vostra col.laboració!


Qüestionari
---------------

Durant el curs faré servir qüestionaris per ajudar-vos a reflexionar i recordar
el material que anem desenvolupant.

Comencem amb el primer :)

0. Calcular el nombre de pacients necessaris per un assaig clínic és un problema de _________.
1. Es podràn resoldre els problemes sense assistir a les classes de teoria?
2. Per determinar si un tractament clínic funciona, normalment es fa servir la tècnica dels _____________.
3. Si trec un 10 en l'avaluació de problemes i pràctiques i no em presento a l'exàmen final, puc aprovar?
4. Perquè una pràctica s'evalui, m'he d'assegurar que el meu codi ___________.


Espais i mesures de Probabilitat
==========================================

Espai de Probabilitat
-------------------------------

.. note::
    Durant el Tema 1 haurem d'anar una mica ràpid. És impossible fer un curs de probabilitat
    en 2 setmanes, però per sort ja n'heu fet un!

Un **espai de probabilitat** és un model matemàtic del resultat d'un **experiment aleatori**.

Consisteix en un triplet :math:`\left(\Omega, \mathcal{A}, P\right)`:

* :math:`\Omega`: l'**espai mostral**, conjunt de resultats possibles d'un experiment
* :math:`\mathcal{A} \subset 2^{\Omega}`: el conjunt d'**esdeveniments**, una família de subconjunts d':math:`\Omega`
* :math:`P`: una **mesura de probabilitat**, una funció :math:`\mathcal{A} \rightarrow \left[0, 1\right]`


Mesura de probabilitat
-------------------------------

Una **mesura de probabilitat** :math:`P: \mathcal{A} \rightarrow \left[0, 1\right]`
ha de satisfer els següents axiomes:

1. :math:`P\left(\Omega\right)=1`

2. :math:`\forall A\in\mathcal{A}`, :math:`P\left(A\right)\geq 0`

3. Per :math:`A_1,A_2,A_3, \cdots \in \mathcal{A}` disjunts, :math:`P\left(\cup_i A_i\right) = \sum_i P\left(A_i\right)`


.. nextslide::
	:increment:

Això és una construcció axiomàtica de Probabilitat, formalitzada per Kolmogorov.

Noteu que no hem associat cap interpretació al significat físic dels valors de :math:`P`.

Dues interpretacions típiques:

* **Frequentista**: :math:`P\left(A\right)` representa la frequència amb que observariem l'esdeveniment `A`
    si realitzéssim un gran nombre d'experiments

* **Bayesiana**: :math:`P\left(A\right)` representa la nostra certesa sobre l'ocurrència de l'esdeveniment `A`

.. note::

    Les dues interpretacions no són completament ortogonals, però són l'orígen d'un munt de
    discussions filosòfiques i a vegades dogmàtiques. Si us interessa el tema us recomano
    `Objections to Bayesian statistics <https://projecteuclid.org/euclid.ba/1340370429>`_.


.. nextslide:: Aquest no és un curs de probabilitat...
	:increment:

Aquest no és un curs de probabilitat, per tant amagarem "detalls" important sota l'alfombra:

* :math:`\mathcal{A}` en realitat ha de ser una :math:`\sigma`-àlgebra
* Per a conjunts :math:`\Omega` contables, podem tirar milles considerant :math:`\mathcal{A} = 2^{\Omega}`
* La cosa es complica quan :math:`\Omega` no és discret (exemples: l'alçada d'una població, el nivell d'expressió d'un gen)

**Recomano** donar una ullada al [Casella & Berger] o a una altra de les referències
bibliogràfiques per una intro no tècnica a les :math:`\sigma`-àlgebres

Algunes propietats de les mesures de probabilitat
--------------------------------------------------

.. rst-class:: note

    **Teorema [Kendall 1.2.8 i 1.2.9]** Per una mesura de probabilitat :math:`P` i
    qualsevol esdeveniments :math:`A, B \in \mathcal{A}`, tenim:

    1. :math:`P\left(\emptyset\right)=0`
    2. :math:`P\left(A\right) \leq 1`
    3. :math:`P\left(A^c\right) = 1 - P\left(A\right)`
    4. :math:`P\left(B \cap A^c\right) = P\left(B\right) - P\left(A \cap B\right)`
    5. :math:`P\left(A \cup B\right) = P\left(A\right) + P\left(B\right) - P\left(A \cap B\right)`
    6. Si :math:`A \subseteq B`, aleshores :math:`P\left(A\right) \leq P\left(B\right)`

**Demostració**: Punts (1), (2), (3), exercici :) (recomano començar pel 3er punt).
Punts (4)-(6) a la pissarra.


.. nextslide:: Un parell més de resultats útils
	:increment:

Els següents són propietats interessants relatives a col.leccions de conjunts:

1. Per cualsevol partició :math:`C_1, \cdots, C_N` de :math:`\Omega`, tenim que:

:math:`P\left(A\right) = \sum_i P\left(A \cap C_i \right)`

2. La desigualtat de Boole, estableix que:

:math:`P\left(\cup_i A_i\right) \leq \sum_i P\left(A_i \right)`

Exemples d'espais de probabilitat
--------------------------------------------------

**Experiment 1**: Observar el valor resultant de llançar un dau de 6 cares

* :math:`\Omega = \left\{1, 2, 3, 4, 5, 6\right\}`
* :math:`\mathcal{A} = \left\{ \left\{1\right\}, \left\{2\right\}, \cdots, \left\{1, 2\right\}, \cdots \right\}`
* :math:`P\left(x\right) = \frac{1}{6}, x \in \Omega`

.. rst-class:: note

    Com definirieu :math:`P\left(A\right)` per a qualsevol :math:`A \in \mathcal{A}`?

.. nextslide::
	:increment:

**Experiment 2**: Escollir 100 persones i fer-els-hi una prova d'anticossos per SARS-COV-2

* :math:`\Omega = \left\{+, -\right\}^{100}`
* :math:`\mathcal{A} = \left\{...\right\}`
* :math:`P\left(A\right) = ....`

.. nextslide::
	:increment:

**Experiment 3**: Escollir aleatòriament un estudiant d'questa classe i mesurar-ne la seva alçada

* :math:`\Omega = \left[0, \infty \right)`
* :math:`\mathcal{A} = \left\{...\right\}`
* :math:`P\left(A\right) = ...`


Independència i probabilitat condicional
==========================================


Variables aleatòries
==========================================


Esperança i moments
==========================================


Problemes
=================================================

Espais i mesures de Probabilitat
---------------------------------

Conseqüències dels axiomes de probabilitat
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Practiquem amb els axiomes per demostrar que:

1. :math:`P\left(\emptyset\right)=0`

2. :math:`P\left(A^c\right)=1-P\left(A\right)`

3. :math:`P\left(A \cup B \right)= P\left(A\right) + P\left(B\right) - P\left(A \cap B\right)`

Desigualtat de Bonferroni
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

La desigualtat de Bonferroni per dos esdeveniments :math:`A, B` estableix que:

:math:`P\left(A \cap B\right) \geq P\left(A\right) + P\left(B\right) - 1`

És útil quan la probabilitat conjunta dels esdeveniments no és fàcil de calcular (per
exemple quan aquests no són independents).

1. Demostreu la desigualtat de Bonferroni

2. Per quin tipus d'esdeveniments no és trivial, és a dir, ens serveix per
aproximar la probabilitat de l'esdeveniment conjunt?

3. Demostreu la desigualtat de Bonferroni en el cas genèric :math:`P\left(\cap_i A_i\right) \geq \sum_i P\left(A_i\right) - (n - 1)`

4. Definiu un experiment i una col.lecció d'esdeveniments :math:`A_i` on la desigualtat de Bonferroni ens donaria una cota inferior útil.
Per exemple:

Probabilitat condicional i independència
-----------------------------------------

Problema X: Independència de parells vs independència mútua
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Exercici per entendre perquè independència a parells no implica independència mútua


Problema Y: Esperança condicional i correcció del biaix de sel.lecció
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Durant el curs hem vist un exemple de com el biaix de sel.lecció pot perjudicar els nostres estimadors.
En alguns casos, es pot corregir l'efecte fàcilment.

1. Demostra que E(\sum \frac{1}{P}X) = E(X) bla bla bla


Pràctica
=================================================


Apèndix
-------

.. math::

   (a + b)^2 = a^2 + 2ab + b^2

   (a - b)^2 = a^2 - 2ab + b^2

.. math::
   :nowrap:

   \begin{eqnarray}
      y    & = & ax^2 + bx + c \\
      f(x) & = & x^2 + 2xy + y^2
   \end{eqnarray}













