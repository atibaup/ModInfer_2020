===================
Tema 1: Preliminars
===================

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


Espais i mesures de Probabilitat
==========================================

Espai de Probabilitat
-------------------------------

.. rst-class:: note

    Durant el Tema 1 haurem d'anar una mica ràpid. És impossible fer un curs de probabilitat
    en 2 setmanes, però per sort ja n'heu fet un!

Un **espai de probabilitat** és un model matemàtic del resultat d'un **experiment aleatori**.

Consisteix en un triplet :math:`\left(\Omega, \mathcal{A}, P\right)`:

* :math:`\Omega`: l'**espai mostral**, conjunt de resultats possibles d'un experiment
* :math:`\mathcal{A} \subseteq 2^{\Omega}`: el conjunt d'**esdeveniments**, una família de subconjunts d':math:`\Omega`
* :math:`P`: una **mesura de probabilitat**, una funció :math:`\mathcal{A} \rightarrow \left[0, 1\right]`

*Recordatori*: :math:`2^{\Omega}` és el conjunt de tots els sub-conjunts d':math:`\Omega`, incloent-hi :math:`\emptyset` i :math:`\Omega`.

Mesura de probabilitat
-------------------------------

Una **mesura de probabilitat** :math:`P: \mathcal{A} \rightarrow \left[0, 1\right]`
ha de satisfer els següents axiomes (de Kolmogorov):

1. :math:`P\left(\Omega\right)=1`

2. :math:`\forall A\in\mathcal{A}`, :math:`P\left(A\right)\geq 0`

3. Per :math:`A_1,A_2,A_3, \cdots \in \mathcal{A}` disjunts, :math:`P\left(\cup_i A_i\right) = \sum_i P\left(A_i\right)`

.. rst-class:: note

    Fixeu-vos que tenim llibertat a l'hora de definir :math:`\mathcal{A}` pels esdeveniments que ens
    interessen (sempre i quan formin una :math:`\sigma`-àlgebra.)

.. nextslide::
	:increment:

Això és una construcció axiomàtica de Probabilitat, formalitzada per Andrey Kolmogorov.

Noteu que no hem associat cap interpretació al significat físic dels valors de :math:`P`. Dues interpretacions típiques:

* **Frequentista**: :math:`P\left(A\right)` representa la frequència amb que observariem l'esdeveniment `A` si realitzéssim un gran nombre d'experiments

* **Bayesiana**: :math:`P\left(A\right)` representa la nostra certesa sobre l'ocurrència de l'esdeveniment `A`

.. note::

    Les dues interpretacions no són completament ortogonals, però són l'orígen d'un munt de
    discussions filosòfiques i a vegades dogmàtiques. Si us interessa el tema us recomano
    `Objections to Bayesian statistics <https://projecteuclid.org/euclid.ba/1340370429>`_.


.. nextslide:: Aquest no és un curs de probabilitat...
	:increment:

Aquest no és un curs de probabilitat, per tant amagarem "detalls" important sota l'alfombra:

* :math:`\mathcal{A}` en realitat ha de ser una :math:`\sigma`-àlgebra (conté :math:`\emptyset`, tancat per unió contable i complement)
* Per a conjunts :math:`\Omega` contables, podem tirar milles considerant :math:`\mathcal{A} = 2^{\Omega}`
* La cosa es complica quan :math:`\Omega` no és discret (exemples: l'alçada d'una població, el nivell d'expressió d'un gen)

.. rst-class:: note

    **Recomano** donar una ullada al [Casella & Berger] o a una altra de les referències
    bibliogràfiques per una intro no tècnica a les :math:`\sigma`-àlgebres

Algunes propietats de les mesures de probabilitat
--------------------------------------------------

.. rst-class:: note

    **Teorema [Casella & Berger 1.2.8 i 1.2.9]** Per una mesura de probabilitat :math:`P` i
    qualsevol esdeveniments :math:`A, B \in \mathcal{A}`, tenim:

    1. :math:`P\left(\emptyset\right)=0`
    2. :math:`P\left(A\right) \leq 1`
    3. :math:`P\left(A^c\right) = 1 - P\left(A\right)`
    4. :math:`P\left(B \cap A^c\right) = P\left(B\right) - P\left(A \cap B\right)`
    5. :math:`P\left(A \cup B\right) = P\left(A\right) + P\left(B\right) - P\left(A \cap B\right)`
    6. Si :math:`A \subseteq B`, aleshores :math:`P\left(A\right) \leq P\left(B\right)`

**Demostració**: Punts (1), (2), (3), exercici :) (recomano començar pel 3er punt).
Punts (4)-(6) tot seguit.

.. nextslide:: Guia de la demostració punts (4)-(6)
	:increment:

Pel punt (4), només cal observar que :math:`B = \left(B \cap A\right) \cup \left(B \cap A^c\right)` (exercici).
D'aquesta identitat i tenint en compte que :math:`B \cap A` i :math:`B \cap A^c` son disjunts,
s'en dedueix l'expressió usant el 3er axioma de Kolmogorov.

Pel punt (5), utilitzem la següent identitat :math:`A \cup B = A \cup \left(B \cap A^c\right)` i apliquem el punt (4).

Finalment el punt (6) el demostrem observant que si :math:`A \subseteq B` aleshores :math:`A \cap B = A`
i que :math:`0 \leq P\left(B \cap A^c\right) = P\left(B\right) - P\left(A\right)`.

.. nextslide:: Un parell més de resultats útils
	:increment:

Els següents són propietats interessants relatives a col.leccions de conjunts:

.. rst-class:: note

    **Teorema [Casella & Berger 1.2.11]** Si :math:`P` és una mesura de probabilitat:

    1. Per cualsevol partició :math:`C_1, \cdots, C_N` d' :math:`\Omega`, :math:`P\left(A\right) = \sum_i P\left(A \cap C_i \right)`
    2. :math:`A_1, A_2 \cdots, \in \mathcal{A}`, :math:`P\left(\cup_i A_i\right) \leq \sum_i P\left(A_i \right)` (desigualtat de Boole)

**Demostració**: (1) tot seguit, (2) exercici.

.. nextslide:: Demostració punt (1) resultat anterior
	:increment:

Demostració punt (1): Recordem que una partició :math:`C_1, \cdots, C_N` d' :math:`\Omega`
és una col.lecció de conjunts tal que :math:`\cup_i C_i = \Omega` i :math:`C_i \cap C_j = \emptyset, \forall i\neq j`.

Tenim doncs la següent cadena d'identitats:

.. math::

    A &= A \cap \Omega \\
    A & = A \cap \cup_i C_i \\
    A & = \cup_i \left( A \cap C_i \right)\\
    P\left(A\right) & = P\left(\cup_i \left( A \cap C_i\right)\right)

i com que :math:`A \cap C_i` i :math:`A \cap C_j` son disjunts, el resultat
s'obté considerant el 3er axioma de Kolmogorov.


Exemples d'espais de probabilitat
--------------------------------------------------

**Experiment 1**: Modelar el resultat de llançar un dau de 6 cares

* :math:`\Omega = \left\{1, 2, 3, 4, 5, 6\right\}`
* :math:`\mathcal{A} = \left\{ \left\{1\right\}, \left\{2\right\}, \cdots, \left\{1, 2\right\}, \cdots \right\}`
* :math:`P\left(x\right) = \frac{1}{6}, x \in \Omega`

.. rst-class:: note

    **Exercici**: Com definirieu :math:`P\left(A\right)` per a qualsevol :math:`A \in \mathcal{A}`?

.. rst-class:: build

* Resposta: :math:`P\left(A\right) = \sum_{x \in A} P\left(x\right)`. Podeu comprovar que aquesta construcció satisfà els axiomes.

.. nextslide::
	:increment:

**Experiment 2**: Escollir 100 persones i fer-els-hi una prova d'anticossos per SARS-COV-2

* :math:`\Omega = \left\{+, -\right\}^{100}`
* :math:`\mathcal{A} = ?`
* :math:`P\left(A\right) = ?`

**Experiment 3**: Escollir aleatòriament un estudiant d'questa classe i mesurar-ne la seva alçada

* :math:`\Omega = \left[0, \infty \right)`
* :math:`\mathcal{A} = ?`
* :math:`P\left(A\right) = ?`


Independència i probabilitat condicional
==========================================

Probabilitat condicional
--------------------------------

Donats :math:`A, B \in \mathcal{A}`, amb :math:`P\left(B\right) > 0`,
:math:`P\left(A|B\right) = \frac{P\left(A \cap B\right)}{P\left(B\right)}` (aquesta construcció satisfà els axiomes de Kolmogorov)

.. figure::  /_static/0_Intro/proba_condicional.png
    :height: 300px
    :align: center

.. nextslide::
	:increment:

:math:`P\left(\cdot|B\right)` és la restricció de :math:`P` al subconjunt d'esdeveniments B. Alguns preguntes/petits exercicis interessants:

.. rst-class:: build

1. Tindria sentit definir :math:`P\left(A|B\right)` si :math:`P\left(B\right) = 0`?
2. Si :math:`A \cap B = \emptyset`, :math:`P\left(A|B\right)`?
3. Com podem interpretar si :math:`P\left(A|B\right) =P\left(A\right)`? Podeu donar un exemple "físic"?
4. Si :math:`A \subseteq B`, quina relació hi ha entre :math:`P\left(A|B\right)` i :math:`P\left(A\right)`?

Esdeveniments independents
--------------------------------

Diem que :math:`A, B \in \mathcal{A}`, són independents si:

:math:`P\left(A \cap B\right) =P\left(A\right)P\left(B\right)`

Això és equivalent a :math:`P\left(A|B\right) =P\left(A\right)` si :math:`P\left(B\right) > 0`.

Algunes preguntes [Casella & Berger Teorema 1.3.9] (mirem de respondre per intució primer i matemàticament després):

.. rst-class:: build

1. Si :math:`A, B \in \mathcal{A}` son independents, què podem dir de :math:`A, B^c`?
2. Si :math:`A, B \in \mathcal{A}` son independents, què podem dir de :math:`A^c, B^c`?


.. nextslide:: Precaució, estimat conductor

Per exemple, l'independència conjunta no implica independència de parells:

.. figure::  /_static/0_Intro/ex_independencia.png
    :height: 300px
    :align: center

Calculem :math:`P\left(A \cap B \cap C\right)` i :math:`P\left(B \cap C\right)`...

*Nota:* l'independència de parells tampoc implica independència mútua (veure Problema)

.. nextslide:: Independència mútua
    :increment:

Per resoldre aquests problemes, fa falta una definició molt més estricta
de la noció d'independència en conjunts d'esdeveniments:

.. rst-class:: note

    **Definició** :math:`A_1, A_2 \cdots, \in \mathcal{A}` són mutualment independents si per cualsevol
    subcol.lecció :math:`A_{i_1}, A_{i_2} \cdots, \in \mathcal{A}`, tenim que :math:`P\left(\cap_j A_{i_j}\right) = \Pi_j P\left(A_{i_j}\right)`

(En aquest curs, quan parlem de mostres independents, estarem assumint independència mútua)


Variables aleatòries i funcions de distribució
==============================================

Variable aleatòria
--------------------------------

.. rst-class:: note

    **Definició** Una variable aleatòria (*v.a.* pels amics) és una funció :math:`X : \Omega \to \mathbb{R}`.

Podem doncs definir una funció de probabilitat:

:math:`P_X\left(X \in A\right) = P\left(\left\{s\in \Omega: X\left(s\right) \in A \right\}\right)`

que satisfà els axiomes de Kolmogorov:

a. :math:`\Omega` **contable**: Fàcil, :math:`P_X\left(X \in A\right) = \sum_{s\in \Omega: X\left(s\right) \in A } P\left(s\right)`
b. :math:`\Omega` **incontable**: Una mica més complicat...

.. rst-class:: note

    Enlloc de treballar amb :math:`P_X\left(X \in A\right)`, en general caracteritzarem les v.a. a través de les seves funcions de distribució, de massa o de densitat.


.. nextslide:: Exemple de variable aleatòria discreta
    :increment:

Revisitem l'**Experiment 2** anterior (escollim 100 persones i fem una prova d'anticossos per SARS-COV-2)

* Teniem que :math:`\Omega = \left\{+, -\right\}^{100}`
* Definim v.a. :math:`X : \left\{+, -\right\}^{100} \to \mbox{Nombre de +} \in \left[0, 100\right]`

**Exercici**: Fent servir l'identitat :math:`P_X\left(X \in A\right) = \sum_{s\in \Omega: X\left(s\right) \in A } P\left(s\right)`, derivem :math:`P_X\left(X=k\right)`.

.. nextslide:: Exemple de variable aleatòria contínua
    :increment:

Revisitem l'**Experiment 3**. Escollim un estudiant d'aquesta classe i aquest cop mesurem la raó alçada/pes:

* :math:`\Omega = \left(0, \infty \right) \times \left(0, \infty \right)`
* :math:`X: (x, y) \in \Omega \to \frac{x}{y}`
* Com calculariem :math:`P_X\left(X \in A\right)`?

.. rst-class:: note

    En la gran majoria de problemes haurem de fer una hipòtesi sobre el model aleatori de les observacions (hipòtesi que després haurem de validar comprovant la *bondat de l'ajust*)


Funció de distribució
--------------------------------

.. rst-class:: note

    **Definició** La funció de distribució cumulativa (f.d.c.) d'una v.a. es defineix com :math:`F\left(x\right) = P\left(X \leq x\right)`.

De fet qualsevol funció pot ser una f.d.c si compleix [Casella & Berger Teorema 1.5.3]:

1. :math:`\lim_{x\to -\infty} F(x) = 0` i :math:`\lim_{x\to \infty} F(x) = 1`
2. :math:`F(x)` és no-decreixent
3. :math:`F(x)` és contínua per la dreta (:math:`\lim_{x\to x_0^+} F(x) = x_0`)

.. rst-class:: note

    El més important es que la f.d.c caracteritza únicament una variable aleatòria: si :math:`F_X = F_Y`, aleshores :math:`X` i :math:`Y` són idènticament distribuïdes [Casella & Berger 1.5.8 i 1.5.10]


Funció de massa o densitat de probabilitat
-------------------------------------------

A voltes ens serà més pràctic treballar amb un altre objecte, la funció de massa de probabilitat (f.m.p.) :math:`p_X` o de densitat de probabilitat (f.d.p) :math:`f_X`.

* **Cas discret**: :math:`p_X\left(k\right) = P_X\left(X=k\right)` (noteu que :math:`F_X\left(x\right) = \sum_{k=-\infty}^{x}p_X\left(k\right))`)
* **Cas "continu"**: La funció :math:`f_X` tal que :math:`F_X\left(x\right) = \int_{-\infty}^x f_X\left(t\right)dt`

.. rst-class:: note

    Aquí ens desviem una mica de la notació de [Casella & Berger] al fer servir :math:`p_X` enlloc de :math:`f_X` per la f.m.p.

.. warning::

    Estem ometent molts "detalls" tècnics importants... Hi ha variables contínues per les que :math:`f_X` no existeix.

.. nextslide::
    :increment:

Tal i com hem fist per la f.d.c, tenim un resultat similar per la f.d.p o la f.m.p: :math:`f_X\left(x\right)` (:math:`p_X\left(k\right)`)
és una f.d.p (f.m.p) si i només si [Casella & Berger 1.6.5]:

a. :math:`f_X\left(x\right) \geq 0, \forall x` (:math:`p_X\left(k\right) \geq 0, \forall k`)
b. :math:`\int_{\infty}^{\infty} f_X\left(x\right)dx = 1` (:math:`\sum_{\infty}^{\infty} p_X\left(k\right) = 1`)

Per tant podem construir una f.d.p. a partir de qualsevol funció :math:`h\left(x\right)` no-negativa, definint:

:math:`K = \int_{\infty}^{\infty} h\left(x\right)dx` (també coneguda com *funció de partició*)

i :math:`f_X\left(x\right) = \frac{h\left(x\right)}{K}`. Això es fa servir per exemple
en uns objectes anomentats `Models Gràfics Probabilístics <https://en.wikipedia.org/wiki/Graphical_model>`_.


Exemple: funció de distribució i massa d'una v.a. geomètrica
-------------------------------------------------------------

Considerem la variable aleatòria corresponent a l'experiment de
llançar una moneda fins que surti cara.

.. rst-class:: build

* L'espai mostral és: :math:`\Omega = \left\{C, XC, XXC, \cdots \right\}`
* Definim la v.a. :math:`X` com el nombre de creus que obtenim abans de la primera cara.

Si suposem que:

1. Cada llançament és independent de l'altre (pregunta: podeu imaginar una situació en que no ho fos)
2. La probabilitat de cara és :math:`p`

Podem calcular :math:`p_X\left(k\right)=?`

.. nextslide::

La f.m.p és la distribució geomètrica:

:math:`p_X\left(k\right) = P\left(\mbox{X}\right)^{k-1}P\left(\mbox{C}\right) = \left(1-p\right)^{k-1}p`

A partir de la qual podem calcular la f.d.c:

:math:`F_X\left(x\right) = \sum_{k=1}^x p_X\left(k\right) = \sum_{k=1}^x \left(1-p\right)^{k-1}p`

utilitzant l'identitat :math:`\sum_{k=1}^x \rho^{x-1}=\frac{1-\rho^x}{1-\rho}`, podem arribar a:

:math:`F_X\left(x\right) = 1 - \left(1-p\right)^x`

Seria interessant que comprovéssiu que :math:`F_X\left(x\right)` compleix les condicions per
ser una f.d.c.

.. nextslide:: Propietat *memoryless* de les v.a. geomètriques

Una v.a. :math:`X` és *memoryless* si:

:math:`P\left(X > m+n | X > m\right) = P\left(X > n \right)`

*Exercici:* Comprovem que aquesta propietat es verifica per la :math:`p_X\left(k\right)` geomètrica.

* L'interpretació de la propietat és interessant, per exemple, en el contexte de la loteria: No haver guanyat després de jugar 10 cops no incrementa la probabilitat que guanyem en els següents 10 cops...
* Aquesta propietat no és tant freqüent com podria semblar.

Exemples de distribucions discretes
-------------------------------------------


Exemples de distribucions contínues
-------------------------------------------


Esperança i moments
==========================================

Desigualtats
==========================================



Distribucions conjuntes i marginals
==========================================


Problemes
=================================================


Espais i mesures de Probabilitat
---------------------------------

**Conjunts**

Demostreu les següents identitats: Donats dos subconjunts arbitraris A i B:

* :math:`B = \left(B \cap A\right) \cup \left(B \cap A^c\right)`
* :math:`A \cup B = A \cup \left(B \cap A^c\right)`

**Conseqüències dels axiomes de probabilitat**

Practiquem amb els axiomes per demostrar que:

1. :math:`P\left(\emptyset\right)=0`

2. :math:`P\left(A\right) \leq 1`

3. :math:`P\left(A^c\right)=1-P\left(A\right)`


**Desigualtat de Boole**


.. nextslide::
    :increment:

**Desigualtat de Bonferroni**

La desigualtat de Bonferroni per dos esdeveniments :math:`A, B` estableix que:

:math:`P\left(A \cap B\right) \geq P\left(A\right) + P\left(B\right) - 1`

És útil quan la probabilitat conjunta dels esdeveniments no és fàcil de calcular (per
exemple quan aquests no són independents).

1. Demostreu la desigualtat de Bonferroni

2. Per quin tipus d'esdeveniments no és trivial, és a dir, ens serveix per
aproximar la probabilitat de l'esdeveniment conjunt?

3. Demostreu la desigualtat de Bonferroni en el cas genèric :math:`P\left(\cap_i A_i\right) \geq \sum_i P\left(A_i\right) - (n - 1)`

4. Definiu un experiment i una col.lecció d'esdeveniments :math:`A_i` on la desigualtat de Bonferroni ens donaria una cota inferior útil.
Per exemple: Comparacions múltiples, controlar la probabilitat de que totes donguin "positiu".



Probabilitat condicional i independència
-----------------------------------------

Problema X: Independència de parells vs independència mútua
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Exercici per entendre perquè independència a parells no implica independència mútua


Problema Z: Distribució binomial negativa
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Una extensió de la distribució geomètrica que hem vist a classe és la distribució
binomial negativa. Es correspon amb l'experiment bla bla bla


Problema Y: Esperança condicional i correcció del biaix de sel.lecció
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Durant el curs hem vist un exemple de com el biaix de sel.lecció pot perjudicar els nostres estimadors.
En alguns casos, es pot corregir l'efecte fàcilment.

1. Demostra que E(\sum \frac{1}{P}X) = E(X) bla bla bla

Variables aleatòries
-----------------------------------------

**Barreja de Gaussianes** (Gaussian Mixture Models)


Esperança i moments
-----------------------------------------

Desigualtats
-----------------------------------------

Distribucions conjuntes i marginals
-----------------------------------------


Pràctica
=================================================


Familiarització amb R/pandas amb el conjunt de dades Iris
---------------------------------------------------------


Fórmula de Bayes i la seva aplicació
-------------------------------------

Aplicació de probabilitat condicional: mètode de Bayes naïf




Teorema de la transformació per integració i l'aplicació a la simulació de v.a.
------------------------------------------------------------------------------------



