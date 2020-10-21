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
* :math:`\bar{x}`: preu mig calculat sobre una *mostra* aleatòria de :math:`N=30` mostres (*estadístic*)

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

    **Definició**: Les variables aleatòries :math:`\left\{X_1, \cdots, X_N\right\}` són una mostra aleatòria d'una població
    caracteritzada per una *fdp* :math:`f_X(x)`, si :math:`\left\{X_1, \cdots, X_N\right\}` són **mutualment independents** i :math:`X_i \sim f_X(x)`.

Alternativament :math:`\left\{X_1, \cdots, X_N\right\}` s'anomenen **independents i idènticament distribuïdes** (abreviat **iid**)

Una mostra *iid* és més fàcil de modelar probabilísticament, ja que la f.d.p. (o la f.m.p.) conjunta:

:math:`f_{X_1, \cdots, X_{N}}(x_1, \cdots, x_N) = \Pi_{i=1}^N f_X(x_i)`

.. nextslide:: Exemple de mostra *iid*: Aplicació d'inferència
    :increment:

[Casella & Berger Exemple: 5.1.2] Volem caracteritzar la vida útil (en anys) :math:`X_i` d':math:`n` circuits electrònics. Si
:math:`X_i \sim \mathbf{exponential}\left(\beta\right)`, quina és la probabilitat que tots els circuits mesurats durin més de 2 anys?

Els esdeveniments :math:`\left\{X_1 \leq x_1, \cdots, X_{N} \leq x_{N}\right\}` són mutualment independents (el fet de mesurar un subconjunt de circuits no té cap impacte en la mesura dels altres)

Per la propietat *iid*, la *fdp* conjunta de :math:`\left\{X_1, \cdots, X_{N}\right\}` és :math:`f\left(x_1, \cdots, x_{N}\right) = \Pi_{i=1}^{N}f\left(x_i\right) = \frac{1}{\beta^n} e^{\frac{-\sum_i x_i}{\beta}}`

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

* La mitjana: :math:`\bar{X} = \frac{1}{N}\sum_{i=1}^N X_i`

* La variança mostral o variança empírica: :math:`S^2_X = \frac{1}{N-1}\sum_{i=1}^N \left(X_i -  \bar{X}\right)^2`

Amb aquestes dues quantitats ja podem fer inferència:

* Podem utilitzar :math:`\bar{X}` com a predictor d'una nova observació
* Podem utilitzar :math:`\bar{X} \pm 2 \sqrt{S^2_X}` per evaluar com de rara és una nova observació

La mitja i la variança són dos exemples d'un **estadístic**.


Estadístics: definició
-------------------------------

.. rst-class:: note

    **Definició:** Donada una mostra iid :math:`\left\{X_1, \cdots, X_N\right\}` d'un espai mostral :math:`\Omega`,
    un estadístic és una funció :math:`T: \Omega^N \rightarrow \mathbb{R}^p`, amb :math:`p \geq 1`.

*Exemples*:

* La mitja i la variança d'una mostra reals són estadístics amb :math:`p=1`.
* La matriu de covariança :math:`\mathbf{S}` d'una mostra multivariada de dimensió :math:`d` és un estadístic amb :math:`p=d + d(d-1)/2` (graus de llibertat d'una matriu simètrica):

:math:`\mathbf{S} = \frac{1}{N-1} \sum_{i=1}^N (\mathbf{X}_i - \bar{\mathbf{X}})(\mathbf{X}_i - \bar{\mathbf{X}})^T`

Com que un estadístic :math:`T` és una funció de variables o vectors aleatòries,
:math:`T` és també una variable o vector aleatori

**Exercici**: Altres exemples d'estadístics?

.. nextslide:: Altres exemples d'estadístics
    :increment:

**Per una sola mostra** :math:`\left\{X_1, \cdots, X_N\right\}`:

* *Mediana*: el valor tal que 50% dels elements de la mostra són més petits
* *Percentil* :math:`p`: el valor tal que :math:`p` %% dels elements de la mostra són més petits
* *Max/min (extrems)*: el màxim i mínim de la mostra
* *Histograma*

**Per dues mostres** :math:`\left\{X_1, \cdots, X_N\right\}`, :math:`\left\{Y_1, \cdots, Y_N\right\}`:

* *Coeficient de correlació*:  :math:`R = \frac{\sum_{i}X_i Y_i}{\sqrt{S^2_X S^2_Y}}`
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

* El nombre de cares al llençar una moneda N vegades és una mostra d'una **població binomial** amb paràmetres :math:`p, N`


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
* **comportament asimptòtic** (quan el tamany de la mostra tendeix a l'infinit)

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

Demostració (feta a la "pissarra"). Recordeu:

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

Demostració (exercici). Aplicació quasi directa del Lemma anterior. Per calcular
:math:`E\left(S^2_X\right)` convé fer servir la identitat :math:`S^2_X = \frac{1}{N -1}(\sum X_i^2 - \bar{X}^2)`

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
    generatriu de moments :math:`M_X(t)`. La f.g.m de :math:`\bar{X}` és: :math:`M_{\bar{X}} = \left(M_{X}(\frac{t}{N})\right)^N`

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

:math:`M_{\bar{X}} = M_{X}(\frac{t}{N})^N = e^{\mu t + \frac{\sigma^2t^2}{2N}}`

que podem identificar amb la f.g.m d'una Gaussiana :math:`\mathcal{N}(\mu, \frac{\sigma^2}{N})`.

Per tant :math:`\bar{X} \sim \mathcal{N}(\mu, \frac{\sigma^2}{N})`

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
:math:`\bar{X} \sim \mathcal{N}(\mu, \frac{\sigma^2}{N})`. De fet, podem anar una mica més lluny
i caracteritzar també la distribució de :math:`S_X^2`:

.. rst-class:: note

    **[Casella & Berger 5.3.1]** per una mostra iid d'una població :math:`\mathcal{N}(\mu, \sigma^2)`, tenim:

    a. :math:`\bar{X} \sim \mathcal{N}(\mu, \frac{\sigma^2}{N})`
    b. :math:`\bar{X}` i  :math:`S_X^2` són independents
    c. :math:`\frac{N-1}{\sigma^2}S_X^2 \sim \chi^2_{N-1}`

**Esboç demostració**: El punt (a) ja l'hem vist. Els (b), (c), a la "pisarra".

.. nextslide::
    :increment:

Observacions:

1. La variança de :math:`\bar{X}` és inversament proporcional al tamany de la mostra, com ja haviem vist en el Teorema 5.2.6 pel cas genèric
2. Per calcular :math:`S_X^2` es fa servir :math:`\bar{X}`... com pot ser que siguin v.a.'s independents!
3. Fixeu-vos que l'aplicació pràctica tal qual és limitada: només podem caracteritzar la distribució de :math:`\bar{X}`, :math:`S_X^2` si coneixem els paràmetres  :math:`\mu, \sigma^2`... que és el que volem estimar!

.. rst-class:: note

    Més endavant veurem un parell de sol.lucions per aquestes mancances


Distribució de :math:`\bar{X}` per mostres grans: Teorema del Límit Central
---------------------------------------------------------------------------

Fins ara hem vist com caracteritzar :math:`\bar{X}` i :math:`S_X^2` més enllà dels seus moments
és bastant complicat a no ser que fem suposicions bastant fortes sobre
la distribució de la població.

Per sort, en el règim asimptòtic quan el tamany de la mostra :math:`N \to \infty`,
tenim un resultat absolutament sorprenent sobre la distribució de :math:`\bar{X}`
**sense cap suposició sobre la distribució d'**:math:`X_i`!

.. rst-class:: note

    **[Teorema del Límit Central, Casella & Berger 5.5.15]** La mitjana :math:`\bar{X}` de mostres iid
    amb :math:`E(X_i) =\mu` i :math:`\mbox{Var}(X_i)=\sigma^2` és tal que quan :math:`N \to \infty`,
    :math:`\sqrt{N}\left(\frac{\bar{X} - \mu}{\sigma}\right) \Rightarrow \mathcal{N}(0, 1)`

(el símbol :math:`\Rightarrow` denota convergència en distribució. Ho interpretarem
com que :math:`\sqrt{N}\left(\frac{\bar{X} - \mu}{\sigma}\right)` es comporta com :math:`\mathcal{N}(0, 1)`
a mesura que :math:`N \to \infty`)


Juguem amb el Teorema del Límit Central!
-----------------------------------------

A l'`exemple de l'inici del Tema 2 <https://e-aules.uab.cat/2020-21/mod/resource/view.php?id=156704>`_
ja vem acabar veient que la distribució de :math:`\bar{X}`, al re-mostrejar amb remplaçament
:math:`N=1000` vegades la nostra població, s'assemblava bastant a una normal:

.. figure::  /_static/0_Intro/clt.png
    :height: 400px
    :align: center

.. nextslide::
    :increment:

Experimentem una mica:

1. Generem N=1000 mostres de :math:`\bar{X}_n` per mostres de tamany :math:`n=10,100,500,1000` d'una distribució amb variança finita. Podeu provar distribucions discretes (binomial negativa, poisson) i contínues (exponencial).
2. Ara repetim l'experiment però amb alguna distribució amb variança no finita (per exemple, Cauchy)

Què observeu? Com de ràpid respecte a :math:`n` s'assembla la distribució de :math:`\bar{X}` a :math:`\mathcal{N}(\mu, \frac{\sigma^2}{n})`?

.. nextslide::
    :increment:

Similar al que passava amb el resultat de [Casella & Berger 5.3.1] per una població normal,
l'utilitat pràctica del Teorema del Límit Central requereix a priori el coneixement
de :math:`\sigma^2`...

Per sort, hi ha un resultat (Teorema de Slutsky, [Casella & Berger 5.5.17]) que ens permet
remplaçar :math:`\sigma^2` per :math:`S^2_X`:

:math:`\sqrt{N}\left(\frac{\bar{X} - \mu}{\sqrt{S^2_X}}\right) \Rightarrow \mathcal{N}(0, 1)`

cosa que ens permet fer inferència aproximada sobre :math:`\mu`
a partir de :math:`\bar{X}` i :math:`\sqrt{S^2_X}`, com veurem tot seguit:

.. nextslide:: Interval de confiança per :math:`\mu`

Identificant :math:`\mbox{Var}(\bar{X}) = \frac{\sigma^2}{N}`, sabem que, per :math:`N` suficientment gran,

:math:`\frac{\bar{X} - \mu}{\sqrt{\mbox{Var}(\bar{X})}} \sim \mathcal{N}(0, 1)`

podem trobar un interval :math:`[-z_{\alpha}, z_{\alpha}]` tal que, per qualsevol :math:`\alpha`,

:math:`P(-z_{\alpha} \leq \frac{\bar{X} - \mu}{\sqrt{\mbox{Var}(\bar{X})}} \leq z_{\alpha}) = 1 - \alpha`

*Exercicis:*

1. Trobem un interval **aleatori** :math:`[\hat{\mu}_1, \hat{\mu}_2]` calculat a partir de la mostra tal que :math:`P(\mu \in [\hat{\mu}_1, \hat{\mu}_2]) = 0.95` (noteu que aquí la quantitat aleatòria és l'interval, no :math:`\mu`!)
2. Si tenim una idea del ratio :math:`\frac{\mu}{\sigma}` (el que se sol anomenar relació senyal-soroll en tractament estadístic del senyal), per quin :math:`N` tindrem que l'error d'estimació és inferior a 5% amb probabilitat 95%?

.. nextslide::
    :increment:

Solució Exercici (1):  Escollint :math:`\alpha=0.05`, i fent servir
l'aproximació del TLC

:math:`\frac{\bar{X} - \mu}{\sqrt{\mbox{Var}(\bar{X})}} \sim \mathcal{N}(0, 1)`

tenim que :math:`P(-z_{\alpha} \leq \frac{\bar{X} - \mu}{\sqrt{\mbox{Var}(\bar{X})}} \leq z_{\alpha}) = 0.95`

per :math:`z_{\alpha} = \phi^{-1}\left(\alpha/2\right) = 1.96` (on :math:`\phi^{-1}` és la
f.d.c inversa d'una normal estàndard).

Per tant, re-organitzant els termes:

:math:`P(\bar{X} -1.96\sqrt{\mbox{Var}(\bar{X})} \leq  \mu \leq \bar{X} + 1.96\sqrt{\mbox{Var}(\bar{X})}) \approx 0.95`

o, el que és el mateix:

:math:`P(\mu \in \left[\bar{X} -1.96\sqrt{\mbox{Var}(\bar{X})}, \bar{X} + 1.96\sqrt{\mbox{Var}(\bar{X})}\right]) \approx 0.95`

.. nextslide::
    :increment:

Solució Exercici (2): Com en la sol.lució anterior, fem servir l'aproximació del TLC per obtenir:

:math:`P(-1.96 \leq \frac{\bar{X} - \mu}{\sqrt{\mbox{Var}(\bar{X})}} \leq 1.96) \approx 0.95`

Dividint cada element per :math:`\mu`, remplaçant :math:`\mbox{Var}(\bar{X}) = \frac{\sigma^2}{N}`, i reordenant:

:math:`P( \left|\frac{\bar{X} - \mu}{\mu}\right| \leq 1.96 \frac{\sigma}{\mu\sqrt{N}}) = 0.95`

Per tant si escollim :math:`N \geq \left(\frac{1.96}{0.05}\frac{\sigma}{\mu}\right)^2 \approx 1536 \times \left(\frac{\sigma}{\mu}\right)^2` tindrem la precisió desitjada amb una confiança del 95%.

Per exemple si creiem que la desviació estàndard és de l'ordre de la meitat que la mitja,
això ens donaria :math:`N \approx 400`.




Estadístics d'Ordre
===================

Estadístics d'Ordre: definició i exemples
-----------------------------------------

* A vegades no ens interessa caracteritzar el comportament "típic" d'una població, sino el **comportament extrem**, per exemple: saber quin es el cabal màxim d'un riu és molt més útil a l'hora de dimensionar un pont que saber-ne el cabal mitjà.

* D'altres vegades la mitjana pot ser massa sensible a valors grans per distribucions amb "cues" llargues i donar una impressió equivocada, sent més interessant utilitzar els percentils o mitjana. Per exemple: el retorn mig d'una inversió de capital risc pot ser molt gran si vens un "unicorni", mentres que la mediana molt petita.

.. rst-class:: note

    [casella & Berger 5.4.1] Els estadístics d'ordre d'una mostra :math:`\left\{X_1, \cdots, X_N\right\}`
    són els valors de la mostra ordenats en ordre ascendent, que identificarem per :math:`\left\{X_{(1)}, \cdots, X_{(N)}\right\}`


.. nextslide::
    :increment:

Per exemple:

* El mínim/màxim mostral: :math:`X_{(1)}, X_{(N)}`
* El rang mostral: :math:`R = X_{(N)} - X_{(1)}`
* La mediana: :math:`M = X_{(N+1)/2}` si :math:`N` és senar, :math:`M = \frac{1}{2}(X_{N/2} + X_{N/2 + 1})` si parell.
* Els quartils...

.. rst-class:: note

    Com hem vist abans per la mitjana i la variança empírica, els estadístics d'ordre son també funcions de variables aleatòries i per tant una v.a. en sí mateixos


Distribució dels extrems
------------------------------------------------------------

Sorprenentment, la distribució dels extrems (:math:`X_{(1)}, X_{(N)}`)
d'una mostra iid és bastant fàcil d'obtenir a través de la f.d.c.

Denotem per :math:`U = \min_i X_i = X_{(1)}`, amb :math:`X_i \sim F_X`. Aleshores:

.. math::

    F_U(u) = P(U \leq u) &= P(\min_i X_i \leq u) \\
                         &= 1 - P(\min_i X_i > u) \\
                         &= 1 - P(\cap_i X_i > u) \\
                         &= 1 - \Pi_i P(X_i > u) \\
                         &= 1 - \left(1 - F_X(u)\right)^N

Per tant, si :math:`X_i` son v.a. contínues amb f.d.p :math:`f_X`:

.. math::
    f_U(u) = \frac{d F_X(u)}{du} = N\left(1 - F_X(u)\right)^{N-1}f_X(u)

.. nextslide::
    :increment:

Un raonament similar ens permet obtenir la f.d.p del màxim :math:`V = \max_i X_i = X_{(N)}`:

.. math::
    f_V(u) =  N\left(F_X(u)\right)^{N-1}f_X(u)

*Exemple d'aplicació*: Màxim d'una mostra iid d'una població uniforme entre [0,1]:

La f.d.p d'una uniforme és :math:`f_X(x) = 1` per :math:`0 \leq x \leq 1`. Per tant :math:`F_X(x) = x` per :math:`0 \leq x \leq 1`.

Aplicant la fórmula anterior, trobem que la distribució del màxim entre N mostres és:

.. math::
    f_{\max_i X_i}(u) = \left\{\begin{array}{cc} N x^{N-1} & 0 \leq x \leq 1 \\ 0 & \mbox{ altrament} \end{array}\right.

.. nextslide::
    :increment:

.. image::  /_static/0_Intro/max_uniforme.png
    :height: 250px
    :align: center

.. code-block:: R

    u = seq(0, 1, length=100)
    Ns = c(10, 100, 1000)
    colors = c('red', 'green', 'blue')
    for (i in 1:length(Ns)){
      if (i == 1){
        plot(u, Ns[i]*(u^(Ns[i]-1)), type = 'l', ylab = 'f_U', col=colors[i])
      } else {
        lines(u, Ns[i]*(u^(Ns[i]-1)), ylab = 'f_U',  col=colors[i])
      }
    }
    legend(0, 9, legend=Ns, col=colors, lty=1)

Distribució dels estadístics d'ordre en el cas discret
------------------------------------------------------------

Considerem :math:`X` discreta prenent valors :math:`x_1 < x_2 < \cdots < x_k`:

:math:`p_X(x_i) = p_i`

Per una mostra iid d':math:`X` de talla N, definim:

:math:`Y_i`: nombre de :math:`X_j` tals que :math:`X_j \leq x_i`, per :math:`i>1`

Com que la mostra és independent i :math:`P(X_j \geq x_i) = \sum_{k=1}^i p_i := P_i`,
tenim que:

:math:`Y_i \sim \mbox{Binomial}(P_i, N)`

.. nextslide::
    :increment:

Ara només cal observar que l'esdeveniment :math:`X_{(j)} \leq x_i`
és equivalent a que hi hagi al menys :math:`j` de les observacions
més petites o iguals a :math:`x_i`, que és exactament la definició de
:math:`Y_i \geq j`, i per tant:

:math:`P(X_{(j)} \leq x_i) = P(Y_i \geq j)`

és a dir:

:math:`F_{X_{(j)}}(x_i) = \sum_{k=j}^N {n \choose k} P_i^k(1-P_i)^{N-k}`

que és el resultat que trobarem a [Casella & Berger 5.4.3]. Per obtenir
:math:`p_{X_{(j)}}(x_i)` "només" cal calcular :math:`F_{X_{(j)}}(x_i) - F_{X_{(j)}}(x_i-1)`

Distribució dels estadístics d'ordre en el cas continuu
------------------------------------------------------------

La derivació formal de la distribució de l'estadístic d'ordre :math:`X_{(i)}`
en el cas continuu utilitza la mateixa idea que en el
cas concret però és bastant tediosa (veure [Casella & Berger 5.4.4]).

Aquí farem un raonament heurístic: l'esdeveniment
:math:`x \leq X_{(i)} \leq x + dx` per un :math:`dx` petit
és equivalent a que:

* :math:`i-1` de les mostres són estrictament més petites que :math:`x`
* 1 de les mostres està entre :math:`x` i :math:`x + dx`
* :math:`N-i` de les mostres són estríctament més grans que :math:`x`

.. nextslide::
    :increment:

Hi ha :math:`\frac{N!}{(k-1)!(N-k)!}` maneres de que es dongui
aquesta situació, i cada manera succeeix amb probabilitat
:math:`f_X(x)\left(F_X(x)\right)^{i-1}\left(1 - F_X(x)\right)^{N-k}`,
per tant:

:math:`f_{X_{(i)}}(x) = \frac{N!}{(k-1)!(N-k)!} f_X(x)\left(F_X(x)\right)^{i-1}\left(1 - F_X(x)\right)^{N-k}`

.. rst-class:: note

    A diferència dels moments mostrals (ex: mitjana, variança empírica),
    podeu veure que la caracterització dels estadístics d'ordre
    requereix un coneixement explícit de la f.d.p (o la f.m.p) de la població,
    cosa que en limita la utilitat...

.. nextslide::
    :increment:

*Exemple*: f.d.p de la mediana d'una mostra iid uniforme entre [0,1]:

Apliquem la formula de la diapo anterior amb :math:`f_X(x) = 1` i :math:`F_X(x) = x` per :math:`0 \leq x \leq 1`,
i suposant N és senar:

:math:`f_{M}(x) = \frac{N!}{(\frac{N+1}{2}-1)!(N-\frac{N+1}{2})!} x^{\frac{N+1}{2}-1}\left(1 - x\right)^{N-\frac{N+1}{2}}`

(això és una distribució :math:`\mbox{Beta}(\frac{N+1}{2}, N - \frac{N+1}{2} + 1)`

Comparem la distribució d':math:`M`, la mediana empírica, amb:

1. el que coneixem com la mediana de la població, que pel cas d'una uniforme entre 0 i 1 és 1/2.
2. l'histograma d':math:`M` per n=100 repeticions de mostres de tamany :math:`N=100`

.. nextslide:: Distribució empírica i teòrica de la mediana empírica

.. image::  /_static/0_Intro/uniform_median.png
    :height: 250px
    :align: center

.. code-block:: R

    N = 101
    n = 100
    median_hat = rep(0, N)
    for (i in 1:n){
        median_hat[i] = median(runif(N))
    }
    hist(median_hat, 50, prob=T)
    z = seq(0, 1, length=100)
    f = dbeta(z, (N+1)/2, N - (N+1)/2 + 1)
    lines(z, f)


Altres descriptius importants
==============================

L'histograma
-----------------

La distribució cumulativa empírica
----------------------------------

El boxplot
-----------------

L'scatterplot
-----------------