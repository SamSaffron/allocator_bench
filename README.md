To run benchmarks

1. Install lockless from https://locklessinc.com/downloads/ in lockless_allocator path make
2. Install Hoard from https://github.com/emeryberger/Hoard in Hoard and make
3. Run `ruby make_jemallocs.rb`
4. Run `ruby make_tcmallocs.rb`  # You need to install libunwind-dev before
5. Run `ruby test_all.rb`

Results:

```
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
built-in mem: 173192 duration: 4.638066078
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Hoard HEAD mem: 195960 duration: 4.062823477
lockless 1.4 mem: 159424 duration: 3.620970112
tcmalloc 2.0 mem: 138056 duration: 3.862068019
tcmalloc 2.1 mem: 145632 duration: 3.735112744
tcmalloc 2.2 mem: 138488 duration: 3.787477555
tcmalloc 2.3 mem: 173184 duration: 3.700215836
tcmalloc 2.4 mem: 138236 duration: 3.878487951
tcmalloc 2.5 mem: 140532 duration: 3.824444351
jemalloc 3.0.0 mem: 162328 duration: 3.965587042
jemalloc 3.1.0 mem: 136324 duration: 3.951544536
jemalloc 3.2.0 mem: 165068 duration: 4.314828207
jemalloc 3.3.0 mem: 133872 duration: 4.276595265
jemalloc 3.3.1 mem: 165136 duration: 3.932839073
jemalloc 3.4.0 mem: 165248 duration: 3.961460742
jemalloc 3.4.1 mem: 165240 duration: 3.942153044
jemalloc 3.5.0 mem: 138028 duration: 4.013618577
jemalloc 3.5.1 mem: 133844 duration: 3.982648907
jemalloc 3.6.0 mem: 138100 duration: 3.945349745
jemalloc 4.0.0 mem: 139756 duration: 4.30952471
jemalloc 4.0.1 mem: 176468 duration: 3.785420352
jemalloc 4.0.2 mem: 139708 duration: 4.218279437
jemalloc 4.0.3 mem: 176388 duration: 3.818446195
jemalloc 4.0.4 mem: 175956 duration: 3.808784445
jemalloc 4.1.0 mem: 157256 duration: 3.863407003
jemalloc 4.1.1 mem: 142088 duration: 3.854477111
jemalloc 4.2.0 mem: 141996 duration: 3.86821559
jemalloc 4.2.1 mem: 142804 duration: 3.895340937
jemalloc 4.3.0 mem: 170628 duration: 4.617705681
jemalloc 4.3.1 mem: 142840 duration: 3.853970848
jemalloc 4.4.0 mem: 142120 duration: 4.148708165
jemalloc 4.5.0 mem: 141252 duration: 3.984665138
jemalloc 5.0.0 mem: 113544 duration: 3.842704218
jemalloc 5.0.1 mem: 159032 duration: 3.963963944
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
