=================================================
Tema 4: Tests d'hipòtesis
=================================================

Raó de Versemblances i Neyman-Pearson
=================================================

Exemple de motivació
---------------------------------------

Començarem considerant un dels exemples que
vam veure al Tema 2:

- Tenim un circuit integrat per K components en sèrie
- El fabricant dels components ens assegura que cada component té una proba diària de fallar :math:`\rho_X < 0.01`

Durant els nostres experiments de control de qualitat, observem
que el circuit falla després  de 57, 49, 8, 234, 4, 181, 153,22,  91,  11 dies.

.. rst-class:: note

    Està respectant el fabricant de components la garantia?

.. nextslide::
    :increment:

Al Tema 2, vem aprendre que :math:`Y`, el temps de vida del circuit,
seguia una distribució geomètrica amb paràmetre :math:`\rho_Y = 1 - (1-\rho_X)^K`,
i vem derivar-ne l'EMV:

.. math::

    \hat{\rho}_Y = \frac{N}{\sum_i y_i}

Apartir d'això vam estimar:

.. math::

    \hat{\rho}_X = 1 - (1 - \hat{\rho}_Y)^\frac{1}{K} \approx 0.001

i vam concloure que el fabricant estava respectant la garantia, ja que :math:`\hat{\rho}_X \ll 0.01`.


.. rst-class:: note

    Però què decidirieu si ens hagués sortit :math:`\hat{\rho}_X \approx 0.01`? O :math:`\hat{\rho}_X \approx 0.008`?

.. nextslide::
    :increment:

De la teoria del Tema 2, sabem que l'EMV :math:`\hat{\rho}_Y` és
una quantitat aleatòria, i per tant :math:`\hat{\rho}_X` també. Per
exemple, vegem la distribució de :math:`\hat{\rho}_X` quan :math:`\rho_X=0.008`:

.. image::  /_static/0_Intro/geom_null.png
    :height: 250px
    :align: center

.. rst-class:: note

    Quan :math:`\rho_X = 0.008`, :math:`P(\hat{\rho}_X > 0.01; \rho_X = 0.008) \approx 37\%`! Si
    :math:`\rho_X = 0.0001`, aquesta probabilitat és més petita, però no és nula. Això és
    degut a l'error d'estimació (l'EMV és consistent asimptòticament, però estem treballant amb mostres finites!).
    Això s'anomena un **Fals Positiu**.


.. nextslide::
    :increment:

Per altra banda, suposem que :math:`\rho_X = 0.02` (2x més gran que 1%).
Degut a l'aleatorietat de :math:`\hat{\rho}_X`, també
tindrem una probabilitat no nula de que :math:`\hat{\rho}_X < 0.01`:

.. image::  /_static/0_Intro/geom_H1.png
    :height: 250px
    :align: center

.. rst-class:: note

    Decidir que, en base a les observacions, :math:`\rho_X < 0.01` quan en realitat :math:`\rho_X > 0.01` s'anomena un **Fals Negatiu**.


.. nextslide::
    :increment:

Malgrat aquestes dues observacions, la intuició ens diu que si
:math:`\hat{\rho}_X` és molt més petit que :math:`\rho_c = 0.01`,
o de manera equivalent, :math:`T := \hat{\rho}_X - \rho_c` és prou
petit, hauriem de poder afirmar que :math:`\rho_X` és efectivament
més petit que 0.01 i per tant el fabricant està complint la garantia.

Ja podem definir alguns conceptes claus:

* :math:`T` s'anomena **l'estadístic del test**, que calculem a partir de la mostra (en aquest exemple depèn de :math:`\hat{\rho}_X`)
* El valor :math:`T_0` contra el que comparem :math:`T` per tal de prendre una decisió, s'anomena **valor crític**.
* En el nostre exemple, el conjunt :math:`T \leq T_0` és la **regió d'acceptació del test**, el complementari n'és la **regió crítica**.


.. rst-class:: note

    Quan escollim :math:`T_0`, determinem implícitament
    la quantitat de Falsos Positius i Falsos Negatius que tindrem. En **aquest exemple**, quan més gran :math:`T_0`, menys
    "estricte" és el nostre criteri, i per tant més Falsos Positius i menys Falsos Negatius. Quan més petit, a l'inversa.


El paradigma de Neyman-Pearson i Fisher
---------------------------------------

La intuició que estem fent servir sembla raonable però ens falta una manera quantitativa
d'escollir quan :math:`T` és "prou petit" o no (és a dir, escollir el valor crític :math:`T_0`.)
El paradigma que utilitzarem ens permetrà fer això. Però primer haurem de definir una sèrie de conceptes:

* **L'Hipòtesis Nula** (:math:`H_0`): És l'hipòtesi sobre **el model estadístic** que volem contrastar/refutar
* **L'Hipòtesis Alternativa** (:math:`H_1`): És l'alternativa de l'hipòtesi nula (no necessàriament complementària!)
* **L'Error de Tipus I** o Fals Positiu: Quan el nostre test refusa :math:`H_0` quan aquesta és certa
* **L'Error de Tipus II** o Fals Negatiu: Quan el nostre test accepta :math:`H_0` quan :math:`H_1` és certa
* :math:`\alpha = P(\mbox{refusar } H_0 ; H_0)`: el **nivell de significació** o probabilitat d'Error de Tipus I
* :math:`\beta = P(\mbox{acceptar } H_0 ; H_1)`: la probabilitat d'Error de Tipus II
* **La potència del test** (*power*): :math:`1 - \beta`, la probabilitat :math:`P(\mbox{refusar } H_0 ; H_1)`.

.. nextslide::
    :increment:

Per tant, per especificar un test i caracteritzar-lo, necessitarem especificar :math:`H_0`,
:math:`H_1`, i la regió crítica...

* Fixeu-vos que, intuitivament, hi ha una tensió entre :math:`\alpha` i :math:`1- \beta`.
* En teoria, el test ideal és el que té :math:`\alpha=0` i :math:`1 - \beta = 1`, és a dir no fa cap fals positiu ni cap fals negatiu.
* A la pràctica el test ideal no existeix, i ens conformarem amb els tests que, donat :math:`\alpha`, tenen millor potència.

.. nextslide:: Al nostre exemple inicial:

* :math:`H_0`: :math:`\rho_X - \rho_c \leq 0`, és a dir el fabricant ens diu la veritat (recordeu :math:`\rho_c:=0.01`)
* :math:`H_1`: :math:`\rho_X - \rho_c > 0`, és a dir el fabricant ens ha mentit
* **La regió crítica**: :math:`T > T_0` on rebutjem :math:`H_0`
* **L'Error de Tipus I**: L'estadístic ens dona :math:`T > T_0` però :math:`\rho_X \leq 0.01`.
* **L'Error de Tipus II**: L'estadístic ens dona :math:`T \leq T_0` però :math:`\rho_X > 0.01`.

Normalment primer escollirem un nivell de significació :math:`\alpha`, i a partir del mateix
escollirem :math:`T_0` de manera que:

.. math::

    P(T > T_0 ; H_0) = \alpha

Això determinarà implícitament la potència del test :math:`1 - \beta = P(T > T_0 ; H_1)`.

.. rst-class:: note

    Fixeu-vos que hi ha una "asimetria" entre :math:`H_0` i :math:`H_1`, i que les escull el practicant...


.. nextslide:: Al nostre exemple inicial (II):

Per trobar el valor crític amb una significació de :math:`\alpha=0.05`,
simularem :math:`Y \sim \mbox{Geomètrica}(1 - (1-\rho_X)^K)` amb :math:`\rho_X=0.01`,
i buscarem :math:`T_0` tal que :math:`P(T > T_0 ; H_0) = \alpha = 0.05`:


.. image::  /_static/0_Intro/geom_at_alpha.png
    :height: 280px
    :align: center


.. rst-class:: note

    Fixeu-vos que per tenir una significació de :math:`\alpha=0.05`, només podrem
    rebutjar l'hipòtesi Nula si :math:`\hat{\rho}_x > 0.022`!
    (això és en part perquè en el nostre exemple N=10, i degut això la variança del nostre estimador és gran).

.. nextslide:: Exercici contemporani:


Considereu els tests PCR que es fan per detectar la COVID-19.

* Quina seria :math:`H_0`? I :math:`H_1`?
* Què és un fals positiu? I un fals negatiu?
* Què és pitjor, un fals positiu? o un fals negatiu?
* Quin és l'estadístic del test?
* Quina creieu que és la regió crítica del test?
* Què creieu que vol dir que els tests PCR tenen "alta sensibilitat"?


Test de Raó de Versemblances (RV)
---------------------------------------

El paradigma que hem explicat fins ara ens guia per escollir
el valor crític :math:`T_0` quan ja tenim un estadístic de test :math:`T` (
a l'exemple, :math:`T = \hat{\rho}_X - 0.01`)
sobre el que treballar, i una idea sobre quina hauria de ser
la regió crítica (a l'exemple :math:`T > T_0`).

El següent Lemma estableix com construïr tests òptims per **hipòtesis simples**, és a dir
hipòtesis definides a partir del paràmetre :math:`\theta` d'una població caracteritzada
per una f.d.p o f.m.p  :math:`f_X(x;\theta)`:

* :math:`H_0: \theta = \theta_0`
* :math:`H_1: \theta = \theta_1`

.. rst-class:: note

    **Lema 4.1 (de Neyman-Pearson, 1933)**: Per una mostra :math:`X_1, \cdots, X_N` i :math:`H_0` i :math:`H_1`
    hipòtesis simples, el test basat en l'estadístic de raó de versemblances :math:`T = \frac{f(X_1, \cdots, X_N; \theta_0)}{f(X_1, \cdots, X_N; \theta_1)}`
    amb regió crítica :math:`T < T_0` i significació :math:`\alpha`, és el test amb més potència amb nivell de significació :math:`\alpha`.


.. nextslide:: Interpretació de la raó de versemblances

Fixeu-vos que la versemblança d'una mostra:

.. math::

    f(X_1, \cdots, X_N; \theta)

és més gran quan més versemblant és que la mostra :math:`X_1, \cdots, X_N` hagi estat generada
per el paràmetre :math:`\theta`. (Aquest és el mateix principi que vam fer servir per justificar
el Mètode de Màxima Versemblança per estimar :math:`\theta` a partir de :math:`X_1, \cdots, X_N`).

Per tant, si l'evaluem a dos valors diferents de :math:`\theta`, :math:`\theta_0` i :math:`\theta_1`,
:math:`f_X(X_1, \cdots, X_N; \theta)` hauria de ser més gran per aquell valor
que és més versemblant segons les dades. En conseqüència, l'estadístic

.. math::

    T = \frac{f(X_1, \cdots, X_N; \theta_0)}{f(X_1, \cdots, X_N; \theta_1)}

serà gran quan :math:`\theta_0` és més versemblant que :math:`\theta_1` i petita
en el cas contrari. Això justifica que refusem l'hipòtesi nula
:math:`\theta=\theta_0` quan :math:`T < T_0` per algun :math:`T_0` a escollir.


Exemple d'aplicació: detecció per infra-rojos
-----------------------------------------------

Considereu una mostra iid :math:`X_1, \cdots, X_N` **normal** i de variança coneguda :math:`\sigma^2`,
obtinguda a partir de les mesures d'un sensor de detecció d'infra-rojos. Quan davant del sensor
hi ha un objecte, es mesura una senyal amb mitja :math:`\mu_1`, quan no, amb :math:`\mu_0`.

Volem determinar si durant el periode d'observació de la mostra, hi havia un objecte o no:

* :math:`H_0`: no hi ha cap objecte, :math:`\mu = \mu_0`
* :math:`H_1`: n'hi ha un, :math:`\mu = \mu_1`

(dibuixet)

.. nextslide:: Exemple d'aplicació: detecció per infra-rojos (II)

Com que es tracta d'hipòtesis simples, segons el Lema 4.1 de Neyman-Pearson
és òptim fer servir el test de raó de versemblances. L'estadístic és:

.. math::

    T &= \frac{f_X(X_1, \cdots, X_N; \mu_0)}{f_X(X_1, \cdots, X_N; \mu_1)} = \frac{\exp\left(-\frac{1}{2\sigma^2}\sum_i \left(X_i - \mu_0 \right)^2 \right)}{\exp\left(-\frac{1}{2\sigma^2}\sum_i \left(X_i - \mu_1 \right)^2 \right)} \\
      &= \exp\left(-\frac{1}{2\sigma^2}\left(\sum_i \left(X_i - \mu_0 \right)^2 - \sum_i \left(X_i - \mu_1 \right)^2 \right)\right) \\
      &= \exp\left(-\frac{N}{2\sigma^2}\left(2\bar{X}(\mu_0 - \mu_1) + \mu_1^2 - \mu_0^2\right)\right)

.. rst-class:: note

    Fixeu-vos doncs que :math:`T` depèn únicament de la mostra a través de :math:`\bar{X}`.
    Per exemple, si :math:`\mu_0 > \mu_1`, :math:`T` és petit si :math:`\bar{X}` és petit,
    per tant rebutjarem :math:`H_0` si :math:`\bar{X}` és petita.

.. nextslide:: Exemple d'aplicació: detecció per infra-rojos (III)

Ens queda només trobar el valor crític :math:`T_0` tal que :math:`P(T < T_0; \mu_0) = \alpha`.

Com que :math:`T` només depèn de la mostra a través d'una funció monotònica d' :math:`\bar{X}`, la regió crítica
es pot expressar en funció d':math:`\bar{X}`:

.. math::

    \left\{T < T_0 \right\} &= \left\{ \log T < \log T_0 \right\} \\
   & = \left\{2\bar{X}(\mu_0 - \mu_1) + \mu_1^2 - \mu_0^2 > \frac{2 \sigma^2\log(T_0)}{N} \right\} \\
   & = \left\{\bar{X} > X_0\right\} \mbox{ (si } \mu_0 > \mu_1 \mbox{ )}

per :math:`X_0 = \frac{1}{2\left(\mu_0 - \mu_1\right)}\left(\frac{2 \sigma^2\log(T_0)}{N} + \mu_0^2 - \mu_1^2 \right)`.

Es a dir, enlloc de buscar :math:`T_0` tal que :math:`P(T < T_0; \mu_0) = \alpha`,
buscarem directament :math:`X_0` tal que :math:`P(\bar{X} > X_0; \mu_0) = \alpha`.


.. nextslide:: Exemple d'aplicació: detecció per infra-rojos (IV)

Per continuar, fixem-nos que sota
:math:`H_0`, :math:`X_1, \cdots, X_N \sim \mathcal{N}(\mu_0, \sigma^2)` per tant
[`Diapo 29, Tema 2 <https://atibaup.github.io/ModInfer_2020/slides/0_Intro/0_2_Intro_stats.html#29>`_]:

.. math::

    \bar{X} \sim \mathcal{N}(\mu_0, \frac{\sigma^2}{N}).

Podem doncs trobar :math:`X_0` manipulant l'expressió de significació:

.. math::

    P(\bar{X} > X_0; \mu_0) &= \alpha \\
    P(\frac{\bar{X} - \mu_0}{\sqrt{\frac{\sigma^2}{N}}} > \frac{X_0 - \mu_0}{\sqrt{\frac{\sigma^2}{N}}}; \mu_0) &= \alpha

on tenim que :math:`\frac{\bar{X} - \mu_0}{\sqrt{\frac{\sigma^2}{N}}} \sim \mathcal{N}(0, 1)`.


.. nextslide:: Exemple d'aplicació: detecció per infra-rojos (V)


Així doncs, només caldrà trobar :math:`X_0` tal que:

.. math::

     \frac{X_0 - \mu_0}{\sqrt{\frac{\sigma^2}{N}}} = 1 - \phi\left(\alpha\right)

on :math:`\phi(x)` és la f.d.c. inversa d'una normal estàndard. Finalment:

.. math::

    X_0 = \mu_0 + \sqrt{\frac{\sigma^2}{N}}\left(1 - \phi(\alpha)\right)

i per tant (en el cas on :math:`\mu_0 > \mu_1`) rebutjarem
l'hipòtesi nula quan :math:`\bar{X} < \mu_0 + \sqrt{\frac{\sigma^2}{N}}\left(1 - \phi(\alpha)\right)`

.. rst-class:: note

    **Exercici**: Quin valor crític :math:`X_0` i regió crítica tindriem si
    enlloc de :math:`\mu_0 > \mu_1` tenim que :math:`\mu_0 \leq \mu_1`?


Test de Raó de Versemblances Generalitzada (RVG)
-----------------------------------------------

El test de Raó de Versemblances té propietats teòriques interessants (Lema 4.1.)
però és d'aplicació pràctica limitada, ja que en general, les nostres
hipòtesis seràn compostes, és a dir, del tipus:


* :math:`H_0: \theta \in \Theta_0`
* :math:`H_1: \theta \in \Theta_1`

on :math:`\Theta_0` i :math:`\Theta_1` són subconjunts de :math:`\Theta` i
per tant el test de Raó de Versemblances no és aplicable.

Per exemple, el nostre exemple inicial es tractava d'hipòtesis compostes:

* :math:`\Theta_0 = \left\{\rho_X \leq 0.01 \right\}`
* :math:`\Theta_1 = \left\{\rho_X > 0.01 \right\}`


.. nextslide::
    :increment:

Donada una mostra :math:`X_1, \cdots, X_N`
d'una població amb f.d.p. :math:`f_X`, i versemblança
:math:`f(X_1, \cdots, X_N; \theta)`, el Test de Raó de Versemblances Generalitzat, es basa en el següent estadístic:

.. math::

    \Lambda = \frac{\max_{\theta \in \Theta_{0}} f(X_1, \cdots, X_N; \theta)}{\max_{\theta \in \Theta} f(X_1, \cdots, X_N; \theta)}

amb regió crítica:

.. math::

    \Lambda \leq \lambda_0

i :math:`\lambda_0` tal que:

.. math::

    P(\Lambda \in \lambda_0; \theta_0) = \alpha, \forall \theta_0 \in \Theta_0


.. rst-class:: note

    Per evaluar l'estadístic del test d'RVG, cal doncs trobar l'EMV sota cada una de les hipòtesis


Exemple d'aplicació: test sobre la mitja d'una Gaussiana amb variança coneguda
----------------------------------------------------------------------------------------

Considereu una mostra iid :math:`X_1, \cdots, X_N` **normal** i
de variança coneguda :math:`\sigma^2`.

Volem testejar si la mitja de la població és un valor donat :math:`\mu_0` o no.
Les hipòtesis son doncs:

* :math:`H_0: \mu= \mu_0` (simple)
* :math:`H_1: \mu \neq \mu_0` (composta)


.. rst-class:: note

    Podeu pensar en una situació pràctica on voldriem testejar aquesta hipòtesi?


.. nextslide::
    :increment:

Com que l'hipòtesis nula és simple, en aquest exemple, l'estadístic del test RVG és:

.. math::

    \Lambda = \frac{f(X_1, \cdots, X_N; \mu_0)}{\max_{\mu \in \Theta} f(X_1, \cdots, X_N; \mu)}


Per tant haurem de trobar l'EMV (:math:`\max_{\theta \in \Theta} f(X_1, \cdots, X_N; \theta)`)
per calcular-lo. Però al tractar-se d'una mostra normal, ja sabem que l'EMV
de la mitja :math:`\mu` és simplement la mitjana aritmètica de la mostra:

:math:`\hat{\mu} = \bar{X}`

Per tant en aquest exemple l'estadístic es simplifica a:

.. math::

    \Lambda = \frac{f(X_1, \cdots, X_N; \mu_0)}{f(X_1, \cdots, X_N; \bar{X})} = \frac{\Pi_i f_X(X_i; \mu_0)}{\Pi_i f_X(X_i; \bar{X})}

on :math:`f_X` és la f.d.p d'una Gaussiana.

.. nextslide:: Exemple d'aplicació: test sobre la mitja d'una Gaussiana amb variança coneguda (III)


Al numerador tindrem

:math:`\frac{1}{\left(\sqrt{2\pi\sigma^2}\right)^N}\exp\left(-\frac{1}{2\sigma^2}\sum_i(X_i - \mu_0)^2 \right)`

i al denominador

:math:`\frac{1}{\left(\sqrt{2\pi\sigma^2}\right)^N}\exp\left(-\frac{1}{2\sigma^2}\sum_i(X_i - \bar{X})^2 \right)`

Per tant, trobarem:

.. math::

    \Lambda = \exp\left(-\frac{1}{2\sigma^2}\left[\sum_i(X_i - \mu_0)^2 - \sum_i(X_i - \bar{X})^2\right] \right)


.. nextslide:: Exemple d'aplicació: test sobre la mitja d'una Gaussiana amb variança coneguda (IV)

Amb una mica d'àlgebra, això es pot simplicar a

.. math::

    \Lambda = \exp\left(-\frac{N}{2\sigma^2}\left(\bar{X} - \mu_0\right)^2  \right)

per tant la regió crítica serà:

.. math::

    \left\{\Lambda: \Lambda \leq \lambda_0\right\} &= \left\{\bar{X}: \exp\left(-\frac{N}{2\sigma^2}\left(\bar{X} - \mu_0\right)^2  \right) \leq \lambda_0 \right\} \\
    & = \left\{\bar{X}: \left(\frac{\bar{X} - \mu_0}{\sqrt{\frac{\sigma^2}{N}}}\right)^2  > - 2 \log \lambda_0\right\} \\


.. nextslide::
    :increment:

arribem a:

.. math::

    \left\{\Lambda: \Lambda \leq \lambda_0\right\}  = \left\{\bar{X}: \left| \frac{\bar{X} - \mu_0}{\sqrt{\frac{\sigma^2}{N}}}\right|  > \sqrt{- 2 \log \lambda_0 } \right\}

És a dir, rebutjarem :math:`H_0` quan la diferència entre :math:`\bar{X}` i :math:`\mu_0` sigui prou gran.

De nou, com que la mostra es Gaussiana, :math:`\frac{\bar{X} - \mu_0}{\sqrt{\frac{\sigma^2}{N}}} \sim \mathcal{N}(0, 1)` i per tant
podem trobar el valor crític :math:`\lambda_0` com segueix:


.. math::

    P(\Lambda \leq \lambda_0; \mu_0) &= \alpha \\
    P(\sqrt{- 2 \log \lambda_0 } \leq \frac{\bar{X} - \mu_0}{\sqrt{\frac{\sigma^2}{N}}} \leq  \sqrt{- 2 \log \lambda_0 }; \mu_0) &= \alpha

Per tant:


.. math::

    \sqrt{- 2 \log \lambda_0 } = \phi(\frac{\alpha}{2})


Exemple d'aplicació: test sobre la mitja d'una Gaussiana amb variança desconeguda
----------------------------------------------------------------------------------------

