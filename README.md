To run benchmarks

1. Install lockless from https://locklessinc.com/downloads/ in lockless_allocator path make
2. Install Hoard from https://github.com/emeryberger/Hoard in Hoard and make
3. Run `ruby make_jemallocs.rb`
4. Run `ruby make_tcmallocs.rb`  # You need to install libunwind-dev before
5. Run `ruby test_all.rb`

Results:

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
