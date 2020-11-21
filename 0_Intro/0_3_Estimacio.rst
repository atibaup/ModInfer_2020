=================================================
Tema 3: Estimació
=================================================

Estimació per Màxima Versemblança
=================================================

Ajust de distribucions de probabilitat
---------------------------------------

Recordem de l'exemple que `vam veure
a la primera classe <https://e-aules.uab.cat/2020-21/pluginfile.php/695686/mod_page/content/2/motivacio_tema_3.pdf>`_
que en molts problemes de modelització estadística,
partim d'un conjunt de dades que podem modelar com
una mostra iid. d'una població:

:math:`X_i \sim f_X(x,\theta), i=1,\cdots,N`

on :math:`f_X` és una f.d.p. d'una família de distribucions
i :math:`\theta` són els paràmetres de la mateixa (vector o escalar), també anomenats
*paràmetres de la població*.

.. rst-class:: note

    El problema d'*estimació dels paramètres* o d'*ajust de la distribució* a partir de les dades
    consisteix en estimar :math:`\theta` a partir de :math:`X_1, \cdots, X_N`.

.. nextslide::
    :increment:

Tal i com vam veure a la primera classe, un mètode
d'estimació molt versàtil és el de **Màxima Versemblança**.

Per començar, definim la *log-versemblança*:

.. math::

    L(\theta; x_1, \cdots, x_N) = \log \left(f_{X_1, \cdots, X_N}(x_1, \cdots, x_N; \theta) \right)

on :math:`f_{X_1, \cdots, X_N}(x_1, \cdots, x_N; \theta)` és la
f.d.p. conjunta de la mostra.

En el cas d'una mostra iid, la log-versemblança es simplifica:

.. math::

    L(\theta; x_1, \cdots, x_N) = \sum_{i=1}^N \log f_X(x_i;\theta)


.. rst-class:: note

    Per mostres discretes, la log-versemblança es calcula a partir de la f.m.p. conjunta :math:`p_{X_1, \cdots, X_N}(x_1, \cdots, x_N; \theta)`
    enlloc de la f.d.c.
`

.. nextslide::
    :increment:

Fixeu-vos que donada una mostra en particular :math:`X_1=x_1, \cdots, X_N=x_n`,
:math:`L(\theta; x_1, \cdots, x_N)` és un funció de :math:`\theta \in \Theta \to \mathbb{R}`.

Com vam veure als exemples de la primera classe, aquesta funció es pot interpretar com una mesura de la
qualitat de :math:`\theta` a l'hora d'*explicar* les dades
observades.

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

    Malgrat aquestes limitacions, s'ha de reconèixer que la Màxima Versemblança
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
i hi ha M caselles i :math:`\sum_i X_i = N`. **Important**: Noteu que en aquest cas :math:`X_i` no és iid!

El model *multinomial* assumeix que la f.d.m. conjunta de :math:`X_1, \cdots, X_M`
vé donada per:

.. math::

    p(x_1, \cdots, x_m; p_1, \cdots, p_M) = \frac{N!}{\Pi_i {x_i!}}\Pi_i p_i^{x_i}

on :math:`p_1, \cdots, p_M` són els paràmetres de la població, tals que :math:`\sum_i p_i = 1`.

.. nextslide::
    :increment:

A partir d'aquesta f.d.m conjunta, i una mostra :math:`X_1=x_1, \cdots, X_M=x_m`
podem calcular la log-versemblança:

.. math::

    L( p_1, \cdots, p_M; x_1, \cdots, x_m) \propto - \sum_i \log (x_i!) + \sum_i x_i \log p_i

(on ignorem els termes que no depènen d':math:`x_i` o :math:`p_i`.

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
de pacients morts (i que per tant hem pogut observar-ne l'edat de defunció)
i :math:`\bar{\mathcal{M}}` el subconjunt de pacients vius.

La funció de log-versemblança
que utilitzarem en aquest cas és:

.. math::

    L(\theta) = \log P\left( \cap_{i: \mathcal{M}}{ X_i=x_i} \cap \cap_{i: \bar{\mathcal{M}}}{ X_i \geq e_i} \right)

Si la mostra és iid, això es simplificarà a:

.. math::

    L(\theta) = \sum_{i: \mathcal{M}}\log p_X(x_i; \theta) + \sum_{i: \bar{\mathcal{M}}} \log(1 -  F_X(e_i; \theta))

on :math:`p_X(x_i; \theta)` és la f.m.p. del nostre model d'edat de defunció i :math:`F_X(e_i; \theta)` n'és la f.d.c. corresponent.

.. nextslide::
    :increment:

Suposem que modelem l'edat de defunció dels pacients segons una llei geomètrica:

.. math::

    p_X(x; \rho) = (1 - \rho)^{x - 1} \rho

on :math:`\rho` és el paràmetre de la població. La f.d.c. és :math:`F_x(x ;\rho) = 1 - (1 -\rho)^x `
i per tant podem calcular la log-versemblança com:

.. math::

    L(\rho) =

Exercici: Calcular :math:`\hat{\rho} = \arg \max  L(\rho)`


Propietats asimptòtiques de l'EMV
=================================================

Biaix, Variança, EQM, Consistència
---------------------------------------

Recordem del Tema 2 que els estimadors solen
ser funcions d'una mostra aleatòria, i que per tant
son en ells mateixos v.a.´s.

Per caracteritzar-los, doncs, haurem de fer servir
les eines que vem desenvolupar al Tema 2:

- **Biaix**: :math:`E`
- Variança
- Error Quadràtic Mitjà

.. rst-class:: note

    Quan l'EMV es correspon amb algun dels moments mostrals, com és el cas
    dels EMVs per una família Gaussiana, de Poisson o Multinomial, podem
    fer servir la teoria que vem derivar al Tema 2 per calcular-ne les propietats.


.. nextslide::
    :increment:

En general, però, l'EMV no tindra una forma analítica coneguda,
i serà difícil calcular-ne l'esperança, i molt més difícil
caracteritzar-ne la distribució.

La gran avantatge dels EMV és que, asimptòticament,
es poden caracteritzar bastant fàcilment.

Primer definim què és el que volem dir per "asimptòtic".


.. nextslide::
    :increment:



Eficiència i Cota de Cramer-Rao
---------------------------------------


Intervals de confiança per EMVs
=================================================

Intervals asimptòtics
---------------------------------------

Bootstrap paramètric
---------------------------------------