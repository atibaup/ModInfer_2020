==============================
Tema 1: Repàs de probabilitat
==============================

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
* :math:`\mathcal{A} = \left\{ \left\{1\right\}, \left\{2\right\}, \cdots, \left\{1, 2\right\}, \cdots, \emptyset, \Omega \right\}`
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

**Experiment 3**: Escollir aleatòriament un estudiant d'aquesta classe i mesurar-ne la seva alçada

* :math:`\Omega = \left[0, \infty \right)`
* :math:`\mathcal{A} = ?`
* :math:`P\left(A\right) = ?`

Qüestionari de repàs
--------------------------------

1. Un espai de probabilitat és el triplet d'un ______________, un ______________ i una _____________.

2. Quina dels següents assercions **no** és un axioma de Kolmogorov:

a. Si :math:`A \cap B = \emptyset`, :math:`P\left(A \cup B \right) = P\left(A \right) + P\left( B \right)`
b. :math:`P\left(A\right) \leq 1, \forall A \in \mathcal{A}`
c. :math:`P\left(A\right) \geq 0, \forall A \in \mathcal{A}`

3. Quin és l':math:`\Omega` i l':math:`\mathcal{A}` del següent experiment: *mesurar la vida útil en dies dels ordinadors Macbook Pro.*

4. Quin és l':math:`\Omega` i l':math:`\mathcal{A}` de l'experiment: *llençar un dau fins que treiem un 6.*

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

    **Definició** Una variable aleatòria (*v.a.* pels amics) és una funció :math:`X : \Omega \to \mathcal{X} \subseteq \mathbb{R}`.

Podem doncs definir una funció de probabilitat [Casella & Berger 1.4.2]:

:math:`P_X\left(X \in A\right) = P\left(\left\{s\in \Omega: X\left(s\right) \in A \right\}\right)`

que satisfà els axiomes de Kolmogorov. Aquesta definició es pot especialitzar
quan :math:`\Omega, \mathcal{X}` són contables:

:math:`P_X\left(X \in A\right) = \sum_{s\in \Omega: X\left(s\right) \in A } P\left(s\right)`

.. rst-class:: note

    Enlloc de treballar amb :math:`P_X\left(X \in A\right)`, en general caracteritzarem les v.a. a través de les seves funcions de distribució, de massa o de densitat.

.. nextslide:: Il.lustració d'una v.a. i la seva funció de probabilitat
    :increment:

.. figure::  /_static/0_Intro/v.a.png
    :height: 300px
    :align: center

    Diagrama explicatiu de la identitat :math:`P_X\left(X \in A\right) = P\left(\left\{s\in \Omega: X\left(s\right) \in A \right\}\right)`.
    Podem caracteritzar l'esdeveniment :math:`X \in A` relatiu a una v.a. :math:`X` en funció de l'esdeveniment :math:`\left\{s\in \Omega: X\left(s\right) \in A \right\}`
    en l'espai mostral d'orígen. En aquest curs no ho tindrem en compte, però en realitat
    no totes les funcions :math:`X : \Omega \to \mathcal{X} \subseteq \mathbb{R}` són admissibles,
    només les `mesurables <https://en.wikipedia.org/wiki/Measurable_function>`_.


.. nextslide:: Variables aleatòries simplones
    :increment:

Per entendre un concepte, sempre va bé intentar reflexionar primer sobre
els casos més extremadament simples.

.. rst-class: build

* Q:*Quina seria la v.a. més simple?*
* R: La v.a. constant, definida com :math:`X : \Omega \to 0`
* Q: *I la 2a més simple?*
* R: La v.a. de Bernouilli, definida com :math:`X : \Omega \to \left\{0, 1\right\}`

Aplicant la definició anterior, tenim que la v.a. de Bernouilli està completament
caracterizada per un sol paràmetre :math:`p = P\left(\left\{s\in \Omega: X\left(s\right) = 1\right\}\right)`


.. nextslide:: Exemple de variable aleatòria discreta: binomial
    :increment:

Revisitem l'**Experiment 2** anterior (escollim 100 persones i fem una prova d'anticossos per SARS-COV-2)

* Teniem que :math:`\Omega = \left\{+, -\right\}^{100}`
* Definim v.a. :math:`X : \left\{+, -\right\}^{100} \to \mbox{Nombre de +} \in \left[0, 100\right]`

**Exercici**: Fent servir l'identitat :math:`P_X\left(X \in A\right) = \sum_{s\in \Omega: X\left(s\right) \in A } P\left(s\right)`, derivem :math:`P_X\left(X=k\right)`.

.. nextslide:: Exemple de variable aleatòria discreta: binomial (2)
    :increment:

Primer determinem el conjunt :math:`\left\{s\in \Omega: X\left(s\right) \in A\right\}` sobre el qual haurem de sumar:

.. math::

    \left\{s\in \Omega: X\left(s\right) \in A\right\} &= \left\{s\in \Omega: X\left(s\right)= k\right\}\\
    &= \mbox{Totes les seqüencies amb exactament k +}

Fixeu-vos que hi ha :math:`{n \choose k}` seqüencies amb :math:`k` "+" d'entre :math:`n=100` individus. Per altra banda,
si assumim que cada individu és + de manera independent, tenim que cada seqüència
succeeix amb probabilitat :math:`p^k\left(1-p\right)^{n-k}`.

Per tant deduïm que :math:`P_X\left(X=k\right) = {n \choose k}p^k\left(1-p\right)^{n-k}` (distribució binomial)


.. rst-class:: note

    Què passa si alguns individus són membres d'una mateixa família?


.. nextslide:: Exemple de variable aleatòria contínua
    :increment:

Revisitem l'**Experiment 3**. Escollim un estudiant d'aquesta classe i aquest cop mesurem la raó alçada/pes:

* :math:`\Omega = \left(0, \infty \right) \times \left(0, \infty \right)`
* :math:`Z: (x, y) \in \Omega \to \frac{x}{y}`
* Com calculariem :math:`P_Z\left(Z \in A\right)`? *Necessitarem de fer alguna suposició addicional sobre les v.a. X i Y*

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
* **Cas "mixte"**:  No les podrem caracteritzar amb una f.m.p o una f.d.p, però recordeu que existeixen v.a. que no són discretes ni contínues!

.. rst-class:: note

    Aquí ens desviem una mica de la notació de [Casella & Berger] al fer servir :math:`p_X` enlloc de :math:`f_X` per la f.m.p.

.. warning::

    Estem ometent molts "detalls" tècnics importants... Hi ha variables contínues per les que :math:`f_X` no existeix.

.. nextslide::
    :increment:

Tal i com hem fist per la f.d.c, tenim un resultat similar per la f.d.p o la f.m.p: :math:`f_X\left(x\right)` (:math:`p_X\left(k\right)`)
és una f.d.p (f.m.p) si i només si [Casella & Berger 1.6.5]:

a. :math:`f_X\left(x\right) \geq 0, \forall x` (:math:`p_X\left(k\right) \geq 0, \forall k`)
b. :math:`\int_{\infty}^{-\infty} f_X\left(x\right)dx = 1` (:math:`\sum_{\infty}^{\infty} p_X\left(k\right) = 1`)

Per tant podem construir una f.d.p. a partir de qualsevol funció :math:`h\left(x\right)` no-negativa, definint:

:math:`K = \int_{-\infty}^{\infty} h\left(x\right)dx` (també coneguda com *funció de partició*)

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
2. La probabilitat d'obtenir cara és :math:`p`

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
* Aquesta f.m.p és interessant per modelar problemes de *temps de vida*, per exemple: fallada d'un component electrònic, on la probabilitat de que falli **no canvia amb el temps**.

Altres v.a. discretes
-------------------------------------------

A través dels exemples, fins ara ja hem vist 4 tipus de variables aleatòries discretes:

* Uniforme, :math:`X \in \left\{0, \cdots, k-1\right\}`, :math:`P\left(X = c \right)=\frac{1}{k}`
* Bernouilli, :math:`X \in \left\{0, 1\right\}`, :math:`P\left(X = 1; p \right)=p`
* Binomial, :math:`X \in \left\{0, \cdots, n\right\}`, :math:`P\left(X = k; p, n \right)={n\choose k}p^k\left(1-p\right)^{n-k}`
* Geomètrica, :math:`X \in \left\{1, \cdots,\right\}`, :math:`P\left(X = k; p \right)= p\left(1-p\right)^{k-1}`

.. rst-class:: note

    Questió: recordeu un experiment físic que es correspongui a cada una de les v.a. anteriors?

Us recomano donar un cop d'ull pel vostre compte a dues distribucions famoses més,
la **hipergeomètrica** i la **binomial negativa**. Ara donarem una ullada a la de Poisson.

.. nextslide:: La distribució de Poisson

La distribució de Poisson es pot motivar físicament amb el següent exemple. Suposeu volem modelar # de clients que arriben en un interval T:

.. figure::  /_static/0_Intro/poisson_motivation.png
    :height: 300px
    :align: center

* els intervals de temps :math:`\delta t_i = \frac{T}{N}, N \gg 1`, aleshores :math:`B_i` és aproximadament Bernouilli(p)
* els esdeveniments :math:`B_i` són independents

.. nextslide:: La distribució de Poisson (II)

Per tant :math:`X` és aproximadament :math:`\mbox{Binomial}\left(N, p\right)` on N és el nombre d'intervals en el periòde.


La distribució de Poisson apareix quan tenim que :math:`p \to 0` i :math:`N \to \infty`
mantenint el nombre mig d'arribades per interval de temps fixe, que anomenarem :math:`\lambda = Np`.

La f.m.p de  :math:`X` és aleshores, quan :math:`n \to \infty`:

.. math::

    P\left(X = k; \lambda \right) & =\frac{n!}{k!\left(n-k\right)!}\left(\frac{\lambda}{n}\right)^k\left(1-\frac{\lambda}{n}\right)^{n-k} \\
                         & =\frac{\lambda^k}{k!}\frac{n!}{\left(n-k\right)!}\frac{1}{n^k}\left(1 - \frac{\lambda}{n}\right)^n\left(1-\frac{\lambda}{n}\right)^{-k} \\
                         & \to \frac{\lambda^k}{k!}e^{-\lambda}

*Exercici*: Justificar l'últim pas!


Incís sobre les v.a. contínues
-------------------------------------------

Hem vist que una variable aleatòria contínua es caracteritza per una funció
de densitat de probabilitat :math:`f_X` tal que:

:math:`F_X\left(x\right) = \int_{-\infty}^x f_X\left(t\right)dt`

per tant tenim que

:math:`P\left(a < X \leq b\right) = \int_{a}^b f_X\left(t\right)dt`

Una conseqüència d'aquesta definició quan :math:`b \to a` és el que pot semblar paradoxal:

:math:`P\left(X = x\right) = 0`

Pel 3er axioma de Kolmogorov això sembla implicar que
:math:`P\left(a < X < b\right)`, sent la unió de tots els punts entre a i b, hauria
de ser també 0. La paradoxa es resol si recordem que el 3er axioma només contempla unions contables!

La distribució uniforme
-------------------------------------------

La f.d.p més simple es correspon amb la variable aleatòria contínua més simple, escollir
un nombre aleatori dins d'un interval :math:`\left[a, b\right]`:

:math:`f_X\left(x; a, b\right) = \left\{\begin{array}{cc} \frac{1}{b-a} & a \leq x \leq b \\ 0 & \mbox{altrament} \end{array}\right.`

**Exercicis**:

* Calculem la f.d.c d'una variable uniforme.
* Doneu un exemple d'un experiment on l'uniforme és un bon model?
* Com generarieu una variable uniforme amb un ordinador

La família Gamma
-------------------------------------------

Recordeu que podem definir una f.d.p tot normalitzant qualsevol funció no-negativa.

Considerem la següent família de funcions, parameteritzades per :math:`\alpha, \beta` doncs:

:math:`h\left(t\right) = \frac{t^{\alpha-1}}{\beta^{\alpha}} e^{-\frac{t}{\beta}}`

definides per :math:`t\in \left[0, \infty\right)`. Es pot demostrar que per :math:`\alpha, \beta > 0`,

:math:`\Gamma\left(\alpha\right)=\int_{0}^{\infty}h\left(t\right)dt` existeix.

Per tant definim la família distribucions :math:`\mbox{gamma}\left(\alpha, \beta\right)` com:

:math:`f_X\left(x;\alpha, \beta\right) = \frac{1}{\Gamma\left(\alpha\right)}\frac{x^{\alpha-1}}{\beta^{\alpha}} e^{-\frac{x}{\beta}}`

.. nextslide:: Cosines germanes de la Gamma

La família Gamma és important perquè permet modelar una gran varietat d'experiments i està intimament
relacionada amb altres distribucions:

* Distribució exponencial (si fixem :math:`\alpha=1`): la cosina contínua de la f.m.p geomètrica que hem vist abans
* Distribució de :math:`\chi^2_p` (si fixem :math:`\alpha=p/2` i :math:`\beta=2`)

La f.d.p de la Gamma per diversos valors de :math:`\alpha` (k a l'imatge) i :math:`\beta` (:math:`\theta` a la figura) `[Font] <https://en.wikipedia.org/wiki/Gamma_distribution>`_

.. figure::  /_static/0_Intro/650px-Gamma_distribution_pdf.svg.png
    :height: 250px
    :align: center


La família "Normal"
-------------------------------------------

.. figure::  /_static/0_Intro/440px-Normal_Distribution_PDF.svg.png
    :height: 150
    :align: center

:math:`f_X\left(x ; \mu, \sigma\right) = \frac{1}{\sqrt{2\pi}} e^{-\frac{\left(x - \mu\right)^2}{\sigma^2}}`

La distribució Normal o Gaussiana és fonamental en estadística, per múltiples raons:

* Apareix "naturalment" quan sumem/calculem el promig d'un gran nombre de mostres
* És simètrica i parameteritzada per 2 paràmetres intuitius (:math:`\mu` i :math:`\sigma`)
* Malgrat la seva aparença intimidant, és tractable analíticament

I què te a veure tot això amb l'estadística?
--------------------------------------------

.. note::

    Com vem comentar a l'introducció al curs, l'inferència estadística és la ciència d'establir propietats
    d'una població mitjantçant mostres de la mateixa.

    Els models probabilístics com els que hem vist darrerament són una de les eines que farem servir
    per fer aquesta feina d'inferència.


Vegem un exemple pràctic, el de l'**Experiment 2** (proves d'anticossos).

.. rst-class:: build

1. Com hem dit, l'estadística comença amb la **recollida de mostres** (dades), en aquest cas, realizar tests d'anticossos a 100 persones a l'atzar i anotar-ne el resultat

2. El segon pas en **estadística paramètrica** és la definició d'un model probabilístic que caracteritzi les observacions. Com hem vist abans, un model raonable és que cada una de les 100 mostres és una v.a. de Bernouilli.

3. Ara tenim una col.lecció de mostres, :math:`\left\{x_1, \cdots, x_{100}\right\}`, on cada :math:`x_i\in \left\{0, 1\right\}`, i un model: :math:`P_X\left(X_i=1\right) = p`. L'únic que ens falta per poder fer inferència és trobar el valor de :math:`p` que millor descriu les observacions (Tema 2). Per exemple un estimador raonable seria la mitjana aritmètica :math:`\hat{p}=\frac{1}{100}\sum_i x_i= \frac{\mbox{# de +}}{100}`. Posem que :math:`\hat{p}=0.1`.

.. nextslide::

Amb aquest estimador, obtingut **només a partir de 100 mostres**, i gràcies als resultats que
veurem en els Temes 1 i 2, ja podríem deduïr propietats de la població en general:

* Veurem que :math:`\hat{p}` és un estimador "sense biaix" de :math:`p`
* Però també veurem que la variabilitat (ex: variança) de :math:`\hat{p}` decreix amb el nombre de mostres, i potser 100 són massa poques...
* També veurem com, a partir de :math:`\hat{p}`, podem donar un interval de confiança sobre :math:`p`...

.. rst-class:: note

    Però per tot això primer hem d'aprofundir més en alguns altres conceptes de probabilitat: les transformacions
    de v.a., l'esperança, les distribucions conjuntes i algunes desigüaltats.


Funcions de variables aleatòries
==========================================

Transformacions afins
-------------------------------------------

Sovint ens trobarem que el nostre experiment es pot modelar més fàcilment
com la transformació d'una v.a. :math:`X: \Omega \to \mathcal{X}` mitjantçant una funció
:math:`g: \mathcal{X}\to\mathcal{Y}`: :math:`Y=g\left(X\right)`

.. note::

    Recordem que :math:`\mathcal{X}` i :math:`\mathcal{Y}` denoten l'espai mostral d':math:`X`
    i :math:`Y`, respectivament.

Per exemple, una transformació senzilla és l'afí: :math:`Y = a + b X`

En aquest cas, podem expressar la f.d.c :math:`F_Y` en funció de :math:`F_X`:

.. math::

    F_Y\left(y\right) &= P\left( a + b X \leq y \right) \\
                      &= P\left( X \leq \frac{y - a}{b} \right) \\
                      &= F_X\left(\frac{y - a}{b} \right)

.. rst-class:: note

    Exercici: Fent servir aquesta identitat, demostreu que si :math:`X \sim \mathcal{N}\left(\mu, \sigma\right)`, :math:`Y = \frac{X - \mu}{\sigma} \sim \mathcal{N}\left(0, 1\right)`


Cas genèric
-------------------------------------------

Per una funció genèrica, :math:`g: \mathcal{X}\to\mathcal{Y}`,
no serà tan senzill caracteritzar la f.d.c de :math:`Y` en funció de la d':math:`X`.

Sota unes condicions tècniques relativament generals, podrem definir una funció de
probabilitat el conjunt d'esdeveniments associat a l'espai mostral :math:`\mathcal{Y}` com segueix:

.. math::

    P\left(Y \in A\right) & = P\left(\left\{x \in \mathcal{X}: g\left(x\right) \in A \right\}\right) \\
                          & = P\left(X \in g^{-1}\left(A\right)\right)

on definim el mapa invers :math:`g^{-1}\left(A\right) = \left\{ x\in \mathcal{X}: g(x) \in A\right\}` [Casella & Berger 2.1.1]

.. nextslide:: Il.lustració de l'identitat anterior

Vegem la relació entre els tres espais mostrals mitjantçant un diagrama:

.. figure::  /_static/0_Intro/transformation.png
    :height: 280px
    :align: center

    :math:`P\left(Y \in A\right) = P\left(X \in g^{-1}\left(A\right)\right) = P\left(\left\{ s \in \Omega: X(s) \in g^{-1}\left(A\right) \right\}\right)`

.. rst-class:: note

    Sortosament, normalment no haurem de raonar directament sobre :math:`\Omega`, ja que en molts casos
    podrem caracteritzar :math:`Y` en base a la f.d.c d':math:`X`.


F.d.c i transformacions monòtones
-------------------------------------------

En general, la f.d.c. d':math:`Y` vé donada per l'expressió [Casella & Berger 2.1.4]:

.. math::

    F_Y\left(y\right) &= P\left( g\left(X\right) \leq y \right) \\
                      & = P_X\left(\left\{x \in \mathcal{X}: g\left(x\right) \leq y \right\}\right)


En el cas que la funció :math:`g: \mathcal{X}\to\mathcal{Y}` sigui monòtona stricta (creixent o decreixent),
tindrem que és injectiva i surjectiva, i per tant podem definir :math:`g^{-1}: \mathcal{Y}\to\mathcal{X}`
associant un únic x a cada y. Per exemple, en el cas monòton creixent:

.. math::

    \left\{x \in \mathcal{X}: g\left(x\right) \leq y \right\} & =  \left\{x \in \mathcal{X}: x \leq g^{-1}\left(y\right) \right\} \\

Per tant podem simplicar l'expressió [Casella & Berger 2.1.3]: :math:`F_Y\left(y\right) =F_x\left(g^{-1}\left(y\right)\right)`


Transformacions monòtones i diferenciables
-------------------------------------------

Si a més de centrar-nos en transformacions monòtones,
ens restringim a v.a's contínues i a transformacions diferenciables, tenim que:

.. math::

    F_Y\left(y\right) &= F_x\left(g^{-1}\left(y\right)\right) \\

són diferenciables, i aplicant la regla de la cadena arribem al famós resultat de la "transformació per Jacobià" [Casella & Berger 2.1.5]:

.. math::

    f_Y\left(y\right) &= f_x\left(g^{-1}\left(y\right)\right)\left|\frac{d g^{-1}\left(y\right)}{dy} \right| \\

expressió vàlida per :math:`y \in \mathcal{Y} = \left\{y : \exists x\in \mathcal{X},  g(x)=y \right\}`
on :math:`\mathcal{X} = \left\{x : f_X\left(x\right) > 0 \right\}`.

.. rst-class:: note

    Veure [Casella & Berger 2.1.8] per una extensió on la funció :math:`g` és monòtona només sobre alguns intervals!


.. nextslide:: Aplicació: derivació de la distribució de :math:`\chi^2_1`

Veiem aquí un exemple de com el resultat anterior es pot extendre a transformacions
no monòtones interessants en estadística. Considerarem la distribució de la transformació (contínua i diferenciable)

:math:`Y = X^2`

quan :math:`X \sim \mathcal{N}\left(0, 1\right)`. Observem que:

.. math::

    F_Y\left(y\right) &= P_X\left(-\sqrt{y} \leq X \leq \sqrt{y}\right) \\
                      &= P_X\left(X \leq \sqrt{y}\right) - P_X\left(X \leq -\sqrt{y}\right) \\
                      &= F_X\left(\sqrt{y}\right) - F_X\left(-\sqrt{y}\right)

Diferenciant i fent servir la simetria de :math:`F_X\left(x\right)` respecte 0, obtenim:

:math:`f_y\left(y\right) = y^{-\frac{1}{2}} F_X\left(\sqrt{y}\right) = \frac{y^{-\frac{1}{2}}}{\sqrt{2\pi}} e^{-\frac{y}{2}}`,
que podem identificar amb la Gamma si fixem :math:`\alpha=1/2` i :math:`\beta=2`, que és
la :math:`\chi^2_1`.

Transformació integral
-------------------------------------------

L'última transformació que veurem


Esperança i moments
==========================================


Esperança
-------------

L'esperança d'una v.a. :math:`g\left(X\right)` es defineix com:

* Cas continu: :math:`E\left(g\left(X\right)\right) = \int_{-\infty}^{\infty} g\left(x\right)f_X\left(x\right)dx`
* Cas discret: :math:`E\left(g\left(X\right)\right) = \sum_{k} g\left(k\right)p_X\left(k\right)`


Esperança
-------------



