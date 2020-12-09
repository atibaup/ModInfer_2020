=================================================
Tema 3: Estimació
=================================================

Estimació per Màxima Versemblança
=================================================

Ajust de distribucions de probabilitat
---------------------------------------

A l'exemple de `la primera classe del Tema 3 <https://e-aules.uab.cat/2020-21/pluginfile.php/695686/mod_page/content/2/motivacio_tema_3.pdf>`_
vem veure un exemple de modelització estadística on
partim d'un conjunt de dades que podem modelar com
una mostra i.i.d. d'una població:

:math:`X_i \sim f_X(x;\theta), i=1,\cdots,N`

on:

* :math:`f_X` és la f.d.p. d'una família de distribucions i
* :math:`\theta` són els paràmetres de la mateixa (vector o escalar), també anomenats *paràmetres de la població*.

.. rst-class:: note

    El problema d'*estimació de paràmetres* o d'*ajust de la distribució* a partir de les dades
    consisteix en estimar :math:`\theta` a partir de :math:`X_1, \cdots, X_N`.

.. nextslide::
    :increment:

Normalment se segueix la següent recepta:

1. Explorar dades (estadístics descriptius, gràfics)
2. Hipòtesi: Escollir familia (paramètrica) :math:`f_X(x;\theta)`
3. Àjustar paràmetre :math:`\theta` segons algun criteri
4. Comprovar l'hipòtesi: **bondat d'ajust** (Tema 4)

.. rst-class:: note

    A la darrera classe vem veure un exemple d'aplicació d'aquesta recepta
    on el criteri d'ajust era **heurístic**: visualitzar l'histograma conjuntament
    amb :math:`f_X(x;\theta)` per diversos valors de :math:`\theta`.


.. nextslide::
    :increment:

.. figure::  /_static/0_Intro/heuristic_fit.png
    :height: 350px
    :align: center


.. rst-class:: note

    Aquest procés heurístic de prova-i-error és (1) ineficient i (2) difícil de justificar
    quantitativament

.. nextslide::
    :increment:

Un altre mètode
d'estimació molt versàtil i millor fonamentat
és el de **Màxima Versemblança**.

Per començar, definim la *log-versemblança*:

.. math::

    L(\theta; x_1, \cdots, x_N) = \log \left(f_{X_1, \cdots, X_N}(x_1, \cdots, x_N; \theta) \right)

on :math:`f_{X_1, \cdots, X_N}(x_1, \cdots, x_N; \theta)` és la
f.d.p. conjunta de la mostra.

En el cas d'una mostra iid, la log-versemblança es simplifica a:

.. math::

    L(\theta; x_1, \cdots, x_N) = \sum_{i=1}^N \log f_X(x_i;\theta)


.. rst-class:: note

    Per mostres de v.a. discretes, la log-versemblança es calcula a partir de la f.m.p. conjunta :math:`p_{X_1, \cdots, X_N}(x_1, \cdots, x_N; \theta)`
    enlloc de la f.d.c.

.. nextslide::
    :increment:

Algunes propietats de la log-versemblança:

* :math:`L(\theta; x_1, \cdots, x_N)` és un funció :math:`\Theta \times \mathbb{R}^N \to \mathbb{R}`.
* Donada una mostra en particular :math:`X_1=x_1, \cdots, X_N=x_n`, :math:`L(\theta; x_1, \cdots, x_N)` és un funció de :math:`\theta \in \Theta \to \mathbb{R}`.
* Com que la mostra és una v.a., :math:`L(\theta; X_1, \cdots, X_N)` és una v.a. per cada valor de :math:`\theta`!
* Com vem veure a la primera classe, aquesta funció es pot interpretar com un criteri de qualitat de :math:`\theta` a l'hora d'*explicar* les dades observades (quan més gran, millor explicades).

Per tant, sembla raonable definir un estimador del(s)
paràmetre(s) :math:`\theta` com:

.. math::

    \hat{\theta} = \arg \max L(\theta; x_1, \cdots, x_N)

Aquest és el que s'anomena **Estimador de Màxima Versemblança** (EMV) o MLE per les
seves sigles en anglès.

Càlcul de l'EMV
--------------------------

En alguns casos, l'EMV es pot calcular
analíticament, resolent el problema d'optimització associat.
Per exemple en una mostra d'una família Gaussiana,

.. math::

    L(\mu, \sigma; x_1, \cdots, x_N) = - \sum_{i=1}^N \frac{(x_i - \mu)^2}{2\sigma^2} - N \log(\sqrt{2 \pi} \sigma)

Aquesta funció és diferenciable i concava en :math:`\mu` i  :math:`\sigma`,
per tant el seu màxim existeix i haurà de verificar la **condició d'optimalitat**:

.. math::

    \nabla_{\mu, \sigma} L(\mu, \sigma; x_1, \cdots, x_N) = 0

.. nextslide::
    :increment:

Això ens porta a un sistema d'equacions:

.. math::

    - \sum_i \frac{x_i - \mu}{\sigma^2} &= 0 \\
    \sum_i \frac{(x_i - \mu)^2}{\sigma^3} - \frac{N}{\sigma} = 0

d'on podem concloure que l'EMV és:

.. math::

    \hat{\mu} &= \bar{x} \\
    \hat{\sigma} &= \frac{1}{N}\sum_i (x_i - \bar{x})^2

(noteu que :math:`\hat{\sigma}` no és igual que :math:`S_X^2`!)


.. nextslide::
    :increment:

És important tenir en compte que:

1. No sempre podrem calcular els EMV de manera analítica.
2. En alguns casos ho podrem calcular numèricament (fent servir el mètode de descens del gradient, o de Newton)
3. En alguns casos, l'EMV no serà únic (i.e. la log-versemblança tindrà més d'un màxim)
4. En molts casos la log-versemblança no serà concava, o diferenciable, per tant l'EMV pot ser computacionalment molt difícil de calcular

.. rst-class:: note

    Malgrat aquestes limitacions, el mètdode de la Màxima Versemblança
    ens proporciona un mètode bastant genèric per trobar estimadors.


Exemple: EMV d'una multinomial
---------------------------------------

Continuem amb un parell més d'exemples d'aplicació del EMV.

Un model molt útil en estadística és el model *multinomial*, que
s'utilitza quan tenim observacions tabulades, per exemple: un histograma,
el nombre de respostes d'un qüestionari per edat de l'entrevistat,
l'incidència d'una malaltia per regió geogràfica, etc.

En tots aquests casos, es poden resumir les N observacions d'una mostra en un
vector :math:`X_1, \cdots, X_M` on :math:`X_i` es correspon amb el nombre d'observacions dins la casella :math:`i`,
i hi ha M caselles i :math:`\sum_i X_i = N`.

**Important**: Noteu que en aquest cas :math:`X_i` no és iid!

.. nextslide:: Exemple: EMV d'una multinomial (2)

El model *multinomial* suposa que la f.d.m. conjunta de :math:`X_1, \cdots, X_M` vé donada per:

.. math::

    p(x_1, \cdots, x_m; p_1, \cdots, p_M) = \frac{N!}{\Pi_i {x_i!}}\Pi_i p_i^{x_i}

on :math:`p_1, \cdots, p_M` són els paràmetres de la població, tals que :math:`\sum_i p_i = 1`,
i per construcció :math:`\sum_i X_i = N`.

.. nextslide::
    :increment:

A partir d'aquesta f.d.m conjunta, i una mostra :math:`X_1=x_1, \cdots, X_M=x_m`
podem calcular la log-versemblança:

.. math::

    L( p_1, \cdots, p_M; x_1, \cdots, x_m) \propto - \sum_i \log (x_i!) + \sum_i x_i \log p_i

(on ignorem els termes que no depènen d':math:`x_i` o :math:`p_i`.)

Com que sabem que :math:`\sum_i p_i = 1` , podem imposar la restricció que :math:`p_M = 1 - \sum_{i=1}^{M-1} p_i`,
i tindrem:

.. math::

    L( p_1, \cdots, p_{M-1}; x_1, \cdots, x_m) \propto&  - \sum_i \log (x_i!) + \sum_{i=1}^{M-1} x_i \log p_i \\
        & + (N - \sum_{i=1}^{M-1} x_i ) \log (1 - \sum_{i=1}^{M-1} p_i)

.. nextslide::
    :increment:

Calculant-ne el gradient i igualant-lo a 0 (exercici per casa), podrem concloure que l'EMV d'una multinomial és simplement:

.. math::

    \hat{p}_i = \frac{x_i}{N}


.. rst-class:: note

    En els exemples que hem vist fins ara (Gaussiana, Multinomial, Poisson..), excepte el model de precipitació a través d'una Gamma,
    l'EMV es correspon amb l'estimador que hauriem escollit sense saber la teoria de Màxima Versemblança...
    Val la pena complicar-nos la vida amb aquesta teoria!?


Exemple: EMV amb dades censurades
---------------------------------------

L'EMV és una metodologia molt més potent del que hem vist fins ara. D'na banda, com veurem tot seguit,
ens permet estimar paràmetres en casos on l'intuició potser ens fallaria. Per altra banda, com veurem
més endavant, els EMVs té unes propietats estadístiques interessants.

Considerem l'exemple següent: Estem interessats en modelar
la supervivència d'uns pacients sota un tractament mèdic determinat.
Considerem :math:`X_i` l'edat en anys de defunció del pacient :math:`i`.
Durant la durada del nostre estudi, alguns dels pacients moriran
però alguns altres seguiran vius. Per tant, per aquests últims
pacients l'únic que sabrem és que :math:`X_i \geq e_i` on
:math:`e_i` és l'edat del pacient en el moment d'acabar l'estudi.

Per tant necessitem modelar la versemblança d'una mostra
mixta d'observacions :math:`X_i` i esdeveniments :math:`X_j \geq e_j`,
on aquestes últimes s'anomenen "observacions censurades" (com
si algú ens hagués "censurat" les dades, en aquest cas l'univers).

.. nextslide::
    :increment:

Anomenem :math:`\mathcal{M}` el subconjunt
de pacients morts (i que per tant dels que hem pogut observar-ne l'edat de defunció)
i :math:`\bar{\mathcal{M}}` el subconjunt de pacients vius (dels que només sabem q
que :math:`X_i \geq e_i`).

La funció de log-versemblança
que utilitzarem en aquest cas és:

.. math::

    L(\theta) = \log P\left(\left( \cap_{i: \mathcal{M}}{ X_i=x_i} \right) \cap \left(\cap_{i: \bar{\mathcal{M}}}{ X_i \geq e_i}\right); \theta \right)

Si la mostra és iid, això es simplificarà a:

.. math::

    L(\theta) = \sum_{i: \mathcal{M}}\log p_X(x_i; \theta) + \sum_{i: \bar{\mathcal{M}}} \log(1 -  F_X(e_i; \theta))

on :math:`p_X(x_i; \theta)` és la f.m.p. del nostre model d'edat de defunció i :math:`F_X(e_i; \theta)` n'és la f.d.c. corresponent.

.. nextslide::
    :increment:

Suposem que modelem l'edat de defunció dels pacients segons una llei geomètrica:

.. math::

    p_X(x; \rho) = (1 - \rho)^{x - 1} \rho

on :math:`\rho \in [0, 1]` és el paràmetre de la població.
La f.d.c. és :math:`F_x(x ;\rho) = 1 - (1 -\rho)^x`
i per tant podem calcular la log-versemblança com:

.. math::

    L(\rho) = \left|\mathcal{M}\right| \log \rho + \sum_{i: \mathcal{M}}(x_i -1) \log(1 -\rho) + \sum_{i: \bar{\mathcal{M}}}e_i \log(1 -  \rho)

**Exercici**: Acabar de calcular :math:`\hat{\rho} = \arg \max  L(\rho)`


Propietats asimptòtiques de l'EMV
=================================================

Biaix, Variança, EQM...
---------------------------------------

Recordem que la log-versemblança :math:`L(\theta; X_1, \cdots, X_N)`
és una v.a. per cada :math:`\theta` (i.e. una "funció aleatòria")
i per tant l'EMV :math:`\hat{\theta}` també és una v.a.! Per caracteritzar-lo
haurem de fer servir les eines que vem desenvolupar al Tema 2:

- **Biaix**: :math:`b(\hat{\theta}) := E(\hat{\theta} - \theta_0)`
- **Variança**: :math:`\mbox{Var}(\hat{\theta}) = E((\hat{\theta} - E(\hat{\theta}))^2)`
- **Error Quadràtic Mitjà**: :math:`\mbox{MSE}(\hat{\theta}) = E((\hat{\theta} - \theta_0)^2)`
- **La seva f.d.p.**: :math:`f_{\hat{\theta}}(x)`


.. rst-class:: note

    **IMPORTANT**: Tot el que segueix **suposa** una mostra i.i.d. generada segons un
    model :math:`X_i \sim f_X(x;\theta_0); i=1,\cdots,N`, on :math:`\theta_0`
    és el valor **real però desconegut** del paràmetre a estimar. Per tant totes les esperances
    que tractem són relatives a aquesta :math:`f_X(x;\theta_0)`!

.. nextslide::
    :increment:

En general l'EMV no tindrà una forma analítica que es presti a
calcular-ne el biaix, variança o MSE, i molt menys a
caracteritzar-ne la distribució.

La gran avantatge dels EMV és que, asimptòticament,
es poden caracteritzar relativament fàcilment. Primer definim
què és el que volem dir per "asimptòtic". Explicitant la dependència
de l'EMV amb el tamany de la mostra:

:math:`\hat{\theta}^N = \arg \max  L(\theta; X_1, \cdots, X_N)`

el que ens interessarà és caracteritzar el biaix, variança i
f.d.p de :math:`\hat{\theta}^N` a mesura que :math:`N \to \infty`

.. nextslide::
    :increment:

Començarem aquesta caracterització amb el següent resultat,
que provarem de manera informal:

.. rst-class:: note

    **Teorema 3.1**: Donada una mostra iid, i per :math:`f(x; \theta)` prou "suaus",
    :math:`\frac{1}{N}L(\theta; X_1, \cdots, X_N) = \frac{1}{N}\sum_i \log f(X_i; \theta)`
    convergeix en probabilitat a :math:`E(\log f_X(x; \theta))`.

*"Demostració"*: Resulta de l'aplicació de la `LLei Feble dels Grans Nombres <https://atibaup.github.io/ModInfer_2020/slides/0_Intro/0_2_Intro_stats.html#25>`_
que vem veure al Tema 2. Per tant només hauriem de comprovar que podem aplicar-la, és a dir que:

* :math:`E(\log f(X_i; \theta))` existeix i que
* :math:`\mbox{Var}(\log f(X_i; \theta))` és finita

que dóna lloc a la condició "prou "suaus"" de la proposició.

Consistència
---------------------------------------

**Definició**: Un estimador és consistent si, a mesura
que el tamany de la mostra augmenta, l'estimador
convergeix en probabilitat al paràmetre d'interès:

.. math::

    \lim_{N\to \infty} P(|\hat{\theta}^N - \theta_0|>\epsilon) = 0


.. rst-class:: note

    **Teorema 3.2**: Sota algunes condicions de regularitat per :math:`f_X(x; \theta)`,
    l'EMV és un estimador consistent.

*"Demostració"*: Pel **Teorema 3.1** hem vist que
:math:`\frac{1}{N}L(\theta; X_1, \cdots, X_N)  \to E(\log f_X(x; \theta))`
en probabilitat. No podrem demostrar-ho en aquest curs,
però sembla raonable esperar que, sota algunes condicions,
el :math:`\hat{\theta}^N` que maximitza l'expressió de l'esquerra
hauria de maximitzar l'expressió de la dreta i viceversa.

.. nextslide::
    :increment:

Sota aquest supòsit, només ens cal verificar que :math:`\theta_0` maximitza
:math:`E(\log f_X(x; \theta))` per concloure que :math:`\hat{\theta}^N \to \theta_0`.
Fem-ho:

.. math::

    \frac{\partial}{\partial \theta} E(\log f_X(x; \theta)) & = \frac{\partial}{\partial \theta} \int_x  \log f(x; \theta) f(x; \theta_0) dx \\
    & =  \int_x  \frac{\partial}{\partial \theta}\log f(x; \theta) f(x; \theta_0) dx \\
    & = \int_x  \frac{1}{f(x; \theta)} \frac{\partial}{\partial \theta} f(x; \theta) f(x; \theta_0) dx

.. rst-class:: note

    Estem cometent bastants sacrilegis intercanviant l'ordre dels operadors
    integrals i diferencials sense donar explicacions... però ens haurem de
    creure que és possible per la majoria de :math:`f_X` d'interès.

.. nextslide::
    :increment:

Noteu que per :math:`\theta = \theta_0`, aquesta última expressió resulta:

.. math::

    \int_x  \frac{1}{f(x; \theta_0)} \left.\frac{\partial}{\partial \theta} f(x; \theta) \right|_{\theta=\theta_0} f(x; \theta_0) dx & =  \int_x  \left. \frac{\partial}{\partial \theta} f(x; \theta_0) \right|_{\theta=\theta_0} dx\\
    & =  \frac{\partial}{\partial \theta} \int_x   f(x; \theta_0)dx \\
    & = 0

per tant :math:`\theta = \theta_0` és tal que :math:`\frac{\partial}{\partial \theta} E(\log f_X(x; \theta))=0`
i si :math:`E(\log f_X(x; \theta))` és concava, n'és un màxim. Amb això
podem "concloure" que :math:`\hat{\theta}^N \to \theta_0`.


Distribució asimptòtica de l'EMV
---------------------------------------

Per ara hem vist que l'EMV té una propietat bona, la consistència: quan el tamany
de la mostra augmenta, l'estimador convergeix al valor del
paràmetre de la població.

La caracterització asimptòtica de l'EMV no s'acaba aquí: de fet,
tot seguit veurem que **la distribució de l'EMV és Gaussiana,
centrada en el paràmetre d'interès** :math:`\theta_0` **(asimptòticament
sense biaix!) i amb una variança que decreix amb N**.


.. nextslide:: Distribució asimptòtica de l'EMV (2)
    :increment:

.. rst-class:: note

    **Teorema 3.3**: Sota algunes condicions de regularitat de
    :math:`f_X`, :math:`\sqrt{N {I}(\theta_0)}(\hat{\theta}^N - \theta_0) \Rightarrow \mathcal{N}(0, 1)`, on
    :math:`{I}(\theta) = - E\left(\frac{\partial^2}{\partial \theta^2}\log f(X; \theta) \right)`
    és la **Informació de Fisher**.

Abans de donar un esboç de la prova d'aquest resultat, mirem d'entendre'l.
Aquest resultat implica:

1. L'EMV és **asimptòticament sense biaix**, :math:`\lim_{N \to \infty} E(\hat{\theta}^N - \theta_0) =0`.
2. La seva **variança asimptòtica** és inversament proporcional a N, i per tant l'EMV és **consistent**
3. Al límit, i independentment de la distribució de la mostra, **l'EMV es comporta com una Gaussiana!**
4. La **variança asimptòtica** depèn d'aquesta quantitat un pèl esotèrica :math:`{I}(\theta)`...

.. nextslide:: Exemple d'aplicació: EMV d'una Poisson

Ara comprovarem computacionalment el resultat per un cas en particular,
quan :math:`X \sim \mbox{Poisson}(\lambda_0)`. Tenim que

.. math::

    \log f_X(x;\lambda) = x\log \lambda - \lambda - \log x!

i per tant:

.. math::

   \frac{\partial^2}{\partial \theta^2} \log f_X(x;\lambda) = -\frac{x}{\lambda^2}

aleshores: :math:`{I}(\lambda)= - E\left(-\frac{X}{\lambda^2} \right)=\frac{1}{\lambda}`.

Per altra banda, l'EMV d'una mostra
iid de Poisson és simplement el moment mostral (Exercici!):

:math:`\hat{\lambda}^N = \bar{x}`

Per tant, asimptòticament: :math:`\hat{\lambda}^N \sim \mathcal{N}(\theta_0, \frac{\lambda_0}{N})`

.. nextslide::
    :increment:

.. code-block:: R

    N = 100 # Tamany de cada mostra
    n = 1000 # Nombre de repeticions
    lambda = 15 # Paràmetre de la població

    emv_poisson <-rep(0, n)
    for (i in 1:n){
      sample = rpois(N, lambda)
      emv_poisson[i] = mean(sample)
    }

    x = seq(min(emv_poisson), max(emv_poisson), 0.1)
    hist(emv_poisson, 20, freq = F)
    lines(x, dnorm(x, lambda, sqrt(lambda/N)), col='green')

.. image::  /_static/0_Intro/ex_asimptotic.png
    :height: 250px
    :align: center

Justificació de la distribució asimptòtica de l'EMV
-----------------------------------------------------

Ara procedirem a justificar el Teorema 3.3, sense arribar a provar-lo, cosa
que requeriria tècniques molt més avançades que les d'aquest curs.

Primer de tot, alleugerirem la notació establint, com ja hem fet servir
en exemples anteriors:

:math:`L(\theta) := L( \theta; x_1, \cdots, x_m)`

Imaginem-nos una :math:`L(\theta)` "simpàtica" al voltant de :math:`\theta_0`:

.. image::  /_static/0_Intro/likelihood_ex.png
    :height: 300px
    :align: center

.. nextslide::
    :increment:

Recordeu de càlcul que l'expansió de Taylor de segon ordre d'una funció "suau"
:math:`f(x)` al voltant d'un punt :math:`x_0` és:

.. math::

    f(x) \approx f(x_0) + (x - x_0) f'(x_0)

Aleshores suposant que :math:`L'(\theta)` és "suau", tindrem que:

.. math::

    L'(\theta) \approx L'(\theta_0) + (x - x_0) L''(\theta_0)

i per tant, per :math:`\hat{\theta}` que maximitza :math:`L(\theta)`,
haurà de verificar la condició d'optimalitat:

.. math::

    0 = L'(\hat{\theta}) \approx L'(\theta_0) + (\hat{\theta} - \theta_0) L''(\theta_0)

Cosa que ens permet concloure que:

.. math::

    (\theta - \theta_0) \approx \frac{L'(\theta_0)}{L''(\theta_0)}

.. nextslide:: Justificació de la distribució asimptòtica de l'EMV (3)
    :increment:

Gràficament:

.. figure::  /_static/0_Intro/likelihood_ex_2.png
    :height: 500px
    :align: center

.. nextslide::  Justificació de la distribució asimptòtica de l'EMV (4)
    :increment:

.. figure::  /_static/0_Intro/likelihood_ex_3.png
    :height: 500px
    :align: center

.. nextslide::  Justificació de la distribució asimptòtica de l'EMV (5)
    :increment:

Abans de continuar, farem un petit escalat de la darrera equació:

.. math::

    \sqrt{N}(\theta - \theta_0) \approx \frac{\frac{1}{\sqrt{N}} L'(\theta_0)}{ \frac{1}{N} L''(\theta_0)}

Ara, fixem-nos que en el cas iid, el numerador:

.. math::

    \frac{1}{\sqrt{N}} L'(\theta_0) =\frac{1}{\sqrt{N}} \sum_{i=1}^{N} \frac{\partial}{\partial \theta} \log f_X(x_i;\theta_0)

és una suma de v.a. iid (:math:`\log f_X(x_i;\theta_0)`) amb mitja 0, per la raó que hem vist
en el Teorema 3.1, i variança:

.. math::

    \mbox{Var}(\frac{1}{\sqrt{N}} L'(\theta_0)) =E( \frac{\partial}{\partial \theta} \log f_X(X;\theta_0))^2

per propietats de la variança de la suma de v.a. iid.

.. nextslide::  Justificació de la distribució asimptòtica de l'EMV (6)
    :increment:

Per continuar, necessitarem un resultat auxiliar:

.. rst-class:: note

    Lema 3.4: Sota algunes condicions de regularitat de
    :math:`f_X`, :math:`E( \frac{\partial}{\partial \theta} \log f_X(X;\theta))^2 = - E( \frac{\partial^2}{\partial \theta^2} \log f_X(X;\theta)) = I(\theta)`

*Justificació*: Com que :math:`\int f_X(x;\theta)dx = 1`,

.. math::

    0 & = \frac{\partial}{\partial \theta} \int f_X(x;\theta)dx = \int  \frac{\partial}{\partial \theta} f_X(x;\theta) dx\\
    0 & = \int  (\frac{\partial}{\partial \theta} \log f_X(X;\theta))  f_X(x;\theta) dx = \frac{\partial}{\partial \theta} \int  (\frac{\partial}{\partial \theta} \log f_X(X;\theta))  f_X(x;\theta) dx \\
    0 & = \int  (\frac{\partial^2}{\partial \theta^2} \log f_X(X;\theta))  f_X(x;\theta)dx + \\
      & + \int (\frac{\partial}{\partial \theta} \log f_X(X;\theta))^2 f_X(x;\theta)dx

.. nextslide::  Justificació de la distribució asimptòtica de l'EMV (7)
    :increment:

Combinant aquest últim resultat amb l'aplicació del TLC, podem concloure que

.. math::

    \frac{1}{\sqrt{N}} L'(\theta_0) \Rightarrow \mathcal{N}(0, I(\theta_0))

Per altra banda, pel denominador tenim:

.. math::

     \frac{1}{N} L''(\theta) = \frac{1}{N} \sum_i \frac{\partial^2}{\partial \theta^2} \log f_X(x_i;\theta)

que, per la Llei dels Grans Nombres:

.. math::

     \frac{1}{N} L''(\theta) \to E(\frac{\partial^2}{\partial \theta^2} \log f_X(X;\theta)) = -I(\theta)

.. nextslide::  Justificació de la distribució asimptòtica de l'EMV (8)
    :increment:

Combinant aquests dos resultats, veiem que

.. math::

    \frac{\frac{1}{\sqrt{N}} L'(\theta_0)}{ \frac{1}{N} L''(\theta_0)} \Rightarrow  \mathcal{N}(0, I^{-1}(\theta_0))

que és el resultat que buscàvem justificar.

**Interpretació de la Informació de Fisher** (:math:`I(\theta)`):

* Fixeu-vos que  :math:`L''(\theta_0)` és asimptòticament proporcional a :math:`I(\theta)`
* :math:`L''(\theta_0)` mesura la corvatura de :math:`L(\theta)` al voltant de :math:`\theta_0`
* Quan més corbatura, menys variança, quan més "plana" més variança.
* => La "forma" de la nostra distribució determina la variança asimptòtica de l'estimador

Eficiència i Cota de Cramer-Rao
---------------------------------------

L'últim concepte teòric que considerarem en aquest tema
és el de l'eficiència.

En aquest curs no ho hem vist, però hi ha altres metodologies
per obtenir estimadors com el `Mètode dels Moments <https://en.wikipedia.org/wiki/Method_of_moments_(statistics)>`_,
els estimadors de `James-Stein <https://en.wikipedia.org/wiki/James%E2%80%93Stein_estimator>`_,
o els `estimadors Bayesians <https://en.wikipedia.org/wiki/Bayes_estimator>`_.

Per tant, per un mateix paràmetre, podem trobar-nos amb diferents
"receptes" per construir-ne un estimador.


.. rst-class:: note

    La pregunta que ens ocupa és: Donats diferents estimadors d'un mateix paràmetre, com n'escollim el millor?


.. nextslide::
    :increment:

La resposta a aquesta pregunta és: "depèn".

Dependrà del que volguem
fer a posteriori amb aquest estimador, però un criteri bastant acceptat
és el de comparar-los segons el seu Error Quadràtic Mitjà (denominat MSE per les sigles en anglès), que
com sabem es pot descomposar com la suma de la Variança de l'Estimador
i del quadrat del seu biaix:

.. math::

    \mbox{MSE}(\hat{\theta}) & = E(\hat{\theta}^N - \theta_0)^2 \\
                             & = \mbox{Var}(\hat{\theta}) + b(\hat{\theta})^2

Si ens restringim a estimadors sense biaix, comparar-ne l'MSE és
equivalent a comparar-ne les variànces, cosa que dona lloc a la definició
d'eficiència:

.. rst-class:: note

    Un estimador sense biaix és **eficient** si té menys o igual variança que
    qualsevol altre estimador

.. nextslide::
    :increment:

Aquesta definició no és massa constructiva: per trobar l'estimador eficient,
hauriem de construïr tots els estimadors possibles (infinits!), calcular-ne
la variança, i finalment escollir el que en té menys.

Per sort, un dels resultats més importants de l'estadística,
desenvolupat als anys 40 del s. XX per Harald Crámer i C.R. Rao,
ens diu:

.. rst-class:: note

    **Teorema 3.5**: Sigui :math:`X_1, \cdots, X_N` una mostra iid
    amb :math:`X \sim f_X(x;\theta_0)` i :math:`\tilde{\theta}` un estimador
    sense biaix de :math:`\theta_0`. Aleshores, sota certes condicions
    de regularitat de :math:`f_X(x;\theta)`,
    :math:`\mbox{Var}(\tilde{\theta}) \geq \frac{1}{N I(\theta_0)}`.

Fixeu-vos-hi que per tant, **l'EMV és asimptòticament eficient**
ja que :math:`\mbox{Var}(\hat{\theta}) \to \frac{1}{N I(\theta_0)}`.


Intervals de confiança per EMVs
=================================================

Intervals de confiança
---------------------------------------

Durant el curs ja hem treballat diverses vegades amb Intervals de Confiança,
que vam introduïr per primer cop a la Pràctica #2.

Un **interval de confiança** de nivell :math:`1-\alpha` (a la Pràctica #2
parlàvem de nivell :math:`\alpha` enlloc de :math:`1-\alpha` però aquesta darrera convenció
és més comuna) per un paràmetre :math:`\mu` és un estadístic
(per tant una v.a. que és una funció de la mostra)
format per dos nombres :math:`L` i :math:`U` tals que:


.. math::

    P([L, U] \ni \mu) = 1 - \alpha

.. rst-class:: note

    És important entendre que la quantitat aleatòria aquí és el conjunt :math:`[L, U]`
    i no :math:`\mu`. L'interpretació d'aquesta probabilitat és que, si agaféssim M mostres
    (cada una de tamany N) i calculéssim M intervals (un per cada mostra), hauriem
    d'esperar que una fracció :math:`1 - \alpha` dels mateixos contenen :math:`\mu`.


Intervals exactes
---------------------------------------

En alguns casos específics, podrem calcular I.C's de manera "exacta",
és a dir, calculant la f.d.p. :math:`f_{\hat{\theta}}` de l'estimador
del paràmetre d'interès, i utilitzant-la per calcular un I.C.

Aquest és el cas, per exemple, de l'EMV de la mitja i variança d'una mostra Gaussiana,
on, com vam veure a la `Pràctica 2 <https://e-aules.uab.cat/2020-21/mod/assign/view.php?id=178383>`_:

.. math::

    \frac{\sqrt{N}(\hat{\mu} - \mu)}{\hat{\sigma}} \sim t_{N-1}

ja que l'EMV per la mitja i variança Gaussiana és
:math:`\hat{\mu}=\bar{x}` i :math:`\hat{\sigma}^2 = \frac{N-1}{N}S_X^2`.
Per altra banda, `un dels resultats que vam veure al Tema 2 <https://atibaup.github.io/ModInfer_2020/slides/0_Intro/0_2_Intro_stats.html#29>`_ és que:

.. math::

    \frac{(N-1)S_X^2}{\sigma^2} \sim \chi_{N-1}^2


.. nextslide::
    :increment:

Podem fer servir aquests dos resultats per
calcular IC's per :math:`\hat{\mu}, \hat{\sigma}` com segueix:

1) Com que la distribució :math:`t_{N-1}` és simètrica
al voltant de 0, i denotant per :math:`\phi_t(x)`
la seva f.d.c. inversa, tindrem que:

.. math::

    P(-\phi_t(\frac{\alpha}{2}) \leq \frac{\sqrt{N}(\hat{\mu} - \mu)}{\hat{\sigma}} \leq \phi_t(\frac{\alpha}{2}))

d'aquí podem concloure que l'interval de confiança de nivell :math:`1 - \alpha`
per :math:`\mu` és:

.. math::

    \hat{\mu} \pm \phi_t(\frac{\alpha}{2})\sqrt{\frac{\hat{\sigma}^2}{N}}

.. rst-class:: note

    Noteu la similitud i les diferències respecte l'interval de confiança que obtindriem pel TLC.


.. nextslide::
    :increment:


2) Per altra banda com que

.. math::

    \frac{N \hat{\sigma}^2}{\sigma^2} = \frac{(N-1)S_X^2}{\sigma} \sim \chi_{N-1}^2

i denotant per :math:`\phi_{\chi_{N-1}^2}(x)` la f.d.c. inversa
d'una :math:`\chi_{N-1}^2`, tindrem:

.. math::

    P\left(\phi_{\chi_{N-1}^2}(1 - \frac{\alpha}{2}) \leq \frac{N \hat{\sigma}}{\sigma} \leq \phi_{\chi_{N-1}^2}(\frac{\alpha}{2})\right) = 1- \alpha

i per tant, l'IC de nivell :math:`1-\alpha`:

.. math::

    \left[\frac{N \hat{\sigma}^2}{\phi_{\chi_{N-1}^2}(\frac{\alpha}{2})}, \frac{N \hat{\sigma}^2}{\phi_{\chi_{N-1}^2}(1 - \frac{\alpha}{2})}\right]

que com podeu observar no és simètric com en el cas anterior.


Intervals aproximats asimptòtics
---------------------------------------

En general serà difícil caracteritzar la f.d.p. dels nostres estimadors, i
per tant haurem de recórrer a aproximacions, com la que vam veure
en la teoria asimptòtica de l'EMV (Teorema 3.3 d'aquestes diapos):

.. math::

    \sqrt{N {I}(\theta_0)}(\hat{\theta} - \theta_0) \Rightarrow \mathcal{N}(0, 1)

on :math:`I(\theta)` és
la Informació de Fisher. Si sapiguéssim el valor de :math:`\theta_0`, podriem fer
servir el desenvolupament que ja hem fet servir múltiples vegades
per trobar un IC de nivell :math:`1  - \alpha`. Per N suficientment gran:

.. math::

    P\left(\sqrt{N {I}(\theta_0)}(\hat{\theta} - \theta_0) \leq \phi\left(1 - \frac{\alpha}{2}\right)\right) &\approx 1 - \frac{\alpha}{2} \\
    P\left(\sqrt{N {I}(\theta_0)}(\hat{\theta} - \theta_0) \leq \phi\left(\frac{\alpha}{2}\right)\right) & \approx \frac{\alpha}{2}

on :math:`\phi(x)` és la f.d.c. inversa (funció de quantils) d'una normal estàndard.

.. nextslide::
    :increment:

Per tant, sabent que :math:`\phi\left(1 - \frac{\alpha}{2}\right)= -  \phi\left(\frac{\alpha}{2}\right)`,

.. math::

    P\left( \phi\left(\frac{\alpha}{2}\right) \leq \sqrt{N {I}(\theta_0)}(\hat{\theta} - \theta_0) \leq -\phi\left(\frac{\alpha}{2}\right)\right) \approx 1 - \alpha

cosa que justificaria el següent IC aproximat per l'EMV d'una mostra iid d'una
població :math:`f_X(x;\theta)`:

.. math::

    \hat{\theta} \pm \phi\left(\frac{\alpha}{2}\right) \sqrt{\frac{1}{N I(\theta_0)}}

on :math:`\phi` és la f.d.c. inversa d'una Normal estàndard i :math:`I(\theta)` és
la Informació de Fisher.

.. nextslide::
    :increment:

Com que no coneixem :math:`\theta_0`, aquesta última expressió és inútil ja que depèn
de :math:`I(\theta_0)`.

Farem doncs servir el **principi de substitució** (plug-in principle),
que ja hem fet servir altres vegades, i substituïrem :math:`I(\theta_0)` per :math:`I(\hat{\theta})`,
sota el precepte de que per N suficientment gran :math:`\hat{\theta} \to \theta_0`.

Per tant arribem a:

.. math::

    \hat{\theta} \pm \phi\left(\frac{\alpha}{2}\right) \sqrt{\frac{1}{N I(\hat{\theta})}}

.. rst-class:: note

    Fixeu-vos en la similitud/diferències entre aquesta expressió i els Intervals de Confiança obtinguts
    en el cas on podíem derivar intervals de confiança exactes.

Unes notes sobre el càlcul de :math:`I(\hat{\theta})`
-----------------------------------------------------

A l'última entrega de problemes, he vist que hi havia una mica de confusió
respecte el càlcul de la Informació de Fisher :math:`I(\theta)`.

En molts casos, podrem calcular :math:`I(\theta)` analíticament,
a través d'una de les seves dues definicions alternatives:

.. math::

    I(\theta) &= E( \frac{\partial}{\partial \theta} \log f_X(X;\theta))^2 \\
    I(\theta) &= - E( \frac{\partial^2}{\partial \theta^2} \log f_X(X;\theta))

(Podem escollir la que ens vagi millor per al problema.) Fixeu-vos que la v.a.
aleatòria de la que volem calcular l'esperança aquí és una funció de
:math:`\log f_X(X;\theta)` (la seva derivada al quadrat o la seva  segona derivada), que a la vegada és una funció de :math:`X`.
L'esperança, per tant, es calcula respecte a :math:`X \sim f_X`.


.. nextslide::
    :increment:

En alguns casos, calcular aquesta esperança serà massa difícil (com
per exemple a l'Exercici 2 de l'entrega de Problemes), i haurem
de calcular-la de manera aproximada. És aquí on podem recórrer de nou a la `Llei dels Grans Nombres <https://atibaup.github.io/ModInfer_2020/slides/0_Intro/0_2_Intro_stats.html#25>`_,
que ens diu que per qualsevol funció :math:`g(x)` d'una variable aleatòria
:math:`Y`, i sota algunes condicions de regularitat,

.. math::

    \frac{1}{N}\sum_i g(Y_i) \to E(g(Y))


quan :math:`N \to \infty`. Per tant, si tenim una mostra gran
de :math:`X \sim f_X` (o si la podem simular), podrem aproximar:

.. math::

    I(\theta) &\approx \frac{1}{N}\sum_i \left(\frac{\partial}{\partial \theta} \log f_X(X_i;\theta)\right)^2 \\
    I(\theta) &\approx - \frac{1}{N}\sum_i \left( \frac{\partial^2}{\partial \theta^2} \log f_X(X;\theta)\right)

.. nextslide::
    :increment:

Fixeu-vos que aquesta última expressió dóna lloc a l'aproximació
que veu trobar alguns per Internet:

.. math::

    I(\theta) \approx - \frac{1}{N}\sum_i \left( \frac{\partial^2}{\partial \theta^2} \log f_X(X;\theta)\right) = \frac{1}{N}\frac{\partial^2}{\partial \theta^2} L(\theta)

quan la mostra és iid, on simplement hem aplicat la definició de :math:`L(\theta)` i
intercanviat l'ordre de l'operador suma i derivada.


Intervals aproximats per Bootstrap
---------------------------------------

L'última tècnica que veurem per calcular Intervals de Confiança
és la més potent, ja que no requereix cap suposició
pel que fa a la distribució de la mostra, i funciona en el règim no-asimptòtic.

Fixeu-vos que en el desenvolupament anterior ens hem basat (implícitament)
en que coneixiem la distribució de:

.. math::

    \Lambda = \hat{\theta} - \theta_0 \sim f_{\Lambda}(x;\theta_0)

Si coneixem :math:`f_{\Lambda}`, vol dir que també coneixem la seva f.d.c.
inversa, :math:`\phi_{\Lambda}` i per tant podem trobar Intervals
de Confiança ja que:

.. math::

    P\left( \phi_{\Lambda}\left(\frac{\alpha}{2}\right)\leq \hat{\theta} - \theta_0 \leq \phi_{\Lambda}\left(1 - \frac{\alpha}{2}\right)\right) = 1 - \alpha

En el cas asimptòtic que hem vist abans, teniem que :math:`\Lambda \approx \mathcal{N}\left(0, \frac{1}{N I(\hat{\theta})}\right)`.

.. nextslide::
    :increment:

En general, no coneixem :math:`f_{\Lambda}(x;\theta_0)` i per tant
ens quedem encallats.

El mètode de Bootstrap paramètric, el que proposa és:

1. Generar una mostra Bootstrap de talla M: :math:`\Lambda_i \sim f_{\Lambda}(x;\hat{\theta}), i=1, \cdots, M` (fixeu-vos que hem remplaçat :math:`\theta_0` per :math:`\hat{\theta}`)
2. Estimar :math:`\phi_{\Lambda}\left(\frac{\alpha}{2}\right)` i :math:`\phi_{\Lambda}\left(1 - \frac{\alpha}{2}\right)` a partir dels quantils de la mostra :math:`\Lambda_1, \cdots, \Lambda_M`

per trobar un interval de confiança aproximat:

.. math::

    P\left( \hat{\phi}_{\Lambda}\left(\frac{\alpha}{2}\right)\leq \hat{\theta} - \theta_0 \leq \hat{\phi}_{\Lambda}\left(1 - \frac{\alpha}{2}\right)\right) \approx 1 - \alpha

.. rst-class:: note

    Ens queda aclarir com generar :math:`\Lambda_i \sim f_{\Lambda}(x;\hat{\theta})`...


.. nextslide::
    :increment:

Per generar :math:`\Lambda \sim f_{\Lambda}(x;\hat{\theta})`, ho farem
de manera indirecta, ja que com hem dit en general no coneixem
:math:`f_{\Lambda}`. El que sí que coneixem, en principi, és :math:`f_X(x;\theta)`,
la f.d.p. o f.m.p de la nostra mostra.

Per tant generarem :math:`\Lambda` indirectament. Per fer-ho, repetirem :math:`M` vegades
el següent procés:

1. Generar **una** mostra bootstrap de :math:`X \sim f_X(x;\hat{\theta})` de talla N, segons el valor
:math:`\hat{\theta}` que hem trobat a partir de les nostres dades.

2. Calcularem l'EMV sobre aquesta mostra bootstrap, i l'anomenarem :math:`\hat{\theta}^*`

3. Calcularem :math:`\Lambda = \hat{\theta}^* - \hat{\theta}`

Al final d'aquest procés haurem obtingut la mostra Bootstrap de :math:`\Lambda`de talla :math:`M` i
podrem calcular-ne els quantils, per calcular l'IC aproximat que en vist en l'anterior diapo.