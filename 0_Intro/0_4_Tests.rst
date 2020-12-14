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
* El conjunt  :math:`T \leq T_0` s'anomena **regió d'acceptació del test**, el complementari és la **regió crítica**.


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

* :math:`H_0`: :math:`\rho_X \leq 0.01`, és a dir el fabricant ens diu la veritat
* :math:`H_1`: :math:`\rho_X > 0.01`, és a dir el fabricant ens ha mentit
* **La regió crítica**: :math:`T > T_0` on rebutjem :math:`H_0`
* **L'Error de Tipus I**: L'estadístic ens dona :math:`T > T_0` però :math:`\rho_X \leq 0.01`.
* **L'Error de Tipus II**: L'estadístic ens dona :math:`T \leq T_0` però :math:`\rho_X > 0.01`.

Normalment primer escollirem un nivell de significació :math:`\alpha`, i a partir del mateix
escollirem :math:`T_0` de manera que:

.. math::

    P(T > T_0 ; H_0) = \alpha

Això determinarà implícitament la potència del test :math:`1 - \beta = P(T > T_0 ; H_1)`.

.. rst-class:: note

    Fixeu-vos que hi ha una "asimetria" entre l'hipòtesi nula i l'alternativa, i que això ho escull el practicant...


.. nextslide:: Al nostre exemple inicial (II):

Per trobar el valor crític amb una significació de :math:`\alpha=0.05`,
simularem :math:`Y \sim \mbox{Geomètrica}(1 - (1-\rho_X)^K)` amb :math:`\rho_X=0.01`,
i buscarem :math:`T_0` tal que :math:`P(T > T_0 ; H_0) = \alpha = 0.05`:


.. image::  /_static/0_Intro/geom_at_alpha.png
    :height: 300px
    :align: center


.. rst-class:: note

    Fixeu-vos que per tenir una significació de :math:`\alpha=0.05`, només podrem
    rebutjar l'hipòtesi Nula si :math:`\hat{\rho}_x > 0.022`! (això és en part perquè en el nostre exemple N=10).

.. nextslide:: Exercici contemporani:


Considereu els tests PCR que es fan per detectar la COVID-19.

* Quina seria :math:`H_0`? I :math:`H_1`?
* Què és un fals positiu? I un fals negatiu?
* Què és pitjor, un fals positiu? o un fals negatiu?
* Quin és l'estadístic del test?
* Quina creieu que és la regió crítica del test?
* Què creieu que vol dir que els tests PCR tenen "alta sensibilitat"?


Test de Raó de Versemblances
---------------------------------------

El paradigma que hem explicat fins ara ens guia per escollir
el valor crític :math:`T_0` quan ja tenim un estadístic de test :math:`T` (
a l'exemple, :math:`\hat{\rho}_X - 0.01`)
sobre el que treballar, i una idea sobre quina hauria de ser
la regió crítica (a l'exemple :math:`T > T_0`).

El següent Lemma estableix com construïr tests òptims per **hipòtesis simples**, és a dir
hipòtesis definides a partir del paràmetre :math:`\theta` d'una població:

* :math:`H_0: \theta = \theta_0`
* :math:`H_1: \theta = \theta_1`

.. rst-class:: note

    **Lema 4.1 (de Neyman-Pearson, 1933)**: Per una mostra :math:`X_1, \cdots, X_N` i :math:`H_0` i :math:`H_1`
    hipòtesis simples, el test de raó de versemblances :math:`T = \frac{f_X(X_1, \cdots, X_N; \theta_0)}{f_X(X_1, \cdots, X_N; \theta_1)}`
    amb regió crítica :math:`T < T_0` tal que la significació és :math:`\alpha`, és el test amb més potència amb nivell de significació :math:`\alpha`.


.. nextslide:: Exemple d'aplicació: detecció per infra-rojos

Considereu una mostra iid :math:`X_1, \cdots, X_N` **normal** i de variança coneguda :math:`\sigma_2`,
obtinguda a partir de les mesures d'un sensor de detecció d'infra-rojos. Quan davant del sensor
hi ha un objecte, es mesura una senyal amb mitja :math:`\mu_1`, quan no, amb :math:`\mu_0`.
Volem determinar si durant el periode d'observació de la mostra, hi havia un objecte o no:

* :math:`H_0`: no hi ha cap objecte, :math:`\mu = \mu_0`
* :math:`H_1`: n'hi ha un, :math:`\mu = \mu_1`

Com que es tracta d'hipòtesis simples, per Neyman-Pearson farem servir el test de raó de versemblances:

.. math::

    T &= \frac{f_X(X_1, \cdots, X_N; \theta_0)}{f_X(X_1, \cdots, X_N; \theta_1)} \\
      &= \frac{\exp\left(-\frac{1}{2\sigma^2}\sum_i \left(X_i - \mu_0 \right)^2 \right)}{\exp\left(-\frac{1}{2\sigma^2}\sum_i \left(X_i - \mu_1 \right)^2 \right)} \\


.. nextslide::
    :increment:

.. math::

    T &= \exp\left(-\frac{1}{2\sigma^2}\left(\sum_i \left(X_i - \mu_0 \right)^2 - \sum_i \left(X_i - \mu_1 \right)^2 \right)\right) \\
      &= \exp\left(-\frac{1}{2\sigma^2}\left(2N\bar{X}(\mu_0 - \mu_1) + N \mu_1^2 - N \mu_0^2\right)\right)

Ens queda només trobar :math:`T_0` tal que :math:`P(T < T_0; \mu_0) = \alpha`.
Com que :math:`T` només depèn de la mostra a través de :math:`\bar{X}`, la regió crítica
es pot expressar en funció d':math:`\bar{X}`:

.. math::

    \left\{T < T_0 \right\} &= \left\{2\bar{X}(\mu_0 - \mu_1) + \mu_1^2 - \mu_0^2 > \frac{2 \sigma^2\log(T_0)}{N} \right\} \\
   & = \left\{\bar{X}(\mu_0 - \mu_1) > X_0\right\}

és a dir, enlloc de buscar :math:`T_0` tal que :math:`P(T < T_0; \mu_0) = \alpha`,
buscarem directament :math:`X_0` tal que :math:`P(\bar{X}(\mu_0 - \mu_1) > X_0; \mu_0) = \alpha`.


