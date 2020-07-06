To run benchmarks

1. Install lockless from https://locklessinc.com/downloads/ in lockless_allocator path make
2. Install Hoard from https://github.com/emeryberger/Hoard in Hoard and make
4. Run `ruby make_jemallocs.rb`
5. Run `ruby make_tcmallocs.rb`  # You need to install libunwind-dev before
3. Run `ruby make_mimalloc.rb`
6. Run `ruby test_all.rb`
7. Run `STRESS_THREAD=10 ruby test_all.rb`

Results: (current)

Use `STRESS_THREADS=N` to simulate multi threaded ruby behavior

### 8 threads


```
sam@arch allocator_bench % STRESS_THREADS=8 ruby test_all.rb
ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]
built-in mem: 186336 duration: 3.422897896
built-in mem (MALLOC_ARENA_MAX=2): 135780 duration: 3.492815563
mimalloc master: 236204 duration: 2.947209624
rpmalloc master: 291428 duration: 2.823917527
tcmalloc 2.0 mem: 142860 duration: 2.796963668
tcmalloc 2.1 mem: 134952 duration: 2.9891215
tcmalloc 2.2 mem: 131860 duration: 2.965217507
tcmalloc 2.3 mem: 132268 duration: 2.992975175
tcmalloc 2.4 mem: 141756 duration: 2.817269882
tcmalloc 2.5 mem: 136376 duration: 2.763516053
tcmalloc 2.6 mem: 135892 duration: 2.837330961
tcmalloc 2.6.1 mem: 138776 duration: 2.800292649
tcmalloc 2.6.2 mem: 133392 duration: 2.785083378
tcmalloc 2.6.3 mem: 128448 duration: 2.870347233
tcmalloc 2.7 mem: 134840 duration: 2.816580265
jemalloc 3.5.1 mem: 153808 duration: 2.98163907
jemalloc 3.6.0 mem: 139564 duration: 3.122444062
jemalloc 4.0.0 mem: 151132 duration: 3.001511518
jemalloc 4.0.1 mem: 152276 duration: 3.017984175
jemalloc 4.0.2 mem: 150684 duration: 2.993723311
jemalloc 4.0.3 mem: 157552 duration: 2.955524769
jemalloc 4.0.4 mem: 153460 duration: 2.995114601
jemalloc 4.1.0 mem: 148816 duration: 2.962291218
jemalloc 4.1.1 mem: 146660 duration: 2.951603234
jemalloc 4.2.0 mem: 147800 duration: 2.956029203
jemalloc 4.2.1 mem: 148324 duration: 2.968610441
jemalloc 4.3.0 mem: 169020 duration: 3.110291342
jemalloc 4.3.1 mem: 151936 duration: 2.967231767
jemalloc 4.4.0 mem: 160780 duration: 2.977113841
jemalloc 4.5.0 mem: 158028 duration: 2.949980599
jemalloc 5.0.0 mem: 157076 duration: 3.068324983
jemalloc 5.0.1 mem: 169572 duration: 2.905734288
jemalloc 5.1.0 mem: 153852 duration: 2.925958087
jemalloc 5.2.0 mem: 162008 duration: 2.837378225
jemalloc 5.2.1 mem: 155912 duration: 2.922026484
lockless 1.4 mem: 249540 duration: 2.858882662
Hoard HEAD mem: 182500 duration: 2.988038568
```


### Single threaded

```
sam@arch allocator_bench % STRESS_THREADS=1 ruby test_all.rb
ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]
built-in mem: 169444 duration: 3.295604446
built-in mem (MALLOC_ARENA_MAX=2): 162400 duration: 3.309020006
mimalloc master: 143520 duration: 3.216014001
rpmalloc master: 158732 duration: 3.183002545
tcmalloc 2.0 mem: 137736 duration: 3.21834025
tcmalloc 2.1 mem: 138532 duration: 3.199263054
tcmalloc 2.2 mem: 171124 duration: 2.793094939
tcmalloc 2.3 mem: 140144 duration: 3.157911078
tcmalloc 2.4 mem: 169384 duration: 2.777076104
tcmalloc 2.5 mem: 169816 duration: 2.703555291
tcmalloc 2.6 mem: 172612 duration: 2.619339545
tcmalloc 2.6.1 mem: 172512 duration: 2.601444421
tcmalloc 2.6.2 mem: 144872 duration: 2.887256198
tcmalloc 2.6.3 mem: 159620 duration: 2.526488765
tcmalloc 2.7 mem: 173096 duration: 2.619000445
jemalloc 3.5.1 mem: 144348 duration: 3.04128121
jemalloc 3.6.0 mem: 144320 duration: 3.053938303
jemalloc 4.0.0 mem: 182760 duration: 3.016305146
jemalloc 4.0.1 mem: 169596 duration: 2.972724988
jemalloc 4.0.2 mem: 168892 duration: 2.928217891
jemalloc 4.0.3 mem: 168924 duration: 2.952081469
jemalloc 4.0.4 mem: 161744 duration: 2.820295919
jemalloc 4.1.0 mem: 169072 duration: 2.915838045
jemalloc 4.1.1 mem: 169064 duration: 2.949833676
jemalloc 4.2.0 mem: 179084 duration: 2.922669411
jemalloc 4.2.1 mem: 169128 duration: 2.900649117
jemalloc 4.3.0 mem: 176408 duration: 3.083000318
jemalloc 4.3.1 mem: 168748 duration: 2.90019844
jemalloc 4.4.0 mem: 168928 duration: 2.896176489
jemalloc 4.5.0 mem: 174472 duration: 2.785766161
jemalloc 5.0.0 mem: 149940 duration: 2.896406334
jemalloc 5.0.1 mem: 150204 duration: 2.837875746
jemalloc 5.1.0 mem: 148476 duration: 2.824247363
jemalloc 5.2.0 mem: 168224 duration: 2.763762322
jemalloc 5.2.1 mem: 149664 duration: 2.930834257
lockless 1.4 mem: 164468 duration: 2.873501934
Hoard HEAD mem: 174396 duration: 2.903436464
```


Results: (old)

```
sam@ubuntu allocator_bench % ruby test_all.rb
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
built-in mem: 136560 duration: 4.92845984
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Hoard HEAD mem: 167772 duration: 4.231493358
lockless 1.4 mem: 166860 duration: 3.567809758
tcmalloc 2.0 mem: 138608 duration: 3.96352459
tcmalloc 2.1 mem: 145676 duration: 3.821032815
tcmalloc 2.2 mem: 141204 duration: 3.830105653
tcmalloc 2.3 mem: 139096 duration: 3.777037605
tcmalloc 2.4 mem: 137548 duration: 3.826598715
tcmalloc 2.5 mem: 139524 duration: 3.825563646
tcmalloc 2.6 mem: 141256 duration: 3.857502124
tcmalloc 2.6.1 mem: 141500 duration: 3.778023667
tcmalloc 2.6.2 mem: 141244 duration: 3.798630141
tcmalloc 2.6.3 mem: 140320 duration: 3.824998923
tcmalloc 2.7 mem: 143192 duration: 3.726972205
jemalloc 3.0.0 mem: 141232 duration: 4.177167928
jemalloc 3.1.0 mem: 162304 duration: 3.939940393
jemalloc 3.2.0 mem: 165188 duration: 3.929158876
jemalloc 3.3.0 mem: 165164 duration: 4.135042063
jemalloc 3.3.1 mem: 153676 duration: 4.08339298
jemalloc 3.4.0 mem: 142332 duration: 4.287041471
jemalloc 3.4.1 mem: 165240 duration: 4.025545814
jemalloc 3.5.0 mem: 133892 duration: 4.065554619
jemalloc 3.5.1 mem: 165216 duration: 4.079860268
jemalloc 3.6.0 mem: 165164 duration: 4.233464591
jemalloc 4.0.0 mem: 141336 duration: 4.574956268
jemalloc 4.0.1 mem: 170944 duration: 4.248128008
jemalloc 4.0.2 mem: 177168 duration: 4.329534696
jemalloc 4.0.3 mem: 173996 duration: 3.920414509
jemalloc 4.0.4 mem: 166488 duration: 4.043237997
jemalloc 4.1.0 mem: 144080 duration: 4.084126294
jemalloc 4.1.1 mem: 140752 duration: 4.122630669
jemalloc 4.2.0 mem: 141840 duration: 4.434104776
jemalloc 4.2.1 mem: 142844 duration: 4.346471957
jemalloc 4.3.0 mem: 176972 duration: 4.883788911
jemalloc 4.3.1 mem: 142052 duration: 4.234083442
jemalloc 4.4.0 mem: 142344 duration: 4.159591159
jemalloc 4.5.0 mem: 139484 duration: 3.954587993
jemalloc 5.0.0 mem: 166592 duration: 4.013335086
jemalloc 5.0.1 mem: 173500 duration: 3.979304747
```


```
sam@ubuntu allocators % ruby test_all.rb
ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-linux]
built-in mem: 177816 duration: 5.463205008
Hoard 3.12 mem: 191836 duration: 4.526371788
lockless 1.3 mem: 196888 duration: 3.689470492
tcmalloc 2.0 mem: 177840 duration: 4.184403986
tcmalloc 2.1 mem: 178952 duration: 4.047054641
tcmalloc 2.2 mem: 180420 duration: 4.021828904
tcmalloc 2.3 mem: 179756 duration: 3.940098988
tcmalloc 2.4 mem: 168828 duration: 4.073669654
tcmalloc 2.5 mem: 171492 duration: 4.087337723
jemalloc 3.0.0 mem: 171652 duration: 4.250548191
jemalloc 3.1.0 mem: 172364 duration: 4.200444839
jemalloc 3.2.0 mem: 176748 duration: 4.249052335
jemalloc 3.3.0 mem: 177104 duration: 4.173927908
jemalloc 3.3.1 mem: 177476 duration: 4.200211943
jemalloc 3.4.0 mem: 176948 duration: 4.246032144
jemalloc 3.4.1 mem: 177436 duration: 4.334329763
jemalloc 3.5.0 mem: 177416 duration: 4.310483395
jemalloc 3.5.1 mem: 177148 duration: 4.314614055
jemalloc 3.6.0 mem: 176984 duration: 4.387391573
jemalloc 4.0.0 mem: 192256 duration: 4.594605504
jemalloc 4.0.1 mem: 185760 duration: 4.415316793
jemalloc 4.0.2 mem: 191228 duration: 4.264772339
jemalloc 4.0.3 mem: 192276 duration: 4.406336821
jemalloc 4.0.4 mem: 193844 duration: 4.292252613
jemalloc 4.1.0 mem: 184900 duration: 4.185297596
jemalloc 4.1.1 mem: 185212 duration: 4.174412318
jemalloc 4.2.0 mem: 185148 duration: 4.142911436
jemalloc 4.2.1 mem: 189636 duration: 4.116592894
jemalloc 4.3.0 mem: 230164 duration: 7.376474329
jemalloc 4.3.1 mem: 186060 duration: 4.103093871
jemalloc 4.4.0 mem: 182524 duration: 4.137382241
```
