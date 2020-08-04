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

   Comencem amb un exemple

    .. math::

       (a + b)^2 = a^2 + 2ab + b^2

       P\left(\mathbf{X}\mathbf{\beta}\right)

    .. math::
       :nowrap:

       \begin{eqnarray}
          y    & = & ax^2 + bx + c \\
          f(x) & = & x^2 + 2xy + y^2
       \end{eqnarray}


.. slide:: Qui sóc jo?
   :level: 3

    * Cap de Data Science a letgo
    * 10 anys d'experiència com a `Data Scientist` a l'indústria
    * Phd en EE

.. slide:: Funcionament del curs i evaluació
   :level: 3

    NOTA: Aquest curs és la primera vegada que l'ensenyo: necessitaré la vostra ajuda :)

    * Classes de teoria: estadística matemàtica
    * Resolució de problemes proposats com a deures
    * Classes pràctiques amb programari (R/Python)

.. slide:: Temari i guia docent
   :level: 3

    * Tema 1: Introducció a l'inferència estadística
    * Tema 2: bla bla


Recordatori de Probabilitat
===============================

.. slide:: Espai de probabilitat
   :level: 3

    Un **espai de probabilitat** és un model matemàtic del resultat d'un **experiment aleatori**.

    Consisteix en una tupla :math:`\left(\Omega, \mathcal{A}, P\right)`:

    * :math:`\Omega`: l'**espai mostral**, conjunt de resultats possibles d'un experiment
    * :math:`\mathcal{A}`: els **esdeveniments**, una família de subconjunts de :math:`\Omega`
    * :math:`P`: una **mesura de probabilitat**, que mapeja :math:`\mathcal{A} \rightarrow \left[0, 1\right]`

.. slide:: Mesura de probabilitat
   :level: 3

    Per ser consider considerada una **mesura de probabilitat**, una funció :math:`P: \mathcal{A} \rightarrow \left[0, 1\right]`
    ha de satisfer els següents axiomes:

    1. :math:`P\left(\Omega\right)=1`

    2. Per qualsevol esdeveniment :math:`A\in\mathcal{A}`, :math:`P\left(A\right)\geq 0`

    3. Per :math:`A_1,A_2\in\mathcal{A}` disjunts, :math:`P\left(A_1 \cup A_2\right) = P\left(A_1\right) + P\left(A_2\right)`

.. slide:: Exemples
   :level: 3

   **Experiment aleatori**: Observar el valor resultant de llançar un dau de 6 cares


   * :math:`\Omega = \left\{1, 2, 3, 4, 5, 6\right\}`
   * :math:`\mathcal{A} = \left\{1, 2, 3, 4, 5, 6\right\}`
   * :math:`P\left(A\right) = \frac{1}{6}, \forall A \in \mathcal{A}`

.. slide:: Exemples
   :level: 3

   **Experiment aleatori**: Escollir 100 persones, fer-els-hi una prova d'anticossos per SARS-COV-2
i calcular el nombre de persones que donen positiu


   * :math:`\Omega = \left\{1, 2, 3, 4, 5, 6\right\}`
   * :math:`\mathcal{A} = \left\{1, 2, 3, 4, 5, 6\right\}`
   * :math:`P\left(A\right) = \frac{1}{6}, \forall A \in \mathcal{A}`
