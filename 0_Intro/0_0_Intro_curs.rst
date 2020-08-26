.. slideconf::
   :autoslides: False

=================================================
Benvinguts a `104392 - Modelització i Inferència`
=================================================


.. math::

   (a + b)^2 = a^2 + 2ab + b^2

   (a - b)^2 = a^2 - 2ab + b^2

.. math::
   :nowrap:

   \begin{eqnarray}
      y    & = & ax^2 + bx + c \\
      f(x) & = & x^2 + 2xy + y^2
   \end{eqnarray}

.. slide:: 104392 - Modelització i Inferència
   :level: 1

   arnau.tibau@uab.cat

.. slide:: Benvinguts a `104392 - Modelització i Inferència`
   :level: 3

    **Exemple 1**: Caracterització de plantes (`R. A. Fisher 1936 <https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-1809.1936.tb02137.x>`_)

    Mesurem la longitud i amplada dels sèpals i els pètals de 50 exemplars de tres espècies diferents del gènere *Iris*

    .. image::  /_static/0_Intro/iris_pics.png
        :width: 600px
        :align: center
        :alt: Iris Images

.. slide:: Exemple 1: Caracterització de plantes (II)
   :level: 3

    .. image::  /_static/0_Intro/iris_dataset_sample.png
        :width: 500px
        :align: center
        :alt: Iris dataset (13 primeres mostres)

    * Quan solen mesurar els pètals de les *Iris*?
    * Hi ha alguna relació entre la morfologia i cada espècie d'*Iris*?
    * Donades les mesures d'un especímen nou, el podríem classificar en l'espècie correcta?

.. slide:: Exemple 1: Caracterització de plantes (III)
   :level: 3

    .. image::  /_static/0_Intro/iris_dataset_sample.png
        :width: 300px
        :align: center
        :alt: Iris dataset (13 primeres mostres)

    * Quan solen mesurar els pètals de les Iris? :math:`\rightarrow` **Estimació**
    * Hi ha alguna relació entre la morfologia i cada espècie d'*Iris*? :math:`\rightarrow` **Estimació**
    * Donades les mesures d'un especímen nou, el podríem classificar en l'espècie correcta? :math:`\rightarrow`  **Predicció**

.. slide:: Exemple 2: Assaig clínic
   :level: 3

    **Exemple 2**: Eficacitat d'un tractament profilàctic per als contactes de casos COVID-19 (`O. Mitjà et al. 2020 <https://www.medrxiv.org/content/10.1101/2020.07.20.20157651v1>`_)

    Seleccionem **aleatòriament** [*]_ dos grups de pacients de COVID-19:

    * **Control**: Tractament convencional
    * **Intervenció**: Administració d'*hidroxicloroquina*

    Al cap de 14 dies, contem quants individus en cada grup  tenen símptomes **i** dónen positiu en una prova PCR.

    .. [*] En realitat l'experiment fa `cluster-randomization <https://en.wikipedia.org/wiki/Cluster_randomised_controlled_trial>`_.

.. slide:: Exemple 2: Assaig clínic (II)
   :level: 3

    * Quants pacients hem de seleccionar per prendre una decisió sobre la població general? :math:`\rightarrow`  **Mostreig**
    * Com sabem si hem seleccionat els grups adequadament? :math:`\rightarrow`  **Mostreig, Estimació**
    * Com determinem si el tractament funciona? :math:`\rightarrow`  **Tests d'hipòtesi**

    .. image::  /_static/0_Intro/mitja_et_al_resultats.png
        :width: 600px
        :align: center
        :alt:

.. slide:: Exemple 3: Recomanacions de películes
   :level: 3

    **Exemple 3**: Tenim una plataforma de vídeo en streaming i volem millorar les nostres recomanacions.
    En particular, volem saber si, donat un usuari i un producte, a l'usuari li agradarà.


    .. figure::  /_static/0_Intro/movielens.png
        :width: 600px
        :align: center
        :alt:

.. slide:: Exemple 3: Recomanacions de películes (II)
   :level: 3

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

.. slide:: Exemple 3: Recomanacions de películes (III)
   :level: 3

    * Donada una película que l'usuari encara no ha vist, podem determinar si li agradarà o no? :math:`\rightarrow`  **Regressió**
    * Si implementem un model estadístic de recomanacions, com podem saber si millora l'experiència dels nostres usuaris o no? :math:`\rightarrow`  **Mostreig, Tests d'hipòtesi, Estimació**


.. slide:: Qui sóc jo?
   :level: 3

    * Cap de Data Science a letgo
    * 10 anys d'experiència com a `Data Scientist` a l'indústria
    * Phd en EE

.. slide:: Funcionament del curs
   :level: 3

    * Classes de teoria: estadística matemàtica
    * Resolució de problemes proposats com a deures
    * Classes pràctiques amb programari (R/Python)


.. slide:: Avaluació
   :level: 3

    * Classes de teoria: estadística matemàtica
    * Resolució de problemes proposats com a deures
    * Classes pràctiques amb programari (R/Python)


.. slide:: Coses a tenir en compte
   :level: 3

    Aquest curs és la primera vegada que l´ensenyo:

    * Pot haver-hi alguna errada a les slides/apunts
    * Termes anglès català

    Necessitaré la vostra col.laboració!


.. slide:: Convenció de notació
   :level: 3



.. slide:: Temari i guia docent
   :level: 3

    * Tema 1: Introducció a l'inferència estadística
    * Tema 2: bla bla


Recordatori de Probabilitat
===============================

.. slide:: Probabilitat
   :level: 1

.. slide:: Espai de Probabilitat
   :level: 2

.. slide:: Espai de probabilitat
   :level: 3

    Un **espai de probabilitat** és un model matemàtic del resultat d'un **experiment aleatori**.

    Consisteix en un triplet :math:`\left(\Omega, \mathcal{A}, P\right)`:

    * :math:`\Omega`: l'**espai mostral**, conjunt de resultats possibles d'un experiment
    * :math:`\mathcal{A} \subset 2^{\Omega}`: els **esdeveniments**, una família de subconjunts d':math:`\Omega`
    * :math:`P`: una **mesura de probabilitat**, una funció :math:`\mathcal{A} \rightarrow \left[0, 1\right]`

.. slide:: Mesura de probabilitat
   :level: 3

    Una **mesura de probabilitat** :math:`P: \mathcal{A} \rightarrow \left[0, 1\right]`
    ha de satisfer els següents axiomes:

    1. :math:`P\left(\Omega\right)=1`

    2. Per qualsevol esdeveniment :math:`A\in\mathcal{A}`, :math:`P\left(A\right)\geq 0`

    3. Per :math:`A_1,A_2\in\mathcal{A}` disjunts, :math:`P\left(A_1 \cup A_2\right) = P\left(A_1\right) + P\left(A_2\right)`


.. slide:: Mesura de probabilitat (II)
   :level: 3

    Això és una construcció axiomàtica de Probabilitat, formalitzada per Kolmogorov.

    Noteu que no hi ha cap interpretació sobre el significat físic dels valors de :math:`P`.

    Dues interpretacions possibles:

    * **Frequentista**: :math:`P\left(A\right)` representa la frequència amb que observariem l'esdeveniment `A`
    si realitzéssim un gran nombre d'experiments

    * **Bayesiana**: :math:`P\left(A\right)` representa


.. slide:: Això no és un curs de probabilitat...
   :level: 3

    Per tant amagarem "detalls" important sota l'alfombra:

    * :math:`\mathcal{A}` en realitat ha de ser una :math:`\sigma`-àlgebra
    * Per a conjunts :math:`\Omega` contables, podem tirar milles
    * La cosa es complica quan :math:`\Omega` no és discret (exemples: l'alçada d'una població, el nivell d'expressió d'un gen)

    **Recomano** donar una ullada al Kendall per una intro no tècnica a les :math:`\sigma`-àlgebres



.. slide:: Espai de probabilitat: Dau de 6 cares
   :level: 3

   **Experiment**: Observar el valor resultant de llançar un dau de 6 cares


   * :math:`\Omega = \left\{1, 2, 3, 4, 5, 6\right\}`
   * :math:`\mathcal{A} = \left\{ \left\{1\right\}, \left\{2\right\}, \cdots, \left\{1, 2\right\}, \cdots \right\}`
   * :math:`P\left(\left\{x\right\}\right) = \frac{1}{6}`

.. slide:: Exemple II: Proves d'anticossos
   :level: 3

   **Experiment**: Escollir 100 persones i fer-els-hi una prova d'anticossos per SARS-COV-2

   * :math:`\Omega = \left\{+, -\right\}^{100}`
   * :math:`\mathcal{A} = \left\{...'\right\}`
   * :math:`P\left(A\right) = ....`

.. slide:: Exemple III: Alçada d'una persona escollida aleatòriament
   :level: 3

    **Experiment**: Escollir aleatòriament un estudiant de l'UAB i mesurar-li la seva alçada

    * :math:`\Omega = \left[0, \infty \right)`
    * :math:`\mathcal{A} = \left\{...\right\}`
    * :math:`P\left(A\right) = ...`


.. slide:: Independència i probabilitat condicional
   :level: 2


.. slide:: Esperança i moments
   :level: 2


.. slide:: Variables aleatòries
   :level: 2

.. slide:: Variables aleatòries multivariades
   :level: 2


.. slide:: Sequències i Convergència
   :level: 2


















