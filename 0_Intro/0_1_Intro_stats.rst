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

   * Tenim una *població finita* de ~47M d'habitants
   * Sel.leccionem aleatòriament :math:`N` individus d'entre els 47M
   * :math:`X_i \sim \mbox{Bernouilli}\left(p\right)` indica si l'individu :math:`i` té anticossos
   * :math:`p` indica la prevalència real d'anticossos en la població
   * Volem estimar :math:`p` a partir de la mostra :math:`\left\{x_1,\cdots,x_N\right\}`
   * **Pregunta**: Quan gran ha de ser :math:`N`?


.. slide:: Exemple II: Volem caracteritzar ... [TBD]
   :level: 3

   TBD: Exemple caracterització experiment aleatori (població infinita)


.. slide:: Població estadística
   :level: 3

    Quan parlem de *població* ens podem referir a:

    * Un conjunt *finit* i *"petit"* d'elements dels quals mesurem una quantitat real. Exemple: les alçades de les persones d'aquesta classe.

    * Un conjunt *finit* però *"gran"* d'elements dels quals mesurem una quantitat real. Exemple: les mesures dels sèpals i pètals de les diferents espècies d'*Iris*

    * Una *abstracció* representant el fet de mesurar una o diverses variables aleatòries caracteritzades per una funció de distribució de probabilitat. Exemple: obtenir 4 asos al repartir 4 cartes d'una baralla de 52 cartes

    .. rst-class:: note

        A efectes pràctics, l'únic que ens interessa és si l'acte de mostrejar impacta la distribució de la mostra o no


.. slide:: Mostreig
   :level: 3

    El mostreig és l'acció de sel.leccionar i mesurar un **subconjunt de la població**.

    El mostreig més simple és l'aleatori: escollim un membre de la població a l'atzar, i en mesurem l'atribut.

    En poblacions infinites (o finites però suficientment grans), l'acte de mostrejar no afecta la distribució de les següents mostres.

    En poblacions finites, un mostreig aleatori *sense remplaçament* sí que impacta la distribució de les mostres
    subsegüents (vegeu exemple a continuació)

.. slide:: Mostra *iid*: Definició
   :level: 3

    En la resta del curs, ens centrarem en **mostres aleatòries de poblacions infinites**. És una prou bona aproximació
    en la majoria de casos pràctics (exercici)

    .. rst-class:: note

        **Definició**: Les variables aleatòries :math:`\left\{X_0, \cdots, X_{n-1}\right\}` són una mostra aleatòria d'una població
        caracteritzada per una *fdp* :math:`f(x)`, si :math:`\left\{X_0, \cdots, X_{n-1}\right\}` són **mutualment independents** i :math:`X_i \sim f(x)`.

    Alternativament :math:`\left\{X_0, \cdots, X_{n-1}\right\}` s'anomenen **independents i idènticament distribuïdes** (abreviat **iid**)


.. slide:: Exemple de mostres *iid*: Aplicació d'inferència
   :level: 3

    [Kendall Exemple: 5.1.2] Volem caracteritzar la vida útil (en anys) :math:`X_i` d':math:`n` circuits electrònics. Si
    :math:`X_i \sim \mathbf{exponential}\left(\beta\right)`, quina és la probabilitat que tots els circuits mesurats durin més de 2 anys?

    * Els esdeveniments :math:`\left\{X_1 \leq x_1, \cdots, X_{N} \leq x_{N}\right\}` són mutualment independents (el fet de mesurar un subconjunt de circuits no té cap impacte en la mesura dels altres)

    * Per independència, la *fdp* conjunta de :math:`\left\{X_1, \cdots, X_{N}\right\}` és :math:`f\left(x_1, \cdots, x_{N}\right) = \Pi_{i=0}^{n-1}f\left(x_i\right) = \frac{1}{\beta^n}\exp^{\frac{-\sum_i x_i}{\beta}}`

    .. math::

        P\left(X_1 \geq 2, \cdots, X_N \geq 2\right) &= \int_{2}^{\infty}\cdots\int_{2}^{\infty}\frac{1}{\beta^n}e^{\frac{-\sum_i x_i}{\beta}} dx_1\cdots dx_N \\
                                                     &= e^{-\frac{2n}{\beta}}

.. slide:: Exemple de mostres **no-iid**: Població finita
   :level: 3

    Tenim una població de n=30 persones, representades per la seva alçada: :math:`\left\{x_1, \cdots, x_n\right\}, x_i\in \left(0, \infty\right)`

    :math:`X_i`: alçada de la :math:`i`-ena persona. Si :math:`x_i\neq x_j, \forall i\neq j`, tenim:

    .. math::

        P\left(X_1 = x_k\right)             &= \frac{1}{n} \\
        P\left(X_2 = x_l | X_1 = x_k\right) &= \left\{\begin{array}{cc} 0 & l=k \\ \frac{1}{n-1} &l\neq k \end{array}\right.

    .. rst-class:: note

        :math:`P\left(X_2 | X_1 = x_k\right) \neq P\left(X_2\right) \neq P\left(X_1\right) \Rightarrow` Les mostres :math:`X_1, X_2` no són ni independents, ni idènticament distribuïdes

    **Exercici**: Què passa si mostregem cada persona *amb remplaçament*?


.. slide:: Exemple de mostres **no-iid**: Biaix de sel.lecció
   :level: 3

    Volem estimar l'edat mitjana dels casos de COVID-19. Prenem mostres:

    * :math:`T_i \in \left\{\mbox{Test}, \mbox{No Test}\right\}`: variable indicativa de test efectuat a l'individu :math:`i`
    * :math:`A_i \in \left(0, \infty\right)`: edat de l'individu :math:`i`

    Problema: criteri de sel.lecció no és el mateix per les mostres :math:`\left\{1, \cdots, N_A\right\}`
    que per les mostres :math:`\left\{N_A + 1, \cdots, N_B\right\}`! (Per exemple: només es testeja gent que arriva a
    l'hospital vs. cribatge generalitzat)


.. slide:: Exemple de mostres **no-iid**: Biaix de sel.lecció (II)
   :level: 3

    [Diagrama de Venn?]

    **Exercici**:

    * Se us acudeix una manera simple d'ajustar els valors de :math:`A_i` (veure Problemes)?
    * A la pràctica farem un ajust de les dades d'edat de COVID basat en l'*inverse probability weighting*


.. slide:: Estadístics i estimadors
   :level: 2

.. slide:: Estadístics: mitja i variança
   :level: 3

    Si ens donen un conjunt de dades i volem descriure'l abreviadament, el més comú es calcular-ne:

    * La mitja: :math:`\bar{X} = \frac{1}{N}\sum_{i=1}^N X_i`

    * La variança: :math:`S^2 = \frac{1}{N-1}\sum_{i=1}^N \left(X_i -  \bar{X}\right)^2`

    Amb aquestes dues quantitats ja podem fer inferència:

    - Podem predir el valor d'una nova observació
    - Podem estimar com de rara és una nova observació

    La mitja i la variança són dos exemples d'un **estadístic**.


.. slide:: Estadístics: definició
   :level: 3

    .. rst-class:: note

        **Definició:** Donades mostres iid :math:`\left\{X_1, \cdots, X_N\right\}` d'un espai mostral :math:`\Omega`,
        un estadístic és una funció :math:`T: D \subseteq \Omega^N \rightarrow \mathbb{R}^p`, amb :math:`p \geq 1`.

    * La mitja i la variança de mostres reals són estadístics amb p=1.
    * La matriu de covariança de mostres formades per vectors és un estadístic amb p=d*(d-1)/2

    Com que :math:`T` és una funció de variables o vectors aleatòries, :math:`T` és també una variable o vector aleatori

    **Exercici**: Altres exemples d'estadístics?

.. slide:: Altres exemples d'estadístics
   :level: 3

    * Mediana
    * Percentil
    * Max/min (extrems)
    * Coeficient de correlació
    * Risc relatiu (*odds ratio*)
    * Histograma
    * Entropía

.. slide:: Estimadors i paràmetres: Exemple en població finita
   :level: 3

    Tenim una població de :math:`n=47 \times 10ˆ6` persones, representades per la seva alçada: :math:`\left\{x_1, \cdots, x_n\right\}, x_i\in \left(0, \infty\right)`

    Podem definir un **paràmetre** que caracteritza la població, per exemple la seva mitja aritmètica:

    :math:`\mu = \frac{1}{n}\sum_{i=1}^n x_i`

    Aquesta és una quantitat **determinista**, però calcular-la requereix mesurar l'alçada de 47M de persones.

.. slide:: Estimadors i paràmetres: Exemple en població finita (II)
   :level: 3

    Enlloc d'això, podem construïr un **estimador** d'aquest **paràmetre**, a partir d'una mostra finita amb N=1000,
    per exemple, la mitjana empírica:

    :math:`\hat{\mu} = \frac{1}{N}\sum_{i=1}^N X_i`

    Noteu que :math:`X_i` representen la v.a. corresponent a mostrejar la població :math:`\left\{x_i\right\}` (amb remplaçament)

    Questions d'inferència:

    * Com de bé aproxima :math:`\hat{\mu}` a :math:`\mu`?
    * :math:`\hat{\mu}` és una variable aleatòria... quina distribució té?


.. slide:: Estimadors i paràmetres: Exemple en població infinita
   :level: 3

    En el cas d'una població infinita, normalment **assumim** que la mateixa
    està caracteritzada per una distribució de probabilitat parameteritzada per
    una sèrie de paràmetres (a vegades als paràmetres genèrics s'els denota per
    un vector :math:`\mathbf{\theta}`)

    Exemples:

    * La vida útil d'un circuit estava carateritzada per una exponencial amb paràmetre :math:`\beta`

    * Una mostra iid d'una població normal està caracteritzada per la mitja (:math:`\mu`) i la variança (:math:`\sigma^2`). Direm que :math:`\mathbf{\theta}=\left[\mu, \sigma^2 \right]`

    * El nombre de cares al llençar una moneda N vegades són mostres d'una població binomial amb paràmetre :math:`p`


.. slide:: Estimadors i estadístics
   :level: 3

    * En general els estimadors són estadístics
    * Fins ara em vist estimadors que són identitats d'estadístics (mitja, variança)
    * Més endavant veurem com construïr estimadors que són funcions més complexes de les dades o d'estadístics de les dades

    En tot cas ara ens interessarem en la caracterització probabilística dels estadístics.


.. slide:: Exercici de recapitulació
   :level: 3

    * Definim :math:`T:` bla bla: és un estadístic?
    * Quina és la població corresponent a l'experiment de sel.leccionar 4 cartes de pòker d´una baralla de 48?
    * Quan es fa una enquesta d´intenció de vot, quin tipus de població i mostres tenim?


.. slide:: Caracterització d'estadístics
   :level: 2

.. slide:: Caracterització d'un estadístic
   :level: 3

    La definició genèrica d´un estadístic (funció de variables aleatòries i.i.d)
    no ens aporta masses pistes sobre com caracteritzar-lo probabilísticament

    Haurem de fer doncs asssumpcions addicionals per caracteritzar-los analíticament:

    * tipus de funció (ex: mitja, variança, funció contínua i diferenciable)
    * distribució de les mostres (ex: mostres normals)
    * comportament asimptòtic (quan el nombre mostres tendeix a l'infinit)

    o bé utilitzar eines computacionals:

    * bootstrap
    * simulació

    Comencem doncs pels casos més senzills: la mitjana aritmètica i la variança


.. slide:: Caracterització dels estadístics mitjana i variança
   :level: 3

    Comencem per un resultat auxiliar important:

    .. rst-class:: note

        **Lemma 5.2.5:** Donades mostres iid :math:`\left\{X_1, \cdots, X_N\right\}` amb esperança finita, i una funció
        arbitrària :math:`g` tenim que:

        * :math:`E\left(\sum_{i=1}^N g\left(X_i\right)\right) = N E\left(g\left(X\right)\right)`
        * :math:`\mbox{Var}\left(\sum_{i=1}^N g\left(X_i\right)\right) = N \mbox{Var}\left(g\left(X\right)\right)`

    Demostració (exercici). Recordeu:

    * Linearitat de l´esperança
    * Covariança de v.a. independents


.. slide:: Caracterització dels estadístics mitjana i variança (II)
   :level: 3

    Com a corolari del darrer Lemma, tenim:

    .. rst-class:: note

        **Teorema 5.2.6:** Donades mostres iid :math:`\left\{X_1, \cdots, X_N\right\}` amb esperança :math:`\mu` i variança :math:`\sigma^2`
        tenim:
        * :math:`E\left(\bar{X}\right) = \mu`
        * :math:`\mbox{Var}\left(\bar{X}\right) = \frac{1}{N}\sigma^2`
        * :math:`E\left(S^2\right) = \sigma^2`

    Demostració (exercici).

    * Els estadístics :math:`\bar{X}` i :math:`S^2` son **estimadors sense biaix** dels paràmetres :math:`\mu` i :math:`\sigma^2`

    * Només hem asumit moments d'ordre 2 i ja podem caracteritzar estadísticament :math:`\bar{X}` fins als moments de 2on ordre

    * Sense el factor :math:`\frac{1}{N-1}`, :math:`S^2` tindria biaix

.. slide:: Caracterització de la mitjana mitjantçant la funció generatriu de moments
   :level: 3

    En alguns casos, podem anar encara més enllà en la caracterització de la
    distribució de :math:`\bar{X}`. El primer cas que tractarem és a través
    de la funció generatriu de moments:

    .. rst-class:: note

        **Teorema 5.2.7:** Donades mostres iid :math:`\left\{X_1, \cdots, X_N\right\}` amb funció
        generatriu de moments :math:`M_X`. La f.g.m de :math:`\bar{X}` és:

    Aquest resultat ens permet caracteritzar facilment la mitja de poblacions
    amb f.g.m coneguda, per exemple:

    * normal
    * gamma

.. slide:: Caracterització de la mitjana per convolució
   :level: 3

    Quan la F.G.M no existeix o no es correspon amb una F.G.M coneguda,
    només ens queda una eina teòrica per caracteritzar :math:`\bar{X}`,
    i és la caracterització pel Jacobià d'una transformació

    .. rst-class:: note

        **Teorema 5.2.7:** Donades mostres iid :math:`\left\{X_1, \cdots, X_N\right\}` amb funció
        generatriu de moments :math:`M_X`. La f.g.m de :math:`\bar{X}` és:

    Amb aquesta aproximació podem caracteritzar :math:`\bar{X}` per una població de Cauchy


.. slide:: Caracterització dels estadístics mitjana i variança: població normal
   :level: 3

    El model de població Normal ens permet anar una mica més enllà en la caracterització d':math:`\bar{X}` i :math:`S^2`.
    En particular, no ens hem de limitar als seus moments sino que en podrem derivar la distribució.

.. slide:: Caracterització dels estadístics mitjana i variança: població normal amb mitja desconeguda
   :level: 3

    bla bla

.. slide:: Caracterització dels estadístics mitjana i variança: població normal amb mitja i variança desconeguda
   :level: 3

    bla bla


.. slide:: Distribució d'un estadístic: asimptòtics de sumes d'iid amb variança finita
   :level: 3

    Llei dels grans nombres


.. slide:: Distribució d'un estadístic: asimptòtics de sumes d'iid amb variança finita (II)
   :level: 3

    Llei dels grans nombres


.. slide:: Distribució d'un estadístic: aproximacions computacionals
   :level: 3

    Llei dels grans nombres



.. slide:: Propietats d'un estimador
   :level: 3

    Cualsevol nombre pot ser un estimador.

    Per exemple:

    * mu=170cm pot ser un estimador de l'alçada de la classe. Però no depèn de les dades.
    * un altre estimador (millor?) seria la mitja aritmètica.
    * un altre estimador seria la mediana.

    Quin és millor?


.. slide:: Propietats d'un estimador (II)
   :level: 3

    * els estimadors són també variables aleatòries
    * els podem caracteritzar a diversos nivells:
        - esperança
        - variança
        - error quadràtic mitjà
        - la seva distribució de probabilitat


.. slide:: Propietats dels estimadors de la mitja i la variança
    :level: 3
    * derivació propietats mitja


.. slide:: Propietats dels estimadors de la mitja i la variança
    :level: 3
    * derivació propietats variança
    * independència mitja i variança


.. slide:: Estadístics d'ordre
   :level: 2