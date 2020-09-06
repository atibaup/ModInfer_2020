===============================
Tema 1: Preliminars
===============================


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
* :math:`\mathcal{A} \subset 2^{\Omega}`: els **esdeveniments**, una família de subconjunts d':math:`\Omega`
* :math:`P`: una **mesura de probabilitat**, una funció :math:`\mathcal{A} \rightarrow \left[0, 1\right]`


Mesura de probabilitat
-------------------------------

Una **mesura de probabilitat** :math:`P: \mathcal{A} \rightarrow \left[0, 1\right]`
ha de satisfer els següents axiomes:

1. :math:`P\left(\Omega\right)=1`

2. Per qualsevol esdeveniment :math:`A\in\mathcal{A}`, :math:`P\left(A\right)\geq 0`

3. Per :math:`A_1,A_2\in\mathcal{A}` disjunts, :math:`P\left(A_1 \cup A_2\right) = P\left(A_1\right) + P\left(A_2\right)`


.. nextslide::
	:increment:

Això és una construcció axiomàtica de Probabilitat, formalitzada per Kolmogorov.

Noteu que no hi ha cap interpretació sobre el significat físic dels valors de :math:`P`.

Dues interpretacions possibles:

* **Frequentista**: :math:`P\left(A\right)` representa la frequència amb que observariem l'esdeveniment `A`
si realitzéssim un gran nombre d'experiments

* **Bayesiana**: :math:`P\left(A\right)` representa


Aquest no és un curs de probabilitat...
---------------------------------------

Per tant amagarem "detalls" important sota l'alfombra:

* :math:`\mathcal{A}` en realitat ha de ser una :math:`\sigma`-àlgebra
* Per a conjunts :math:`\Omega` contables, podem tirar milles
* La cosa es complica quan :math:`\Omega` no és discret (exemples: l'alçada d'una població, el nivell d'expressió d'un gen)

**Recomano** donar una ullada al [Casella & Berger] o a una altra de les referències
bibliogràfiques per una intro no tècnica a les :math:`\sigma`-àlgebres



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
