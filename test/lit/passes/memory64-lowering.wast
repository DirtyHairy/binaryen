;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: foreach %s %t wasm-opt --memory64-lowering --enable-memory64 --enable-threads --enable-bulk-memory -S -o - | filecheck %s

(module
 ;; CHECK:      (type $0 (func))

 ;; CHECK:      (import "env" "__memory_base" (global $__memory_base i64))
 (import "env" "__memory_base" (global $__memory_base i64))
 ;; CHECK:      (import "env" "__memory_base32" (global $__memory_base32 i32))

 ;; CHECK:      (memory $0 1 1)
 (memory $0 i64 1 1)
 (data (i64.const 0) "\00\00\00\00\00\00\00\00\00\00")
 (data (global.get $__memory_base) "foo")
 ;; CHECK:      (data $0 (i32.const 0) "\00\00\00\00\00\00\00\00\00\00")

 ;; CHECK:      (data $1 (global.get $__memory_base32) "foo")

 ;; CHECK:      (func $load
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load align=1
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load align=2
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load offset=100
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load offset=100 align=1
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load offset=100 align=2
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load offset=100
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.load offset=100 align=1
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $load
  (drop (i32.load (i64.const 4)))
  (drop (i32.load align=1 (i64.const 4)))
  (drop (i32.load align=2 (i64.const 4)))
  (drop (i32.load align=4 (i64.const 4)))
  (drop (i32.load offset=100 (i64.const 4)))
  (drop (i32.load offset=100 align=1 (i64.const 4)))
  (drop (i32.load offset=100 align=2 (i64.const 4)))
  (drop (i32.load offset=100 align=4 (i64.const 4)))
  (drop (i32.load offset=100 align=1 (unreachable)))
 )

 ;; CHECK:      (func $store
 ;; CHECK-NEXT:  (i32.store
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store align=1
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store align=2
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store offset=100
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store offset=100 align=1
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store offset=100 align=2
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store offset=100
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store offset=100 align=1
 ;; CHECK-NEXT:   (unreachable)
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.store offset=100 align=1
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (unreachable)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $store
  (i32.store (i64.const 4) (i32.const 8))
  (i32.store align=1 (i64.const 4) (i32.const 8))
  (i32.store align=2 (i64.const 4) (i32.const 8))
  (i32.store align=4 (i64.const 4) (i32.const 8))
  (i32.store offset=100 (i64.const 4) (i32.const 8))
  (i32.store offset=100 align=1 (i64.const 4) (i32.const 8))
  (i32.store offset=100 align=2 (i64.const 4) (i32.const 8))
  (i32.store offset=100 align=4 (i64.const 4) (i32.const 8))
  (i32.store offset=100 align=1 (unreachable) (i32.const 8))
  (i32.store offset=100 align=1 (i64.const 4) (unreachable))
 )

 ;; CHECK:      (func $atomics
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.atomic.load
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 4)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (i32.atomic.store
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 4)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 8)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.atomic.rmw8.add_u
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 1)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (i32.const 2)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.atomic.rmw8.cmpxchg_u
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 1)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (i32.const 2)
 ;; CHECK-NEXT:    (i32.const 3)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (memory.atomic.wait32
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 1)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (i32.const 2)
 ;; CHECK-NEXT:    (i64.const 3)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (memory.atomic.notify
 ;; CHECK-NEXT:    (i32.wrap_i64
 ;; CHECK-NEXT:     (i64.const 1)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (i32.const 2)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $atomics
  (drop (i32.atomic.load (i64.const 4)))
  (i32.atomic.store (i64.const 4) (i32.const 8))
  (drop (i32.atomic.rmw8.add_u (i64.const 1) (i32.const 2)))
  (drop (i32.atomic.rmw8.cmpxchg_u (i64.const 1) (i32.const 2) (i32.const 3)))
  (drop (memory.atomic.wait32 (i64.const 1) (i32.const 2) (i64.const 3)))
  (drop (memory.atomic.notify (i64.const 1) (i32.const 2)))
 )

 ;; CHECK:      (func $other
 ;; CHECK-NEXT:  (local $0 i64)
 ;; CHECK-NEXT:  (local.set $0
 ;; CHECK-NEXT:   (i64.extend_i32_u
 ;; CHECK-NEXT:    (memory.size)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (local.set $0
 ;; CHECK-NEXT:   (i64.extend_i32_u
 ;; CHECK-NEXT:    (memory.grow
 ;; CHECK-NEXT:     (i32.wrap_i64
 ;; CHECK-NEXT:      (i64.const 1)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (memory.init $0
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 1)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 2)
 ;; CHECK-NEXT:   (i32.const 3)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (memory.fill
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 1)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.const 2)
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 3)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (memory.copy
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 1)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 2)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (i32.wrap_i64
 ;; CHECK-NEXT:    (i64.const 3)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $other
  (local i64)
  (local.set 0 (memory.size))
  (local.set 0 (memory.grow (i64.const 1)))
  (memory.init 0 (i64.const 1) (i32.const 2) (i32.const 3))
  (memory.fill (i64.const 1) (i32.const 2) (i64.const 3))
  (memory.copy (i64.const 1) (i64.const 2) (i64.const 3))
 )
)

(module
  ;; CHECK:      (memory $0 1 65536)
  (memory $0 i64 1 65537)
)
