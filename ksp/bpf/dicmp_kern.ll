; ModuleID = 'dicmp_kern.c'
source_filename = "dicmp_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr }
%struct.perf_trace_event = type { i64, i32, i8 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@output_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@xdp_dicmp.____fmt = internal constant [17 x i8] c"Got ICMP packet\0A\00", align 1, !dbg !73
@xdp_dicmp.____fmt.1 = internal constant [16 x i8] c"Got TCP packet\0A\00", align 1, !dbg !168
@llvm.compiler.used = appending global [2 x ptr] [ptr @output_map, ptr @xdp_dicmp], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local noundef i32 @xdp_dicmp(ptr noundef %0) #0 section "xdp" !dbg !75 {
  %2 = alloca %struct.perf_trace_event, align 8, !DIAssignID !188
  call void @llvm.dbg.assign(metadata i1 undef, metadata !91, metadata !DIExpression(), metadata !188, metadata ptr %2, metadata !DIExpression()), !dbg !189
  tail call void @llvm.dbg.value(metadata ptr %0, metadata !90, metadata !DIExpression()), !dbg !189
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #4, !dbg !190
  %3 = getelementptr inbounds i8, ptr %2, i64 8, !dbg !191
  store i64 0, ptr %3, align 8, !dbg !191, !DIAssignID !192
  call void @llvm.dbg.assign(metadata i64 0, metadata !91, metadata !DIExpression(), metadata !192, metadata ptr %2, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.assign(metadata i8 0, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !193, metadata ptr undef, metadata !DIExpression()), !dbg !189
  %4 = tail call i64 inttoptr (i64 5 to ptr)() #4, !dbg !194
  store i64 %4, ptr %2, align 8, !dbg !195, !tbaa !196, !DIAssignID !202
  call void @llvm.dbg.assign(metadata i64 %4, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !202, metadata ptr %2, metadata !DIExpression()), !dbg !189
  %5 = getelementptr inbounds %struct.perf_trace_event, ptr %2, i64 0, i32 2, !dbg !203
  store i8 1, ptr %5, align 4, !dbg !204, !tbaa !205, !DIAssignID !206
  call void @llvm.dbg.assign(metadata i8 1, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8), metadata !206, metadata ptr %5, metadata !DIExpression()), !dbg !189
  %6 = getelementptr inbounds %struct.perf_trace_event, ptr %2, i64 0, i32 1, !dbg !207
  store i32 0, ptr %6, align 8, !dbg !208, !tbaa !209, !DIAssignID !210
  call void @llvm.dbg.assign(metadata i32 0, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !210, metadata ptr %6, metadata !DIExpression()), !dbg !189
  %7 = call i64 inttoptr (i64 25 to ptr)(ptr noundef %0, ptr noundef nonnull @output_map, i64 noundef 4294967295, ptr noundef nonnull %2, i64 noundef 16) #4, !dbg !211
  %8 = load i32, ptr %0, align 4, !dbg !212, !tbaa !213
  %9 = zext i32 %8 to i64, !dbg !215
  %10 = inttoptr i64 %9 to ptr, !dbg !216
  tail call void @llvm.dbg.value(metadata ptr %10, metadata !99, metadata !DIExpression()), !dbg !189
  %11 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !217
  %12 = load i32, ptr %11, align 4, !dbg !217, !tbaa !218
  %13 = zext i32 %12 to i64, !dbg !219
  %14 = inttoptr i64 %13 to ptr, !dbg !220
  tail call void @llvm.dbg.value(metadata ptr %14, metadata !100, metadata !DIExpression()), !dbg !189
  tail call void @llvm.dbg.value(metadata ptr %10, metadata !101, metadata !DIExpression()), !dbg !189
  %15 = getelementptr inbounds i8, ptr %10, i64 14, !dbg !221
  %16 = icmp ugt ptr %15, %14, !dbg !222
  br i1 %16, label %17, label %22, !dbg !223

17:                                               ; preds = %1
  store i8 2, ptr %5, align 4, !dbg !224, !tbaa !205, !DIAssignID !225
  call void @llvm.dbg.assign(metadata i8 2, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8), metadata !225, metadata ptr %5, metadata !DIExpression()), !dbg !189
  %18 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !226
  tail call void @llvm.dbg.value(metadata i64 %18, metadata !114, metadata !DIExpression()), !dbg !227
  %19 = load i64, ptr %2, align 8, !dbg !228, !tbaa !196
  %20 = sub i64 %18, %19, !dbg !229
  %21 = trunc i64 %20 to i32, !dbg !230
  store i32 %21, ptr %6, align 8, !dbg !231, !tbaa !209, !DIAssignID !232
  call void @llvm.dbg.assign(metadata i32 %21, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !232, metadata ptr %6, metadata !DIExpression()), !dbg !189
  store i64 %18, ptr %2, align 8, !dbg !233, !tbaa !196, !DIAssignID !234
  call void @llvm.dbg.assign(metadata i64 %18, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !234, metadata ptr %2, metadata !DIExpression()), !dbg !189
  br label %55

22:                                               ; preds = %1
  %23 = getelementptr inbounds %struct.ethhdr, ptr %10, i64 0, i32 2, !dbg !235
  %24 = load i16, ptr %23, align 1, !dbg !235, !tbaa !236
  %25 = icmp eq i16 %24, 8, !dbg !239
  br i1 %25, label %31, label %26, !dbg !240

26:                                               ; preds = %22
  store i8 3, ptr %5, align 4, !dbg !241, !tbaa !205, !DIAssignID !242
  call void @llvm.dbg.assign(metadata i8 3, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8), metadata !242, metadata ptr %5, metadata !DIExpression()), !dbg !189
  %27 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !243
  tail call void @llvm.dbg.value(metadata i64 %27, metadata !117, metadata !DIExpression()), !dbg !244
  %28 = load i64, ptr %2, align 8, !dbg !245, !tbaa !196
  %29 = sub i64 %27, %28, !dbg !246
  %30 = trunc i64 %29 to i32, !dbg !247
  store i32 %30, ptr %6, align 8, !dbg !248, !tbaa !209, !DIAssignID !249
  call void @llvm.dbg.assign(metadata i32 %30, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !249, metadata ptr %6, metadata !DIExpression()), !dbg !189
  store i64 %27, ptr %2, align 8, !dbg !250, !tbaa !196, !DIAssignID !251
  call void @llvm.dbg.assign(metadata i64 %27, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !251, metadata ptr %2, metadata !DIExpression()), !dbg !189
  br label %55

31:                                               ; preds = %22
  tail call void @llvm.dbg.value(metadata ptr %15, metadata !120, metadata !DIExpression()), !dbg !189
  %32 = getelementptr inbounds i8, ptr %10, i64 34, !dbg !252
  %33 = icmp ugt ptr %32, %14, !dbg !253
  br i1 %33, label %34, label %39, !dbg !254

34:                                               ; preds = %31
  store i8 2, ptr %5, align 4, !dbg !255, !tbaa !205, !DIAssignID !256
  call void @llvm.dbg.assign(metadata i8 2, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8), metadata !256, metadata ptr %5, metadata !DIExpression()), !dbg !189
  %35 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !257
  tail call void @llvm.dbg.value(metadata i64 %35, metadata !149, metadata !DIExpression()), !dbg !258
  %36 = load i64, ptr %2, align 8, !dbg !259, !tbaa !196
  %37 = sub i64 %35, %36, !dbg !260
  %38 = trunc i64 %37 to i32, !dbg !261
  store i32 %38, ptr %6, align 8, !dbg !262, !tbaa !209, !DIAssignID !263
  call void @llvm.dbg.assign(metadata i32 %38, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !263, metadata ptr %6, metadata !DIExpression()), !dbg !189
  store i64 %35, ptr %2, align 8, !dbg !264, !tbaa !196, !DIAssignID !265
  call void @llvm.dbg.assign(metadata i64 %35, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !265, metadata ptr %2, metadata !DIExpression()), !dbg !189
  br label %55

39:                                               ; preds = %31
  %40 = getelementptr inbounds i8, ptr %10, i64 23, !dbg !266
  %41 = load i8, ptr %40, align 1, !dbg !266, !tbaa !267
  switch i8 %41, label %50 [
    i8 1, label %42
    i8 6, label %48
  ], !dbg !269

42:                                               ; preds = %39
  %43 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_dicmp.____fmt, i32 noundef 17) #4, !dbg !270
  store i8 2, ptr %5, align 4, !dbg !272, !tbaa !205, !DIAssignID !273
  call void @llvm.dbg.assign(metadata i8 2, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8), metadata !273, metadata ptr %5, metadata !DIExpression()), !dbg !189
  %44 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !274
  tail call void @llvm.dbg.value(metadata i64 %44, metadata !152, metadata !DIExpression()), !dbg !275
  %45 = load i64, ptr %2, align 8, !dbg !276, !tbaa !196
  %46 = sub i64 %44, %45, !dbg !277
  %47 = trunc i64 %46 to i32, !dbg !278
  store i32 %47, ptr %6, align 8, !dbg !279, !tbaa !209, !DIAssignID !280
  call void @llvm.dbg.assign(metadata i32 %47, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !280, metadata ptr %6, metadata !DIExpression()), !dbg !189
  store i64 %44, ptr %2, align 8, !dbg !281, !tbaa !196, !DIAssignID !282
  call void @llvm.dbg.assign(metadata i64 %44, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !282, metadata ptr %2, metadata !DIExpression()), !dbg !189
  br label %55

48:                                               ; preds = %39
  %49 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_dicmp.____fmt.1, i32 noundef 16) #4, !dbg !283
  br label %50, !dbg !286

50:                                               ; preds = %39, %48
  store i8 3, ptr %5, align 4, !dbg !287, !tbaa !205, !DIAssignID !288
  call void @llvm.dbg.assign(metadata i8 3, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8), metadata !288, metadata ptr %5, metadata !DIExpression()), !dbg !189
  %51 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !289
  tail call void @llvm.dbg.value(metadata i64 %51, metadata !155, metadata !DIExpression()), !dbg !189
  %52 = load i64, ptr %2, align 8, !dbg !290, !tbaa !196
  %53 = sub i64 %51, %52, !dbg !291
  %54 = trunc i64 %53 to i32, !dbg !292
  store i32 %54, ptr %6, align 8, !dbg !293, !tbaa !209, !DIAssignID !294
  call void @llvm.dbg.assign(metadata i32 %54, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !294, metadata ptr %6, metadata !DIExpression()), !dbg !189
  store i64 %51, ptr %2, align 8, !dbg !295, !tbaa !196, !DIAssignID !296
  call void @llvm.dbg.assign(metadata i64 %51, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64), metadata !296, metadata ptr %2, metadata !DIExpression()), !dbg !189
  br label %55

55:                                               ; preds = %34, %42, %50, %26, %17
  %56 = phi i32 [ 1, %17 ], [ 2, %26 ], [ 1, %34 ], [ 1, %42 ], [ 2, %50 ], !dbg !189
  %57 = call i64 inttoptr (i64 25 to ptr)(ptr noundef nonnull %0, ptr noundef nonnull @output_map, i64 noundef 4294967295, ptr noundef nonnull %2, i64 noundef 16) #4, !dbg !189
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #4, !dbg !297
  ret i32 %56, !dbg !297
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!182, !183, !184, !185, !186}
!llvm.ident = !{!187}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "output_map", scope: !2, file: !3, line: 23, type: !173, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Homebrew clang version 18.1.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !51, globals: !57, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dicmp_kern.c", directory: "/home/aryan/applications/accuknox/drop_packets/ksp/bpf", checksumkind: CSK_MD5, checksum: "fbcb6f77bfd986ff826baa5cfd2c7acb")
!4 = !{!5, !12, !20}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 5128, baseType: !7, size: 64, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "3810ac036d82ed3898d498c10e871015")
!7 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "BPF_F_INDEX_MASK", value: 4294967295, isUnsigned: true)
!10 = !DIEnumerator(name: "BPF_F_CURRENT_CPU", value: 4294967295, isUnsigned: true)
!11 = !DIEnumerator(name: "BPF_F_CTXLEN_MASK", value: 4503595332403200, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5436, baseType: !13, size: 32, elements: !14)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!15, !16, !17, !18, !19}
!15 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!16 = !DIEnumerator(name: "XDP_DROP", value: 1)
!17 = !DIEnumerator(name: "XDP_PASS", value: 2)
!18 = !DIEnumerator(name: "XDP_TX", value: 3)
!19 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !21, line: 28, baseType: !13, size: 32, elements: !22)
!21 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50}
!23 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!24 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!25 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!26 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!27 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!28 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!29 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!30 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!31 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!32 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!33 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!34 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!35 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!36 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!37 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!38 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!39 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!40 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!41 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!42 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!43 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!44 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!45 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!46 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!47 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!48 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!49 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!50 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!51 = !{!52, !53, !54}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!53 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !55, line: 24, baseType: !56)
!55 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!56 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!57 = !{!58, !67, !73, !161, !168, !0}
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !60, line: 114, type: !61, isLocal: true, isDefinition: true)
!60 = !DIFile(filename: "../../libbpf/src/bpf_helper_defs.h", directory: "/home/aryan/applications/accuknox/drop_packets/ksp/bpf", checksumkind: CSK_MD5, checksum: "c4541ac9eb5775ba778051c940b03a18")
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DISubroutineType(types: !64)
!64 = !{!65}
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !55, line: 31, baseType: !66)
!66 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "bpf_perf_event_output", scope: !2, file: !60, line: 698, type: !69, isLocal: true, isDefinition: true)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DISubroutineType(types: !72)
!72 = !{!53, !52, !52, !65, !52, !65}
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "____fmt", scope: !75, file: !3, line: 72, type: !156, isLocal: true, isDefinition: true)
!75 = distinct !DISubprogram(name: "xdp_dicmp", scope: !3, file: !3, line: 26, type: !76, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !89)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5447, size: 192, elements: !81)
!81 = !{!82, !84, !85, !86, !87, !88}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !80, file: !6, line: 5448, baseType: !83, size: 32)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !55, line: 27, baseType: !13)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !80, file: !6, line: 5449, baseType: !83, size: 32, offset: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !80, file: !6, line: 5450, baseType: !83, size: 32, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !80, file: !6, line: 5452, baseType: !83, size: 32, offset: 96)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !80, file: !6, line: 5453, baseType: !83, size: 32, offset: 128)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !80, file: !6, line: 5455, baseType: !83, size: 32, offset: 160)
!89 = !{!90, !91, !99, !100, !101, !114, !117, !120, !149, !152, !155}
!90 = !DILocalVariable(name: "ctx", arg: 1, scope: !75, file: !3, line: 26, type: !79)
!91 = !DILocalVariable(name: "e", scope: !75, file: !3, line: 29, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "perf_trace_event", file: !3, line: 9, size: 128, elements: !93)
!93 = !{!94, !95, !96}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !92, file: !3, line: 10, baseType: !65, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "processing_time_ns", scope: !92, file: !3, line: 11, baseType: !83, size: 32, offset: 64)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !92, file: !3, line: 12, baseType: !97, size: 8, offset: 96)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !55, line: 21, baseType: !98)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !DILocalVariable(name: "data", scope: !75, file: !3, line: 36, type: !52)
!100 = !DILocalVariable(name: "data_end", scope: !75, file: !3, line: 37, type: !52)
!101 = !DILocalVariable(name: "eth", scope: !75, file: !3, line: 39, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !104, line: 168, size: 112, elements: !105)
!104 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!105 = !{!106, !110, !111}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !103, file: !104, line: 169, baseType: !107, size: 48)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 48, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 6)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !103, file: !104, line: 170, baseType: !107, size: 48, offset: 48)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !103, file: !104, line: 171, baseType: !112, size: 16, offset: 96)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !113, line: 25, baseType: !54)
!113 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!114 = !DILocalVariable(name: "ts", scope: !115, file: !3, line: 43, type: !65)
!115 = distinct !DILexicalBlock(scope: !116, file: !3, line: 41, column: 5)
!116 = distinct !DILexicalBlock(scope: !75, file: !3, line: 40, column: 9)
!117 = !DILocalVariable(name: "ts", scope: !118, file: !3, line: 53, type: !65)
!118 = distinct !DILexicalBlock(scope: !119, file: !3, line: 51, column: 5)
!119 = distinct !DILexicalBlock(scope: !75, file: !3, line: 50, column: 9)
!120 = !DILocalVariable(name: "iph", scope: !75, file: !3, line: 60, type: !121)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !123, line: 87, size: 160, elements: !124)
!123 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!124 = !{!125, !126, !127, !128, !129, !130, !131, !132, !133, !135}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !122, file: !123, line: 89, baseType: !97, size: 4, flags: DIFlagBitField, extraData: i64 0)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !122, file: !123, line: 90, baseType: !97, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !122, file: !123, line: 97, baseType: !97, size: 8, offset: 8)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !122, file: !123, line: 98, baseType: !112, size: 16, offset: 16)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !122, file: !123, line: 99, baseType: !112, size: 16, offset: 32)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !122, file: !123, line: 100, baseType: !112, size: 16, offset: 48)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !122, file: !123, line: 101, baseType: !97, size: 8, offset: 64)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !122, file: !123, line: 102, baseType: !97, size: 8, offset: 72)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !122, file: !123, line: 103, baseType: !134, size: 16, offset: 80)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !113, line: 31, baseType: !54)
!135 = !DIDerivedType(tag: DW_TAG_member, scope: !122, file: !123, line: 104, baseType: !136, size: 64, offset: 96)
!136 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !122, file: !123, line: 104, size: 64, elements: !137)
!137 = !{!138, !144}
!138 = !DIDerivedType(tag: DW_TAG_member, scope: !136, file: !123, line: 104, baseType: !139, size: 64)
!139 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !136, file: !123, line: 104, size: 64, elements: !140)
!140 = !{!141, !143}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !139, file: !123, line: 104, baseType: !142, size: 32)
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !113, line: 27, baseType: !83)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !139, file: !123, line: 104, baseType: !142, size: 32, offset: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !136, file: !123, line: 104, baseType: !145, size: 64)
!145 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !136, file: !123, line: 104, size: 64, elements: !146)
!146 = !{!147, !148}
!147 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !145, file: !123, line: 104, baseType: !142, size: 32)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !145, file: !123, line: 104, baseType: !142, size: 32, offset: 32)
!149 = !DILocalVariable(name: "ts", scope: !150, file: !3, line: 64, type: !65)
!150 = distinct !DILexicalBlock(scope: !151, file: !3, line: 62, column: 5)
!151 = distinct !DILexicalBlock(scope: !75, file: !3, line: 61, column: 9)
!152 = !DILocalVariable(name: "ts", scope: !153, file: !3, line: 74, type: !65)
!153 = distinct !DILexicalBlock(scope: !154, file: !3, line: 71, column: 40)
!154 = distinct !DILexicalBlock(scope: !75, file: !3, line: 71, column: 9)
!155 = !DILocalVariable(name: "ts", scope: !75, file: !3, line: 86, type: !65)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !157, size: 136, elements: !159)
!157 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !158)
!158 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!159 = !{!160}
!160 = !DISubrange(count: 17)
!161 = !DIGlobalVariableExpression(var: !162, expr: !DIExpression())
!162 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !60, line: 177, type: !163, isLocal: true, isDefinition: true)
!163 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !164)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DISubroutineType(types: !166)
!166 = !{!53, !167, !83, null}
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!168 = !DIGlobalVariableExpression(var: !169, expr: !DIExpression())
!169 = distinct !DIGlobalVariable(name: "____fmt", scope: !75, file: !3, line: 82, type: !170, isLocal: true, isDefinition: true)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !157, size: 128, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 16)
!173 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 19, size: 192, elements: !174)
!174 = !{!175, !180, !181}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !173, file: !3, line: 20, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = !DICompositeType(tag: DW_TAG_array_type, baseType: !78, size: 128, elements: !178)
!178 = !{!179}
!179 = !DISubrange(count: 4)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !173, file: !3, line: 21, baseType: !176, size: 64, offset: 64)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !173, file: !3, line: 22, baseType: !176, size: 64, offset: 128)
!182 = !{i32 7, !"Dwarf Version", i32 5}
!183 = !{i32 2, !"Debug Info Version", i32 3}
!184 = !{i32 1, !"wchar_size", i32 4}
!185 = !{i32 7, !"frame-pointer", i32 2}
!186 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!187 = !{!"Homebrew clang version 18.1.6"}
!188 = distinct !DIAssignID()
!189 = !DILocation(line: 0, scope: !75)
!190 = !DILocation(line: 29, column: 5, scope: !75)
!191 = !DILocation(line: 29, column: 29, scope: !75)
!192 = distinct !DIAssignID()
!193 = distinct !DIAssignID()
!194 = !DILocation(line: 31, column: 19, scope: !75)
!195 = !DILocation(line: 31, column: 17, scope: !75)
!196 = !{!197, !198, i64 0}
!197 = !{!"perf_trace_event", !198, i64 0, !201, i64 8, !199, i64 12}
!198 = !{!"long long", !199, i64 0}
!199 = !{!"omnipotent char", !200, i64 0}
!200 = !{!"Simple C/C++ TBAA"}
!201 = !{!"int", !199, i64 0}
!202 = distinct !DIAssignID()
!203 = !DILocation(line: 32, column: 7, scope: !75)
!204 = !DILocation(line: 32, column: 12, scope: !75)
!205 = !{!197, !199, i64 12}
!206 = distinct !DIAssignID()
!207 = !DILocation(line: 33, column: 7, scope: !75)
!208 = !DILocation(line: 33, column: 26, scope: !75)
!209 = !{!197, !201, i64 8}
!210 = distinct !DIAssignID()
!211 = !DILocation(line: 34, column: 5, scope: !75)
!212 = !DILocation(line: 36, column: 37, scope: !75)
!213 = !{!214, !201, i64 0}
!214 = !{!"xdp_md", !201, i64 0, !201, i64 4, !201, i64 8, !201, i64 12, !201, i64 16, !201, i64 20}
!215 = !DILocation(line: 36, column: 26, scope: !75)
!216 = !DILocation(line: 36, column: 18, scope: !75)
!217 = !DILocation(line: 37, column: 41, scope: !75)
!218 = !{!214, !201, i64 4}
!219 = !DILocation(line: 37, column: 30, scope: !75)
!220 = !DILocation(line: 37, column: 22, scope: !75)
!221 = !DILocation(line: 40, column: 14, scope: !116)
!222 = !DILocation(line: 40, column: 38, scope: !116)
!223 = !DILocation(line: 40, column: 9, scope: !75)
!224 = !DILocation(line: 42, column: 16, scope: !115)
!225 = distinct !DIAssignID()
!226 = !DILocation(line: 43, column: 20, scope: !115)
!227 = !DILocation(line: 0, scope: !115)
!228 = !DILocation(line: 44, column: 39, scope: !115)
!229 = !DILocation(line: 44, column: 35, scope: !115)
!230 = !DILocation(line: 44, column: 32, scope: !115)
!231 = !DILocation(line: 44, column: 30, scope: !115)
!232 = distinct !DIAssignID()
!233 = !DILocation(line: 45, column: 21, scope: !115)
!234 = distinct !DIAssignID()
!235 = !DILocation(line: 50, column: 9, scope: !119)
!236 = !{!237, !238, i64 12}
!237 = !{!"ethhdr", !199, i64 0, !199, i64 6, !238, i64 12}
!238 = !{!"short", !199, i64 0}
!239 = !DILocation(line: 50, column: 33, scope: !119)
!240 = !DILocation(line: 50, column: 9, scope: !75)
!241 = !DILocation(line: 52, column: 16, scope: !118)
!242 = distinct !DIAssignID()
!243 = !DILocation(line: 53, column: 20, scope: !118)
!244 = !DILocation(line: 0, scope: !118)
!245 = !DILocation(line: 54, column: 39, scope: !118)
!246 = !DILocation(line: 54, column: 35, scope: !118)
!247 = !DILocation(line: 54, column: 32, scope: !118)
!248 = !DILocation(line: 54, column: 30, scope: !118)
!249 = distinct !DIAssignID()
!250 = !DILocation(line: 55, column: 21, scope: !118)
!251 = distinct !DIAssignID()
!252 = !DILocation(line: 61, column: 38, scope: !151)
!253 = !DILocation(line: 61, column: 61, scope: !151)
!254 = !DILocation(line: 61, column: 9, scope: !75)
!255 = !DILocation(line: 63, column: 16, scope: !150)
!256 = distinct !DIAssignID()
!257 = !DILocation(line: 64, column: 20, scope: !150)
!258 = !DILocation(line: 0, scope: !150)
!259 = !DILocation(line: 65, column: 39, scope: !150)
!260 = !DILocation(line: 65, column: 35, scope: !150)
!261 = !DILocation(line: 65, column: 32, scope: !150)
!262 = !DILocation(line: 65, column: 30, scope: !150)
!263 = distinct !DIAssignID()
!264 = !DILocation(line: 66, column: 21, scope: !150)
!265 = distinct !DIAssignID()
!266 = !DILocation(line: 71, column: 14, scope: !154)
!267 = !{!268, !199, i64 9}
!268 = !{!"iphdr", !199, i64 0, !199, i64 0, !199, i64 1, !238, i64 2, !238, i64 4, !238, i64 6, !199, i64 8, !199, i64 9, !238, i64 10, !199, i64 12}
!269 = !DILocation(line: 71, column: 9, scope: !75)
!270 = !DILocation(line: 72, column: 9, scope: !271)
!271 = distinct !DILexicalBlock(scope: !153, file: !3, line: 72, column: 9)
!272 = !DILocation(line: 73, column: 16, scope: !153)
!273 = distinct !DIAssignID()
!274 = !DILocation(line: 74, column: 20, scope: !153)
!275 = !DILocation(line: 0, scope: !153)
!276 = !DILocation(line: 75, column: 39, scope: !153)
!277 = !DILocation(line: 75, column: 35, scope: !153)
!278 = !DILocation(line: 75, column: 32, scope: !153)
!279 = !DILocation(line: 75, column: 30, scope: !153)
!280 = distinct !DIAssignID()
!281 = !DILocation(line: 76, column: 21, scope: !153)
!282 = distinct !DIAssignID()
!283 = !DILocation(line: 82, column: 9, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !3, line: 82, column: 9)
!285 = distinct !DILexicalBlock(scope: !75, file: !3, line: 81, column: 9)
!286 = !DILocation(line: 82, column: 9, scope: !285)
!287 = !DILocation(line: 85, column: 12, scope: !75)
!288 = distinct !DIAssignID()
!289 = !DILocation(line: 86, column: 16, scope: !75)
!290 = !DILocation(line: 87, column: 35, scope: !75)
!291 = !DILocation(line: 87, column: 31, scope: !75)
!292 = !DILocation(line: 87, column: 28, scope: !75)
!293 = !DILocation(line: 87, column: 26, scope: !75)
!294 = distinct !DIAssignID()
!295 = !DILocation(line: 88, column: 17, scope: !75)
!296 = distinct !DIAssignID()
!297 = !DILocation(line: 91, column: 1, scope: !75)
