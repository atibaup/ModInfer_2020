=================================================
Tema 2: Introducció a l'inferència estadística
=================================================

Mostreig
=================================================

El perquè de tot plegat
-----------------------

En aquesta Tema 2 desenvoluparem la teoria necessària per respondre a les següents preguntes:

* Com podem caracteritzar estadísticament una *població* o un *experiment aleatori* a partir d'una *mostra* finita?

* Com de fiables són aquestes caracteritzacions?

.. figure::  /_static/0_Intro/mostreig.png
    :height: 400px
    :align: center

Exemple: estimació preu mig de venta immobiliària de Barcelona
----------------------------------------------------------------

Som inversors immobiliaris a Barcelona i volem tenir una estimació del preu mig de
venta dels habitatges sense esperar a que l’ajuntament publiqui les dades de les
compra-ventes registrades en l’últim exercici.

Tenim:

* :math:`\mu`: preu mig (*paràmetre*) calculat sobre totes les ventes (*població*)
* :math:`\bar{x}`: preu mig calculat sobre una *mostra* aleatòria de :math:`n=30` mostres (*estadístic*)

A l'`exemple complet (Campus Virtual) <https://e-aules.uab.cat/2020-21/mod/resource/view.php?id=156704>`_
hem vist que podem utilitzar :math:`\bar{x}` per estimar :math:`\mu`, amb un error de < 11%.

Població estadística
--------------------

Quan parlem de *població* ens podem referir a:

* Un conjunt *finit* i *"petit"* d'elements dels quals mesurem una quantitat real. *Exemple*: les alçades de les persones d'aquesta classe.

* Un conjunt *finit* però *"gran"* d'elements dels quals mesurem una quantitat real. *Exemple*: les mesures dels sèpals i pètals de les diferents espècies d'*Iris*

* Una *abstracció* representant el fet de mesurar una o diverses variables aleatòries caracteritzades per una funció de distribució de probabilitat. *Exemple*: obtenir 4 asos al repartir 4 cartes d'una baralla de 52 cartes

.. rst-class:: note

    A efectes pràctics, l'únic que ens interessa és si l'acte de mostrejar impacta la distribució de la mostra o no


Mostreig
--------------------

El mostreig és l'acció de sel.leccionar i mesurar un **subconjunt de la població**.

El mostreig més simple és l'aleatori: escollim un membre de la població a l'atzar, i en mesurem l'atribut.

En **poblacions infinites** (o finites però suficientment grans), l'acte de mostrejar no afecta la distribució de les següents mostres.

En **poblacions finites**, un mostreig aleatori *sense remplaçament* sí que impacta la distribució de les mostres
subsegüents (vegeu exemple a continuació)

Mostra *iid*: Definició
----------------------------------------

En la resta del curs, ens centrarem en **mostres aleatòries de poblacions infinites**. És una prou bona aproximació
en la majoria de casos pràctics (exercici)

.. rst-class:: note

    **Definició**: Les variables aleatòries :math:`\left\{X_0, \cdots, X_{n-1}\right\}` són una mostra aleatòria d'una població
    caracteritzada per una *fdp* :math:`f_X(x)`, si :math:`\left\{X_0, \cdots, X_{n-1}\right\}` són **mutualment independents** i :math:`X_i \sim f_X(x)`.

Alternativament :math:`\left\{X_0, \cdots, X_{n-1}\right\}` s'anomenen **independents i idènticament distribuïdes** (abreviat **iid**)

.. nextslide:: Exemple de mostra *iid*: Aplicació d'inferència
    :increment:

[Kendall Exemple: 5.1.2] Volem caracteritzar la vida útil (en anys) :math:`X_i` d':math:`n` circuits electrònics. Si
:math:`X_i \sim \mathbf{exponential}\left(\beta\right)`, quina és la probabilitat que tots els circuits mesurats durin més de 2 anys?

Els esdeveniments :math:`\left\{X_1 \leq x_1, \cdots, X_{N} \leq x_{N}\right\}` són mutualment independents (el fet de mesurar un subconjunt de circuits no té cap impacte en la mesura dels altres)

Per independència, la *fdp* conjunta de :math:`\left\{X_1, \cdots, X_{N}\right\}` és :math:`f\left(x_1, \cdots, x_{N}\right) = \Pi_{i=1}^{N}f\left(x_i\right) = \frac{1}{\beta^n} e^{\frac{-\sum_i x_i}{\beta}}`

.. math::

    P\left(X_1 \geq 2, \cdots, X_N \geq 2\right) &= \int_{2}^{\infty}\cdots\int_{2}^{\infty}\frac{1}{\beta^n}e^{\frac{-\sum_i x_i}{\beta}} dx_1\cdots dx_N \\
                                                 &= e^{-\frac{2n}{\beta}}

.. nextslide:: Exemple de mostra **no-iid**: Població finita
    :increment:

Tenim una població de n=30 persones, representades per la seva alçada: :math:`\left\{x_1, \cdots, x_n\right\}, x_i\in \left(0, \infty\right)`

:math:`X_i`: alçada de la :math:`i`-ena persona. Si :math:`x_i\neq x_j, \forall i\neq j`, tenim:

.. math::

    P\left(X_1 = x_k\right)             &= \frac{1}{n} \\
    P\left(X_2 = x_l | X_1 = x_k\right) &= \left\{\begin{array}{cc} 0 & l=k \\ \frac{1}{n-1} &l\neq k \end{array}\right.

.. rst-class:: note

    :math:`P\left(X_2 | X_1 = x_k\right) \neq P\left(X_2\right) \neq P\left(X_1\right) \Rightarrow` Les mostres :math:`X_1, X_2` no són ni independents, ni idènticament distribuïdes

**Exercicis**:
- Què passa si mostregem cada persona *amb remplaçament*?
- Què passa si els :math:`x_i` no són únics?


Exemple de mostra **no-iid**: Diferents biaixos de sel.lecció
--------------------------------------------------------------





Estadístics i estimadors
=================================================

Estadístics: mitja i variança
-------------------------------

Si ens donen un conjunt de dades i volem descriure'l abreviadament, el més comú es calcular-ne:

* La mitja: :math:`\bar{X} = \frac{1}{N}\sum_{i=1}^N X_i`

* La variança: :math:`S^2_X = \frac{1}{N-1}\sum_{i=1}^N \left(X_i -  \bar{X}\right)^2`

Amb aquestes dues quantitats ja podem fer inferència:

* Podem predir el valor d'una nova observació
* Podem estimar com de rara és una nova observació

La mitja i la variança són dos exemples d'un **estadístic**.


Estadístics: definició
-------------------------------

.. rst-class:: note

    **Definició:** Donada una mostra iid :math:`\left\{X_1, \cdots, X_N\right\}` d'un espai mostral :math:`\Omega`,
    un estadístic és una funció :math:`T: \Omega^N \rightarrow \mathbb{R}^p`, amb :math:`p \geq 1`.

*Exemples*:

* La mitja i la variança d'una mostra reals són estadístics amb :math:`p=1`.
* La matriu de covariança d'una mostra multivariades de dimensió :math:`d` és un estadístic amb :math:`p=d(d-1)/2`

Com que :math:`T` és una funció de variables o vectors aleatòries, :math:`T` és també una variable o vector aleatori

**Exercici**: Altres exemples d'estadístics?

.. nextslide:: Altres exemples d'estadístics
    :increment:

**Per una sola mostra :math:`\left\{X_1, \cdots, X_N\right\}`**:

* *Mediana*: el valor tal que 50% dels elements de la mostra són més petits
* *Percentil* :math:`p`: el valor tal que :math:`p`% dels elements de la mostra són més petits
* *Max/min (extrems)*: el màxim i mínim de la mostra
* *Histograma*

**Per dues mostres :math:`\left\{X_1, \cdots, X_N\right\}`**:

* *Coeficient de correlació*:  :math:`\frac{\sum_{i}X_i Y_i}{\sqrt{S^2_X S^2_Y}}`
* *Risc relatiu*: :math:`\frac{\bar{X}}{\bar{Y}}` (per mostres de Bernouilli)

Estimadors i paràmetres: Exemple en població **finita**
--------------------------------------------------------------

Tornem a un exemple similar al que vem veure a la `primera classe del Tema 2 (Campus Virtual) <https://e-aules.uab.cat/2020-21/mod/resource/view.php?id=156704>`_.

Tenim una **població** de :math:`n=47 \times 10^6` persones, representades per la seva alçada:
:math:`\left\{x_1, \cdots, x_n\right\}, x_i\in \left(0, \infty\right)`

Definim dos **paràmetres** que caracteritzen la població, per exemple:

* L'alçada mitja: :math:`\mu = \frac{1}{n}\sum_{i=1}^n x_i`
* La desviació estàndar de l'alçada: :math:`\sigma = \sqrt{ \frac{1}{n}\sum_{i=1}^n (x_i - \mu)^2}`

Aquestes dues són quantitats **deterministes**, però calcular-les requereix mesurar l'alçada de 47M de persones.
(Això sense tenir en compte que l'alçada de les persones canvia en el temps...)

.. nextslide::
    :increment:

Com hem vist a la primera classe, enlloc de fer passar 47M de persones
pels Centres d'Atenció Primària, podem construïr **estimadors** d'aquests **paràmetres**,
a partir d'una mostra finita amb N=1000, per exemple:

:math:`\hat{\mu} = \bar{X}`

:math:`\hat{\sigma} = \sqrt{S^2_X}`

Noteu que :math:`X_i` representen la v.a. corresponent a mostrejar la població
:math:`\left\{x_i\right\}` (**amb remplaçament**) i per tant són una mostra **iid**.

Questions d'inferència:

* Com de bé aproximen :math:`\hat{\mu}` a :math:`\mu` i :math:`\hat{\sigma}` a :math:`\sigma`?
* :math:`\hat{\mu}`, :math:`\hat{\sigma}` són v.a.'s... quina distribució tenen?


.. nextslide:: Estimadors i paràmetres: Exemple en població **infinita**

En el cas d'una població infinita, normalment **assumim** que la mateixa
està caracteritzada per una distribució de probabilitat parameteritzada per
una sèrie de paràmetres (a vegades als paràmetres genèrics s'els denota per
un vector :math:`\mathbf{\theta}`)

Exemples:

* La vida útil d'un circuit estava carateritzada per una **població exponencial** amb paràmetre :math:`\beta`

* Una mostra iid d'una **població normal** està caracteritzada per la mitja (:math:`\mu`) i la variança (:math:`\sigma^2`). Direm que :math:`\mathbf{\theta}=\left[\mu, \sigma^2 \right]`

* El nombre de cares al llençar una moneda N vegades és una mostra d'una **població binomial** amb paràmetre :math:`p`


(Breu parèntesis: Estimadors i estadístics)
--------------------------------------------------

* En general tots els **estimadors** són **estadístics**
* Quan parlem d'estimadors, ens referim a un **paràmetre de la població**
* Fins ara em vist estimadors que són identitats d'estadístics (mitja, variança)
* Més endavant veurem com construïr estimadors que són funcions més complexes de les dades

Ara ens interessarem en la caracterització probabilística dels estadístics que hem vist fins ara.

Qüestionari de recapitulació
------------------------------

1. Donada una mostra :math:`\left\{x_1, \cdots, x_N\right\}`, és :math:`T = \max_i x_i - \min_i x_i` un estadístic?
2. Quina és la població corresponent a l'experiment de sel.leccionar 4 cartes de pòker d´una baralla de 48?
3. Quan es fa una enquesta d'intenció de vot, quin tipus de població i mostra tenim?
4. Quan es fa una enquesta d'intenció de vot, perquè no és vàlid agafar una mostra només d'una zona geogràfica determinada?


Caracterització probabilística d'estadístics
=============================================

Caracterització d'un estadístic
-------------------------------

La definició genèrica d´un estadístic (funció de variables aleatòries i.i.d)
no ens aporta masses pistes sobre com caracteritzar-lo probabilísticament

Haurem de fer doncs asssumpcions addicionals:

* **tipus de funció** (ex: mitja, variança, funció contínua i diferenciable)
* **distribució de la mostra** (ex: mostra normals)
* **comportament asimptòtic** (quan la talla de la mostra tendeix a l'infinit)

o bé utilitzar eines computacionals (bootstrap, simulació) que veureu amb més detall en un altre curs.

Comencem doncs pels casos més senzills: la mitjana aritmètica i la variança


Caracterització dels estadístics mitjana i variança
------------------------------------------------------------

Comencem per un resultat auxiliar important:

.. rst-class:: note

    **Lemma 5.2.5:** Donada una mostra iid :math:`\left\{X_1, \cdots, X_N\right\}` amb esperança finita, i una funció
    arbitrària :math:`g` tenim que:

    * :math:`E\left(\sum_{i=1}^N g\left(X_i\right)\right) = N E\left(g\left(X\right)\right)`
    * :math:`\mbox{Var}\left(\sum_{i=1}^N g\left(X_i\right)\right) = N \mbox{Var}\left(g\left(X\right)\right)`

Demostració (exercici). Recordeu:

* Linearitat de l'esperança
* Covariança de v.a. independents

.. nextslide::
    :increment:

Com a corolari del darrer Lemma, tenim:

.. rst-class:: note

    **Teorema 5.2.6:** Donada una mostra iid :math:`\left\{X_1, \cdots, X_N\right\}` amb esperança :math:`\mu` i variança :math:`\sigma^2`
    tenim:

    * :math:`E\left(\bar{X}\right) = \mu`
    * :math:`\mbox{Var}\left(\bar{X}\right) = \frac{1}{N}\sigma^2`
    * :math:`E\left(S^2_X\right) = \sigma^2`

Demostració (exercici).

.. nextslide::
    :increment:

Observacions:

1. Els estadístics :math:`\bar{X}` i :math:`S^2` son **estimadors sense biaix** de :math:`\mu` i :math:`\sigma^2`

2. Només hem assumit l'existència de moments d'ordre 2!

3. Sense el factor :math:`\frac{1}{N-1}`, :math:`S^2` tindria biaix


.. nextslide::
    :increment:

Només amb aquest resultat, podem aplicar la desigualtat de Txebixev:

.. math::

    P\left(\frac{\left(\bar{X} - \mu\right)^2}{\sigma^2} \geq r \right) & \leq \frac{E \left(\frac{\left(\bar{X} - \mu\right)^2}{\sigma^2} \right)}{r} \\
                                                                        & =  \frac{\mbox{Var}\left(\bar{X}\right)}{\sigma^2 r} \\
                                                                        & = \frac{1}{ N r}

Per tant :math:`\lim_{N \to \infty} P\left(\left|\bar{X} - \mu\right| \geq r \right) = 0` (convergència en probabilitat)

.. rst-class:: note

    Acabem de demostrar la **Llei Feble dels Grans Nombres**: :math:`\bar{X}` convergeix a :math:`\mu` quan :math:`N` tendeix a infinit.


Caracterització de :math:`\bar{X}` mitjantçant la funció generatriu de moments
-----------------------------------------------------------------------------

En alguns casos, podem anar encara més enllà en la caracterització de la
distribució de :math:`\bar{X}`. El primer cas que tractarem és a través
de la funció generatriu de moments:

.. rst-class:: note

    **Teorema 5.2.7:** Donada una mostra iid :math:`\left\{X_1, \cdots, X_N\right\}` amb funció
    generatriu de moments :math:`M_X(t)`. La f.g.m de :math:`\bar{X}` és: :math:`M_{\bar{X}} = \left(M_{X}(\frac{t}{n})\right)^n`

*Demostració*: Aplicació directa de la propietat que hem vist al Tema 1 per l'esperança del producte de v.a.'s independents.

Aquest resultat ens permet caracteritzar facilment la mitja de poblacions
amb f.g.m coneguda, per exemple:

* normal
* gamma

.. nextslide::
    :increment:

Apliquem-ho a calcular la f.d.p. d':math:`\bar{X}` per una mostra iid Gaussiana.

La f.g.m d'una Gaussiana :math:`\mathcal{N}(\mu, \sigma^2)` és :math:`M_X(t) = e^{\mu t + \frac{\sigma^2t^2}{2}}`

Per aplicació directa del resultat anterior, tenim que en aquest cas:

:math:`M_{\bar{X}} = M_{X}(\frac{t}{n})^n = e^{\mu t + \frac{\sigma^2t^2}{2n}}`

que podem identificar amb la f.g.m d'una Gaussiana :math:`\mathcal{N}(\mu, \frac{\sigma^2}{n})`.

Per tant :math:`\bar{X} \sim \mathcal{N}(\mu, \frac{\sigma^2}{n})`

Caracterització de :math:`\bar{X}` a través de la convolució
------------------------------------------------------------

Quan la f.g.m no existeix o no es correspon amb la f.g.m d'una distribució coneguda,
només ens queda una eina teòrica per caracteritzar :math:`\bar{X}`,
i és la caracterització pel Jacobià d'una transformació, que citarem però no demostrarem:

.. rst-class:: note

    **Teorema 5.2.9:** Si X, Y són v.a.'s independents amb f.d.p :math:`f_X` i :math:`f_Y`, respectivament,
    aleshores la f.d.p de :math:`Z = X + Y` ve donada per :math:`f_Z(x) = (f_X \ast f_Y)(x)`

**Esboç demostració**: Definir la transformació :math:`(X, Y) \to (X, Z + Y)`, calcular-ne el Jacobià i
aplicar la fórmula 4.3.2 de Casela & Berger.

**Exemple d'aplicació**: Caracteritzar :math:`\bar{X}` per una població de Cauchy, [Casella & Berger 5.2.10].

Mostra iid d'una població Normal
------------------------------------------------------------

Acabem de veure que per una mostra iid d'una població :math:`\mathcal{N}(\mu, \sigma^2)`,
:math:`\bar{X} \sim \mathcal{N}(\mu, \frac{\sigma^2}{n})`. De fet, podem anar una mica més lluny
i caracteritzar també la distribució de :math:`S_X^2`:

.. rst-class:: note

    **Teorema 5.3.1:** per una mostra iid d'una població :math:`\mathcal{N}(\mu, \sigma^2)`, tenim:

    a. :math:`\bar{X} \sim \mathcal{N}(\mu, \frac{\sigma^2}{n})`
    b. :math:`\bar{X}` i  :math:`S_X^2` són independents
    c. :math:`\frac{n-1}{\sigma^2}S_X^2 \sim \chi^2_{n-1}`

**Esboç demostració**: El punt (a) ja l'hem vist. Els (b), (c), a la "pisarra".

.. nextslide::
    :increment:

    Observacions:

    1. La variança de :math:`\bar{X}` és inversament proporcional al tamany de la mostra, com ja haviem vist en el Teorema 5.2.6 pel cas genèric
    2. Per calcular :math:`S_X^2` es fa servir :math:`\bar{X}`... com pot ser que siguin v.a.'s independents!
    3. Fixeu-vos que l'aplicació pràctica tal qual és limitada: només podem caracteritzar la distribució de :math:`\bar{X}`, :math:`S_X^2` si coneixem els paràmetres  :math:`\mu, \sigma^2`... que és el que volem estimar!

Distribució de :math:`\bar{X}` per mostres grans: Teorema del Límit Central
---------------------------------------------------------------------------


