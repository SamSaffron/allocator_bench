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
built-in mem: 168676 duration: 3.097120389
built-in mem (2 arena malloc): 168884 duration: 3.141805418
mimalloc master: 179760 duration: 2.692077789
tcmalloc 2.0 mem: 139948 duration: 2.931045746
tcmalloc 2.1 mem: 139556 duration: 2.931866837
tcmalloc 2.2 mem: 139920 duration: 2.907351515
tcmalloc 2.3 mem: 169508 duration: 2.575296785
tcmalloc 2.4 mem: 142676 duration: 2.759707597
tcmalloc 2.5 mem: 140288 duration: 2.809801552
tcmalloc 2.6 mem: 156540 duration: 2.81194421
tcmalloc 2.6.1 mem: 159024 duration: 2.471327449
tcmalloc 2.6.2 mem: 142540 duration: 2.841949871
tcmalloc 2.6.3 mem: 142264 duration: 2.866289953
tcmalloc 2.7 mem: 174628 duration: 2.524599463
jemalloc 3.0.0 mem: 131896 duration: 3.127378822
jemalloc 3.1.0 mem: 143372 duration: 2.830273958
jemalloc 3.2.0 mem: 144568 duration: 2.822619706
jemalloc 3.3.0 mem: 144396 duration: 2.815244177
jemalloc 3.3.1 mem: 148388 duration: 2.717397762
jemalloc 3.4.0 mem: 144216 duration: 2.866729839
jemalloc 3.4.1 mem: 144200 duration: 2.874322523
jemalloc 3.5.0 mem: 144208 duration: 2.879210684
jemalloc 3.5.1 mem: 144496 duration: 2.873911191
jemalloc 3.6.0 mem: 152596 duration: 2.710074967
jemalloc 4.0.0 mem: 169376 duration: 2.776187371
jemalloc 4.0.1 mem: 182824 duration: 2.734378037
jemalloc 4.0.2 mem: 184424 duration: 2.846067147
jemalloc 4.0.3 mem: 170880 duration: 2.757896799
jemalloc 4.0.4 mem: 169400 duration: 2.716667451
jemalloc 4.1.0 mem: 169024 duration: 2.680531562
jemalloc 4.1.1 mem: 170920 duration: 2.707289877
jemalloc 4.2.0 mem: 170436 duration: 2.725028777
jemalloc 4.2.1 mem: 171100 duration: 2.763685352
jemalloc 4.3.0 mem: 200348 duration: 2.777401994
jemalloc 4.3.1 mem: 171044 duration: 2.69347195
jemalloc 4.4.0 mem: 150192 duration: 2.750083808
jemalloc 4.5.0 mem: 170764 duration: 2.685679574
jemalloc 5.0.0 mem: 167644 duration: 2.67587911
jemalloc 5.0.1 mem: 168552 duration: 2.670171963
jemalloc 5.1.0 mem: 168660 duration: 2.686125988
jemalloc 5.2.0 mem: 151672 duration: 2.682894219
lockless 1.4 mem: 161984 duration: 2.618409497
```

Multithreaded results highlights the importance of `MALLOC_ARENA_MAX`
in multithreaded setups where you are not using jemalloc/tcmalloc


```
allocator_bench % STRESS_THREADS=10 ruby test_all.rb
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]
built-in mem: 216980 duration: 3.117673145
built-in mem (MALLOC_ARENA_MAX=2): 143356 duration: 2.996984896
mimalloc master: 305564 duration: 2.685818191
tcmalloc 2.0 mem: 140744 duration: 2.621780967
tcmalloc 2.1 mem: 125140 duration: 2.859994774
tcmalloc 2.2 mem: 130000 duration: 2.78946289
tcmalloc 2.3 mem: 135552 duration: 2.695206943
tcmalloc 2.4 mem: 136544 duration: 2.72213317
tcmalloc 2.5 mem: 127880 duration: 2.721207716
tcmalloc 2.6 mem: 134560 duration: 2.657063104
tcmalloc 2.6.1 mem: 136412 duration: 2.600121801
tcmalloc 2.6.2 mem: 134404 duration: 2.627586324
tcmalloc 2.6.3 mem: 137876 duration: 2.581387615
tcmalloc 2.7 mem: 142700 duration: 2.56388183
jemalloc 3.0.0 mem: 156604 duration: 2.895129385
jemalloc 3.1.0 mem: 172904 duration: 2.743504098
jemalloc 3.2.0 mem: 137008 duration: 3.101546043
jemalloc 3.3.0 mem: 143572 duration: 2.849554748
jemalloc 3.3.1 mem: 150848 duration: 2.829801844
jemalloc 3.4.0 mem: 140960 duration: 2.870878932
jemalloc 3.4.1 mem: 141380 duration: 2.878213663
jemalloc 3.5.0 mem: 142400 duration: 2.895826832
jemalloc 3.5.1 mem: 140048 duration: 2.929284167
jemalloc 3.6.0 mem: 142880 duration: 2.896521471
jemalloc 4.0.0 mem: 155036 duration: 2.821764098
jemalloc 4.0.1 mem: 147468 duration: 2.793140141
jemalloc 4.0.2 mem: 148596 duration: 2.925717719
jemalloc 4.0.3 mem: 159516 duration: 2.776216964
jemalloc 4.0.4 mem: 166552 duration: 2.719755091
jemalloc 4.1.0 mem: 163320 duration: 2.680735558
jemalloc 4.1.1 mem: 160356 duration: 2.734943065
jemalloc 4.2.0 mem: 167952 duration: 2.772462577
jemalloc 4.2.1 mem: 153928 duration: 2.769602123
jemalloc 4.3.0 mem: 179132 duration: 2.741271879
jemalloc 4.3.1 mem: 164104 duration: 2.671498417
jemalloc 4.4.0 mem: 174240 duration: 2.764872875
jemalloc 4.5.0 mem: 176092 duration: 2.730592457
jemalloc 5.0.0 mem: 166956 duration: 2.83930075
jemalloc 5.0.1 mem: 178680 duration: 2.690214995
jemalloc 5.1.0 mem: 162288 duration: 2.844753497
jemalloc 5.2.0 mem: 178348 duration: 2.652822422
lockless 1.4 mem: 280440 duration: 2.686996364
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
