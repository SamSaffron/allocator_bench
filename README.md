To run benchmarks

1. Install lockless from https://locklessinc.com/downloads/ in lockless_allocator path make
2. Install Hoard from https://github.com/emeryberger/Hoard in Hoard and make
3. Run `ruby make_jemallocs.rb`
4. Run `ruby make_tcmallocs.rb`  # You need to install libunwind-dev before
5. Run `ruby test_all.rb`

Results:

```
sam@ubuntu allocator_bench % ruby test_all.rb 
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
built-in mem: 167176 duration: 3.964487297
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Using the Hoard memory allocator (http://www.hoard.org), version 3.12.0
Hoard HEAD mem: 203708 duration: 4.149287478
lockless 1.4 mem: 159372 duration: 3.636740413
tcmalloc 2.0 mem: 151608 duration: 3.888889609
tcmalloc 2.1 mem: 150588 duration: 3.875779788
tcmalloc 2.2 mem: 142776 duration: 3.915941659
tcmalloc 2.3 mem: 151076 duration: 3.805347819
tcmalloc 2.4 mem: 142792 duration: 3.853040733
tcmalloc 2.5 mem: 143896 duration: 3.788830457
jemalloc 3.0.0 mem: 118936 duration: 4.18941169
jemalloc 3.1.0 mem: 163808 duration: 3.871656579
jemalloc 3.2.0 mem: 145908 duration: 4.174645887
jemalloc 3.3.0 mem: 166976 duration: 3.906206998
jemalloc 3.3.1 mem: 145928 duration: 4.258136317
jemalloc 3.4.0 mem: 166860 duration: 4.074550757
jemalloc 3.4.1 mem: 139808 duration: 3.90020784
jemalloc 3.5.0 mem: 166816 duration: 4.21178128
jemalloc 3.5.1 mem: 166848 duration: 4.106943385
jemalloc 3.6.0 mem: 166920 duration: 4.175744512
jemalloc 4.0.0 mem: 143268 duration: 4.08900916
jemalloc 4.0.1 mem: 149960 duration: 4.444219922
jemalloc 4.0.2 mem: 147528 duration: 3.972144712
jemalloc 4.0.3 mem: 170564 duration: 3.961586129
jemalloc 4.0.4 mem: 127764 duration: 4.287005435
jemalloc 4.1.0 mem: 147832 duration: 3.925845213
jemalloc 4.1.1 mem: 177584 duration: 3.988718586
jemalloc 4.2.0 mem: 144284 duration: 4.114141621
jemalloc 4.2.1 mem: 144652 duration: 3.982613104
jemalloc 4.3.0 mem: 209736 duration: 4.216149661
jemalloc 4.3.1 mem: 145244 duration: 4.141265085
jemalloc 4.4.0 mem: 133468 duration: 4.532110308
jemalloc 4.5.0 mem: 176304 duration: 3.823256451
jemalloc 5.0.0 mem: 156816 duration: 4.017203667
jemalloc 5.0.1 mem: 141340 duration: 4.087868557
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
