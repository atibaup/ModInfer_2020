.. slideconf::
   :autoslides: False

=================================================
Intro a l'inferència estadística
=================================================

.. slide:: Intro a l'inferència estadística
   :level: 1

.. slide:: Mostreig
   :level: 2

.. slide:: Què ens interessa?
   :level: 3

   En aquesta secció desenvoluparem la teoria necessària per respondre a les següents preguntes:

    - Com podem caracteritzar estadísticament una *població* o un *experiment aleatori*?
    - Com de fiables són aquestes caracteritzacions?

    TBD: Figura ilustrativa

.. slide:: Exemple I: Volem estimar la prevalència d'anticossos de SARS-COV-2 en la població espanyola
   :level: 3

   Suposem


.. slide:: Exemple II: Volem caracteritzar ... [TBD]
   :level: 3

   TBD: Exemple caracterització experiment aleatori (població infinita)


.. slide:: Població estadística
   :level: 3

    Quan parlem de *població* ens podem referir a:

    * Un conjunt *finit* i *"petit"* d'elements dels quals mesurem una quantitat real. Exemple: les alçades de les persones d'aquesta classe.

    * Un conjunt *finit* però *"gran"* d'elements dels quals mesurem una quantitat real. Exemple: les mesures dels sèpals i pètals de les diferents espècies d'*Iris*

    * Una abstracció que caracteritza el fet de mesurar una o diverses variables aleatòries caracteritzades per una funció de distribució de probabilitat. Per exemple:

    ps: A efectes pràctics, l'únic que ens interessa és si al mostrejar una població, l'efecte de mostrejar canvia
    la distirbució de la mesura o no


.. slide:: Mostreig
   :level: 3

    El mostreig és l'acció de sel.leccionar i mesurar un **subconjunt de la població**.

    El mostreig més simple és l'aleatori: escollim un membre de la població a l'atzar, i en mesurem l'atribut.

    En poblacions infinites, l'acte de mostrejar no afecta la distribució de les següents mostres.

    En poblacions finites, un mostreig aleatori *sense remplaçament* sí que impacta la distribució de les mostres
    subsegüents (exercici)

.. slide:: Mostra *iid*: Definició
   :level: 3

    En la resta del curs, ens centrarem en **mostres aleatòries de poblacions infinites**. És una prou bona aproximació
    en la majoria de casos pràctics (exercici)

    .. rst-class:: note

        **Definició**: Les variables aleatòries :math:`\left\{X_0, \cdots, X_{n-1}\right\}` són una mostra aleatòria d'una població
        caracteritzada per una *fdp* :math:`f(x)`, si :math:`\left\{X_0, \cdots, X_{n-1}\right\}` són **mutualment independents** i :math:`X_i \sim f(x)`.

    Alternativament :math:`\left\{X_0, \cdots, X_{n-1}\right\}` s'anomenen **independents i idènticament distribuïdes** (abreviat *iid*)


.. slide:: Exemple de mostres *iid*: Aplicació d'inferència
   :level: 3

    [Kendall Exemple: 5.1.2] Volem caracteritzar la vida útil (en anys) :math:`X_i` d':math:`n` circuits electrònics. Si
    :math:`X_i \sim \mathbf{exponential}\left(\beta\right)`, quina és la probabilitat que tots els circuits mesurats durin més de 2 anys?

    * Els esdeveniments :math:`\left\{X_1 \leq x_1, \cdots, X_{N} \leq x_{N}\right\}` són mutualment independents (el fet de mesurar un subconjunt de circuits no té cap impacte en la mesura dels altres)

    * Per independència, la *fdp* conjunta de :math:`\left\{X_1, \cdots, X_{N}\right\}` és :math:`f\left(x_1, \cdots, x_{N}\right) = \Pi_{i=0}^{n-1}f\left(x_i\right) = \frac{1}{\beta^n}\exp^{\frac{-\sum_i x_i}{\beta}}`

    .. math::

        P\left(X_1 \geq 2, \cdots, X_N \geq 2\right) &= \int_{2}^{\infty}\cdots\int_{2}^{\infty}\frac{1}{\beta^n}e^{\frac{-\sum_i x_i}{\beta}} dx_1\cdots dx_N \\
                                                     &= e^{-\frac{2n}{\beta}}

.. slide:: Exemple de mostres **no** *iid*: Població finita
   :level: 3

    Tenim una població de n=30 persones, representades per la seva alçada: :math:`\left\{x_1, \cdots, x_n\right\}, x_i\in \left(0, \infty\right)`

    :math:`X_i`: alçada de la :math:`i`-ena persona sel.leccionada aleatòriament entre les 30. Si :math:`x_i\neq x_j, \forall i\neq j`, tenim:

    .. math::

        P\left(X_1 = x_k\right)             &= \frac{1}{n} \\
        P\left(X_2 = x_l | X_1 = x_k\right) &= \left\{\begin{array}{cc} 0 & l=k \\ \frac{1}{n-1} &l\neq k \end{array}\right.

    .. rst-class:: note

        :math:`P\left(X_2 | X_1 = x_k\right) \neq P\left(X_2\right) \neq P\left(X_1\right) \Rightarrow` Les mostres :math:`X_1, X_2` no són ni independents, ni idènticament distribuïdes

    **Exercici**: Què passa si mostregem cada persona *amb remplaçament*?

    .. [*] Suposant que :math:`x_i\neq x_j, \forall i,j`


.. slide:: Exemple de mostres **no** *iid*: Biaix de sel.lecció
   :level: 3

    Mesurem el percentatge de pacients que requereixen hospitalització durant la pandèmia de COVID-19:

    * P_i: nombre de persones detectades positives el dia i
    * H_i: nombre de persones positives el dia i que van requerir hospitalització (en alguns dels T dies següents)

    [Mostrar gràfica nombre de tests]

    * Periòde 1: i entre Gener i Maig: P_i | Política de PCR 1
    * Periòde 2: i entre Maig i Juliol: P_i | Política de PCR 2

    -> Per tant P_i no és iid!

    **Exercici**: Quina seria una manera simple d'ajustar els valors del periòde 1 per tal de simular una situació id?


.. slide:: Estadístics i estimadors
   :level: 2

.. slide:: Estadístics: mitja i variança
   :level: 3

    Si ens donen un conjunt de dades i volem descriurel abreviadament, el més comú es calcular-ne:

    * La mitja: :math:`\bar{X} = \frac{1}{N}\sum_{i=1}^N X_i`

    * La variança: :math:`S^2 = \frac{1}{N-1}\sum_{i=1}^N \left(X_i -  \bar{X}\right)^2`

    Amb la mitja i la variança ja podem fer inferència:

    - Podem predir un valor no observat
    - Podem estimar com de rara és una observació

    La mitja i la variança són dos exemples d'un **estadístic**


.. slide:: Estadístics: definició
   :level: 3

    Donades mostres iid :math:`\left\{X_1, \cdots, X_N\right\}` d'un espai mostral :math:`\Omega`

    Un estadístic és una funció :math:`T: \Omega^N \subset D \rightarrow \mathbb{R}^p`, amb :math:`p \geq 1`.

    * La mitja i la variança de mostres reals són estadístics amb p=1.
    * La matriu de covariança de mostres formades per vectors és un estadístic amb p=d*(d-1)/2
    * Com que T és una funció de variables o vectors aleatòries, és també una variable o vector aleatori

    **Exercici**: Altres exemples d'estadístics?

.. slide:: Altres exemples d'estadístics
   :level: 3

    * Mediana
    * Percentil
    * Max/min (extrems)
    * Coeficient de correlació
    * Histograma
    * Entropía


.. slide:: Estimadors i paràmetres: definició
   :level: 3

    * normalment els estimadors son funcions d'un estadístic.

.. slide:: Relació entre estadístics, estimadors i paràmetres
   :level: 3

    El més freqüent és que utilitzem **estadístics** per generar un **estimador** d'un **paràmetre** de la població

    *Exemple*: Estimador de l'alçada mitja d'una població normal

    * mitja aritmètica: estadístic i estimador del paràmetre mitja de la població


.. slide:: Caracterització dels estimadors
   :level: 3

    Cualsevol nombre pot ser un estimador.

    Per exemple:

    * mu=170cm pot ser un estimador de l'alçada de la classe. Però no depèn de les dades.
    * un altre estimador (millor?) seria la mitja aritmètica.
    * un altre estimador seria la mediana.

    Quin és millor?


.. slide:: Caracterització dels estimadors (II)
   :level: 3

    * els estimadors són també variables aleatòries
    * els podem caracteritzar a diversos nivells:
        - esperança
        - variança
        - error quadràtic mitjà
        - la seva distribució de probabilitat



