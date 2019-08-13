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


```
allocator_bench % STRESS_THREADS=1 ruby test_all.rb
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]
built-in mem: 168956 duration: 3.088811037
built-in mem (MALLOC_ARENA_MAX=2): 168732 duration: 3.118196841
mimalloc master: 148968 duration: 2.971000958
rpmalloc master: 150048 duration: 3.158120957
tcmalloc 2.0 mem: 139376 duration: 2.949512014
tcmalloc 2.1 mem: 139804 duration: 2.864627799
tcmalloc 2.2 mem: 140500 duration: 2.8446297
tcmalloc 2.3 mem: 139568 duration: 2.916504693
tcmalloc 2.4 mem: 173760 duration: 2.59109293
tcmalloc 2.5 mem: 140044 duration: 2.887631572
tcmalloc 2.6 mem: 144024 duration: 2.892587755
tcmalloc 2.6.1 mem: 143464 duration: 2.815790592
tcmalloc 2.6.2 mem: 143308 duration: 2.801355854
tcmalloc 2.6.3 mem: 143412 duration: 2.79778578
tcmalloc 2.7 mem: 142372 duration: 2.865414789
jemalloc 3.0.0 mem: 143936 duration: 2.854970272
jemalloc 3.1.0 mem: 119240 duration: 2.87959642
jemalloc 3.2.0 mem: 144176 duration: 2.893079291
jemalloc 3.3.0 mem: 144424 duration: 2.874652414
jemalloc 3.3.1 mem: 144432 duration: 2.979426346
jemalloc 3.4.0 mem: 136196 duration: 3.194614895
jemalloc 3.4.1 mem: 136192 duration: 3.163906766
jemalloc 3.5.0 mem: 136252 duration: 3.200070938
jemalloc 3.5.1 mem: 136164 duration: 3.136768047
jemalloc 3.6.0 mem: 136212 duration: 3.115268106
jemalloc 4.0.0 mem: 171064 duration: 2.765127381
jemalloc 4.0.1 mem: 169512 duration: 2.809184624
jemalloc 4.0.2 mem: 169300 duration: 2.710827099
jemalloc 4.0.3 mem: 177484 duration: 2.798859274
jemalloc 4.0.4 mem: 150356 duration: 2.762065634
jemalloc 4.1.0 mem: 169376 duration: 2.728441564
jemalloc 4.1.1 mem: 177644 duration: 2.714580024
jemalloc 4.2.0 mem: 170888 duration: 2.717521136
jemalloc 4.2.1 mem: 171296 duration: 2.666115584
jemalloc 4.3.0 mem: 206492 duration: 2.840541664
jemalloc 4.3.1 mem: 169248 duration: 2.665492603
jemalloc 4.4.0 mem: 172548 duration: 2.731029773
jemalloc 4.5.0 mem: 171016 duration: 2.716921755
jemalloc 5.0.0 mem: 168532 duration: 2.676492527
jemalloc 5.0.1 mem: 169548 duration: 2.730049283
jemalloc 5.1.0 mem: 167112 duration: 2.779946994
jemalloc 5.2.0 mem: 151676 duration: 2.750777831
lockless 1.4 mem: 161816 duration: 2.652849054
```

Multithreaded results highlights the importance of `MALLOC_ARENA_MAX`
in multithreaded setups where you are not using jemalloc/tcmalloc


```
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]
built-in mem: 248824 duration: 3.153443778
built-in mem (MALLOC_ARENA_MAX=2): 135548 duration: 3.367664694
mimalloc master: 318796 duration: 2.819220925
rpmalloc master: 238052 duration: 2.894455606
tcmalloc 2.0 mem: 151272 duration: 2.647027734
tcmalloc 2.1 mem: 147864 duration: 2.692278572
tcmalloc 2.2 mem: 153284 duration: 2.659121726
tcmalloc 2.3 mem: 137320 duration: 2.715402215
tcmalloc 2.4 mem: 144336 duration: 2.678387466
tcmalloc 2.5 mem: 126628 duration: 2.842295206
tcmalloc 2.6 mem: 138108 duration: 2.692514818
tcmalloc 2.6.1 mem: 149924 duration: 2.606778882
tcmalloc 2.6.2 mem: 146808 duration: 2.661948119
tcmalloc 2.6.3 mem: 139216 duration: 2.868227793
tcmalloc 2.7 mem: 149700 duration: 2.665362155
jemalloc 3.0.0 mem: 159348 duration: 2.800902898
jemalloc 3.1.0 mem: 171336 duration: 2.823129806
jemalloc 3.2.0 mem: 153252 duration: 3.064922478
jemalloc 3.3.0 mem: 147532 duration: 3.330849921
jemalloc 3.3.1 mem: 136924 duration: 3.172098706
jemalloc 3.4.0 mem: 136452 duration: 3.070144441
jemalloc 3.4.1 mem: 141612 duration: 3.194645612
jemalloc 3.5.0 mem: 143252 duration: 3.416616537
jemalloc 3.5.1 mem: 147184 duration: 3.193455258
jemalloc 3.6.0 mem: 148028 duration: 3.161889745
jemalloc 4.0.0 mem: 166248 duration: 2.934005061
jemalloc 4.0.1 mem: 154064 duration: 2.824123004
jemalloc 4.0.2 mem: 152512 duration: 3.037654685
jemalloc 4.0.3 mem: 157084 duration: 2.867739198
jemalloc 4.0.4 mem: 156744 duration: 2.938911222
jemalloc 4.1.0 mem: 150632 duration: 2.874437362
jemalloc 4.1.1 mem: 159136 duration: 2.761380049
jemalloc 4.2.0 mem: 164380 duration: 2.821185228
jemalloc 4.2.1 mem: 151372 duration: 2.857463988
jemalloc 4.3.0 mem: 185424 duration: 2.800370469
jemalloc 4.3.1 mem: 151052 duration: 2.781846973
jemalloc 4.4.0 mem: 184984 duration: 2.699202281
jemalloc 4.5.0 mem: 161376 duration: 2.996896429
jemalloc 5.0.0 mem: 174656 duration: 2.795937639
jemalloc 5.0.1 mem: 172904 duration: 2.870548357
jemalloc 5.1.0 mem: 178436 duration: 2.671000016
jemalloc 5.2.0 mem: 168644 duration: 2.700487403
lockless 1.4 mem: 331444 duration: 2.655562831
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
