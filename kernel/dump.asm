
myos.kernel:     file format elf32-i386


Disassembly of section .text:

c0101000 <deregister_tm_clones>:
c0101000:	b8 18 40 10 c0       	mov    $0xc0104018,%eax
c0101005:	3d 18 40 10 c0       	cmp    $0xc0104018,%eax
c010100a:	74 24                	je     c0101030 <deregister_tm_clones+0x30>
c010100c:	b8 00 00 00 00       	mov    $0x0,%eax
c0101011:	85 c0                	test   %eax,%eax
c0101013:	74 1b                	je     c0101030 <deregister_tm_clones+0x30>
c0101015:	55                   	push   %ebp
c0101016:	89 e5                	mov    %esp,%ebp
c0101018:	83 ec 14             	sub    $0x14,%esp
c010101b:	68 18 40 10 c0       	push   $0xc0104018
c0101020:	ff d0                	call   *%eax
c0101022:	83 c4 10             	add    $0x10,%esp
c0101025:	c9                   	leave
c0101026:	c3                   	ret
c0101027:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
c010102e:	00 
c010102f:	90                   	nop
c0101030:	c3                   	ret
c0101031:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
c0101038:	00 
c0101039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0101040 <register_tm_clones>:
c0101040:	b8 18 40 10 c0       	mov    $0xc0104018,%eax
c0101045:	2d 18 40 10 c0       	sub    $0xc0104018,%eax
c010104a:	89 c2                	mov    %eax,%edx
c010104c:	c1 e8 1f             	shr    $0x1f,%eax
c010104f:	c1 fa 02             	sar    $0x2,%edx
c0101052:	01 d0                	add    %edx,%eax
c0101054:	d1 f8                	sar    $1,%eax
c0101056:	74 20                	je     c0101078 <register_tm_clones+0x38>
c0101058:	ba 00 00 00 00       	mov    $0x0,%edx
c010105d:	85 d2                	test   %edx,%edx
c010105f:	74 17                	je     c0101078 <register_tm_clones+0x38>
c0101061:	55                   	push   %ebp
c0101062:	89 e5                	mov    %esp,%ebp
c0101064:	83 ec 10             	sub    $0x10,%esp
c0101067:	50                   	push   %eax
c0101068:	68 18 40 10 c0       	push   $0xc0104018
c010106d:	ff d2                	call   *%edx
c010106f:	83 c4 10             	add    $0x10,%esp
c0101072:	c9                   	leave
c0101073:	c3                   	ret
c0101074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101078:	c3                   	ret
c0101079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0101080 <__do_global_dtors_aux>:
c0101080:	80 3d 00 50 10 c0 00 	cmpb   $0x0,0xc0105000
c0101087:	75 67                	jne    c01010f0 <__do_global_dtors_aux+0x70>
c0101089:	55                   	push   %ebp
c010108a:	89 e5                	mov    %esp,%ebp
c010108c:	56                   	push   %esi
c010108d:	be 10 40 10 c0       	mov    $0xc0104010,%esi
c0101092:	53                   	push   %ebx
c0101093:	bb 14 40 10 c0       	mov    $0xc0104014,%ebx
c0101098:	a1 04 50 10 c0       	mov    0xc0105004,%eax
c010109d:	81 eb 10 40 10 c0    	sub    $0xc0104010,%ebx
c01010a3:	c1 fb 02             	sar    $0x2,%ebx
c01010a6:	83 eb 01             	sub    $0x1,%ebx
c01010a9:	39 d8                	cmp    %ebx,%eax
c01010ab:	73 17                	jae    c01010c4 <__do_global_dtors_aux+0x44>
c01010ad:	8d 76 00             	lea    0x0(%esi),%esi
c01010b0:	83 c0 01             	add    $0x1,%eax
c01010b3:	a3 04 50 10 c0       	mov    %eax,0xc0105004
c01010b8:	ff 14 86             	call   *(%esi,%eax,4)
c01010bb:	a1 04 50 10 c0       	mov    0xc0105004,%eax
c01010c0:	39 d8                	cmp    %ebx,%eax
c01010c2:	72 ec                	jb     c01010b0 <__do_global_dtors_aux+0x30>
c01010c4:	e8 37 ff ff ff       	call   c0101000 <deregister_tm_clones>
c01010c9:	b8 00 00 00 00       	mov    $0x0,%eax
c01010ce:	85 c0                	test   %eax,%eax
c01010d0:	74 10                	je     c01010e2 <__do_global_dtors_aux+0x62>
c01010d2:	83 ec 0c             	sub    $0xc,%esp
c01010d5:	68 74 31 10 c0       	push   $0xc0103174
c01010da:	e8 21 ef ef 3f       	call   0 <ALIGN-0x1>
c01010df:	83 c4 10             	add    $0x10,%esp
c01010e2:	c6 05 00 50 10 c0 01 	movb   $0x1,0xc0105000
c01010e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01010ec:	5b                   	pop    %ebx
c01010ed:	5e                   	pop    %esi
c01010ee:	5d                   	pop    %ebp
c01010ef:	c3                   	ret
c01010f0:	c3                   	ret
c01010f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
c01010f8:	00 
c01010f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0101100 <frame_dummy>:
c0101100:	b8 00 00 00 00       	mov    $0x0,%eax
c0101105:	85 c0                	test   %eax,%eax
c0101107:	74 27                	je     c0101130 <frame_dummy+0x30>
c0101109:	55                   	push   %ebp
c010110a:	89 e5                	mov    %esp,%ebp
c010110c:	83 ec 10             	sub    $0x10,%esp
c010110f:	68 08 50 10 c0       	push   $0xc0105008
c0101114:	68 74 31 10 c0       	push   $0xc0103174
c0101119:	e8 e2 ee ef 3f       	call   0 <ALIGN-0x1>
c010111e:	83 c4 10             	add    $0x10,%esp
c0101121:	c9                   	leave
c0101122:	e9 19 ff ff ff       	jmp    c0101040 <register_tm_clones>
c0101127:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
c010112e:	00 
c010112f:	90                   	nop
c0101130:	e9 0b ff ff ff       	jmp    c0101040 <register_tm_clones>
c0101135:	bc 00 a0 10 c0       	mov    $0xc010a000,%esp
c010113a:	53                   	push   %ebx
c010113b:	50                   	push   %eax
c010113c:	e8 1c 11 00 00       	call   c010225d <kernel_init>
c0101141:	c7 05 00 a0 10 c0 00 	movl   $0x0,0xc010a000
c0101148:	00 00 00 
c010114b:	0f 20 d9             	mov    %cr3,%ecx
c010114e:	0f 22 d9             	mov    %ecx,%cr3
c0101151:	e8 b3 16 00 00       	call   c0102809 <_init>
c0101156:	e8 26 11 00 00       	call   c0102281 <kernel_main>
c010115b:	fa                   	cli
c010115c:	f4                   	hlt
c010115d:	eb fd                	jmp    c010115c <frame_dummy+0x5c>

c010115f <load_gdt>:
c010115f:	8b 44 24 04          	mov    0x4(%esp),%eax
c0101163:	0f 01 10             	lgdtl  (%eax)
c0101166:	66 b8 10 00          	mov    $0x10,%ax
c010116a:	8e d8                	mov    %eax,%ds
c010116c:	8e c0                	mov    %eax,%es
c010116e:	8e e0                	mov    %eax,%fs
c0101170:	8e e8                	mov    %eax,%gs
c0101172:	8e d0                	mov    %eax,%ss
c0101174:	ea 7b 11 10 c0 08 00 	ljmp   $0x8,$0xc010117b

c010117b <flush>:
c010117b:	c3                   	ret

c010117c <load_idt>:
c010117c:	8b 44 24 04          	mov    0x4(%esp),%eax
c0101180:	0f 01 18             	lidtl  (%eax)
c0101183:	c3                   	ret

c0101184 <pfa_initialize>:
c0101184:	55                   	push   %ebp
c0101185:	89 e5                	mov    %esp,%ebp
c0101187:	83 ec 28             	sub    $0x28,%esp
c010118a:	81 7d 08 02 b0 ad 2b 	cmpl   $0x2badb002,0x8(%ebp)
c0101191:	74 15                	je     c01011a8 <pfa_initialize+0x24>
c0101193:	83 ec 0c             	sub    $0xc,%esp
c0101196:	68 00 30 10 c0       	push   $0xc0103000
c010119b:	e8 88 12 00 00       	call   c0102428 <printf>
c01011a0:	83 c4 10             	add    $0x10,%esp
c01011a3:	e8 b4 15 00 00       	call   c010275c <abort>
c01011a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01011ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01011ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01011b1:	8b 00                	mov    (%eax),%eax
c01011b3:	83 e0 40             	and    $0x40,%eax
c01011b6:	85 c0                	test   %eax,%eax
c01011b8:	75 15                	jne    c01011cf <pfa_initialize+0x4b>
c01011ba:	83 ec 0c             	sub    $0xc,%esp
c01011bd:	68 2d 30 10 c0       	push   $0xc010302d
c01011c2:	e8 61 12 00 00       	call   c0102428 <printf>
c01011c7:	83 c4 10             	add    $0x10,%esp
c01011ca:	e8 8d 15 00 00       	call   c010275c <abort>
c01011cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01011d2:	8b 40 30             	mov    0x30(%eax),%eax
c01011d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011d8:	e9 a5 00 00 00       	jmp    c0101282 <pfa_initialize+0xfe>
c01011dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01011e0:	8b 40 14             	mov    0x14(%eax),%eax
c01011e3:	83 f8 01             	cmp    $0x1,%eax
c01011e6:	0f 85 86 00 00 00    	jne    c0101272 <pfa_initialize+0xee>
c01011ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01011ef:	8b 40 04             	mov    0x4(%eax),%eax
c01011f2:	25 ff 0f 00 00       	and    $0xfff,%eax
c01011f7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01011fa:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01011fe:	74 2e                	je     c010122e <pfa_initialize+0xaa>
c0101200:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101203:	8b 50 04             	mov    0x4(%eax),%edx
c0101206:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101209:	29 c2                	sub    %eax,%edx
c010120b:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0101211:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101214:	89 50 04             	mov    %edx,0x4(%eax)
c0101217:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010121a:	8b 50 0c             	mov    0xc(%eax),%edx
c010121d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101220:	01 d0                	add    %edx,%eax
c0101222:	8d 90 00 f0 ff ff    	lea    -0x1000(%eax),%edx
c0101228:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010122b:	89 50 0c             	mov    %edx,0xc(%eax)
c010122e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101231:	8b 50 04             	mov    0x4(%eax),%edx
c0101234:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101237:	8b 40 0c             	mov    0xc(%eax),%eax
c010123a:	01 d0                	add    %edx,%eax
c010123c:	25 ff 0f 00 00       	and    $0xfff,%eax
c0101241:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101244:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0101248:	74 11                	je     c010125b <pfa_initialize+0xd7>
c010124a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010124d:	8b 50 0c             	mov    0xc(%eax),%edx
c0101250:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101253:	29 c2                	sub    %eax,%edx
c0101255:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101258:	89 50 0c             	mov    %edx,0xc(%eax)
c010125b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010125e:	8b 40 0c             	mov    0xc(%eax),%eax
c0101261:	c1 e8 0c             	shr    $0xc,%eax
c0101264:	89 c2                	mov    %eax,%edx
c0101266:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c010126b:	01 d0                	add    %edx,%eax
c010126d:	a3 00 c0 10 c0       	mov    %eax,0xc010c000
c0101272:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101275:	8b 10                	mov    (%eax),%edx
c0101277:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010127a:	01 d0                	add    %edx,%eax
c010127c:	83 c0 04             	add    $0x4,%eax
c010127f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101282:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101285:	8b 50 30             	mov    0x30(%eax),%edx
c0101288:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010128b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010128e:	01 d0                	add    %edx,%eax
c0101290:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101293:	39 c2                	cmp    %eax,%edx
c0101295:	0f 82 42 ff ff ff    	jb     c01011dd <pfa_initialize+0x59>
c010129b:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c01012a2:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c01012a7:	c1 e0 02             	shl    $0x2,%eax
c01012aa:	ba 80 c8 10 00       	mov    $0x10c880,%edx
c01012af:	01 d0                	add    %edx,%eax
c01012b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01012b7:	25 ff 0f 00 00       	and    $0xfff,%eax
c01012bc:	85 c0                	test   %eax,%eax
c01012be:	74 10                	je     c01012d0 <pfa_initialize+0x14c>
c01012c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01012c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01012c8:	05 00 10 00 00       	add    $0x1000,%eax
c01012cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01012d3:	8b 40 30             	mov    0x30(%eax),%eax
c01012d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012d9:	c7 05 00 c0 10 c0 00 	movl   $0x0,0xc010c000
c01012e0:	00 00 00 
c01012e3:	eb 77                	jmp    c010135c <pfa_initialize+0x1d8>
c01012e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012e8:	8b 40 14             	mov    0x14(%eax),%eax
c01012eb:	83 f8 01             	cmp    $0x1,%eax
c01012ee:	75 5c                	jne    c010134c <pfa_initialize+0x1c8>
c01012f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01012f3:	8b 40 04             	mov    0x4(%eax),%eax
c01012f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01012f9:	eb 3e                	jmp    c0101339 <pfa_initialize+0x1b5>
c01012fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01012fe:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c0101301:	72 08                	jb     c010130b <pfa_initialize+0x187>
c0101303:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101306:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0101309:	72 26                	jb     c0101331 <pfa_initialize+0x1ad>
c010130b:	a1 04 40 10 c0       	mov    0xc0104004,%eax
c0101310:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101313:	89 10                	mov    %edx,(%eax)
c0101315:	a1 04 40 10 c0       	mov    0xc0104004,%eax
c010131a:	83 c0 04             	add    $0x4,%eax
c010131d:	a3 04 40 10 c0       	mov    %eax,0xc0104004
c0101322:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c0101327:	83 c0 01             	add    $0x1,%eax
c010132a:	a3 00 c0 10 c0       	mov    %eax,0xc010c000
c010132f:	eb 01                	jmp    c0101332 <pfa_initialize+0x1ae>
c0101331:	90                   	nop
c0101332:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0101339:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010133c:	8b 50 04             	mov    0x4(%eax),%edx
c010133f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101342:	8b 40 0c             	mov    0xc(%eax),%eax
c0101345:	01 d0                	add    %edx,%eax
c0101347:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c010134a:	72 af                	jb     c01012fb <pfa_initialize+0x177>
c010134c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010134f:	8b 10                	mov    (%eax),%edx
c0101351:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101354:	01 d0                	add    %edx,%eax
c0101356:	83 c0 04             	add    $0x4,%eax
c0101359:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010135c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010135f:	8b 50 30             	mov    0x30(%eax),%edx
c0101362:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101365:	8b 40 2c             	mov    0x2c(%eax),%eax
c0101368:	01 d0                	add    %edx,%eax
c010136a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010136d:	39 c2                	cmp    %eax,%edx
c010136f:	0f 82 70 ff ff ff    	jb     c01012e5 <pfa_initialize+0x161>
c0101375:	90                   	nop
c0101376:	90                   	nop
c0101377:	c9                   	leave
c0101378:	c3                   	ret

c0101379 <kalloc_frame>:
c0101379:	55                   	push   %ebp
c010137a:	89 e5                	mov    %esp,%ebp
c010137c:	83 ec 08             	sub    $0x8,%esp
c010137f:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c0101384:	85 c0                	test   %eax,%eax
c0101386:	75 15                	jne    c010139d <kalloc_frame+0x24>
c0101388:	83 ec 0c             	sub    $0xc,%esp
c010138b:	68 48 30 10 c0       	push   $0xc0103048
c0101390:	e8 93 10 00 00       	call   c0102428 <printf>
c0101395:	83 c4 10             	add    $0x10,%esp
c0101398:	e8 bf 13 00 00       	call   c010275c <abort>
c010139d:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c01013a2:	83 e8 01             	sub    $0x1,%eax
c01013a5:	a3 00 c0 10 c0       	mov    %eax,0xc010c000
c01013aa:	a1 04 40 10 c0       	mov    0xc0104004,%eax
c01013af:	83 e8 04             	sub    $0x4,%eax
c01013b2:	a3 04 40 10 c0       	mov    %eax,0xc0104004
c01013b7:	a1 04 40 10 c0       	mov    0xc0104004,%eax
c01013bc:	8b 00                	mov    (%eax),%eax
c01013be:	c9                   	leave
c01013bf:	c3                   	ret

c01013c0 <kfree_frame>:
c01013c0:	55                   	push   %ebp
c01013c1:	89 e5                	mov    %esp,%ebp
c01013c3:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c01013c8:	83 c0 01             	add    $0x1,%eax
c01013cb:	a3 00 c0 10 c0       	mov    %eax,0xc010c000
c01013d0:	a1 04 40 10 c0       	mov    0xc0104004,%eax
c01013d5:	8b 55 08             	mov    0x8(%ebp),%edx
c01013d8:	89 10                	mov    %edx,(%eax)
c01013da:	a1 04 40 10 c0       	mov    0xc0104004,%eax
c01013df:	83 c0 04             	add    $0x4,%eax
c01013e2:	a3 04 40 10 c0       	mov    %eax,0xc0104004
c01013e7:	90                   	nop
c01013e8:	5d                   	pop    %ebp
c01013e9:	c3                   	ret

c01013ea <outb>:
c01013ea:	55                   	push   %ebp
c01013eb:	89 e5                	mov    %esp,%ebp
c01013ed:	83 ec 08             	sub    $0x8,%esp
c01013f0:	8b 55 08             	mov    0x8(%ebp),%edx
c01013f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013f6:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c01013fa:	88 45 f8             	mov    %al,-0x8(%ebp)
c01013fd:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0101401:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c0101405:	ee                   	out    %al,(%dx)
c0101406:	90                   	nop
c0101407:	c9                   	leave
c0101408:	c3                   	ret

c0101409 <io_wait>:
c0101409:	55                   	push   %ebp
c010140a:	89 e5                	mov    %esp,%ebp
c010140c:	6a 00                	push   $0x0
c010140e:	68 80 00 00 00       	push   $0x80
c0101413:	e8 d2 ff ff ff       	call   c01013ea <outb>
c0101418:	83 c4 08             	add    $0x8,%esp
c010141b:	90                   	nop
c010141c:	c9                   	leave
c010141d:	c3                   	ret

c010141e <init_descriptor_tables>:
c010141e:	55                   	push   %ebp
c010141f:	89 e5                	mov    %esp,%ebp
c0101421:	83 ec 08             	sub    $0x8,%esp
c0101424:	e8 0d 00 00 00       	call   c0101436 <init_gdt>
c0101429:	e8 f8 05 00 00       	call   c0101a26 <remap_pic>
c010142e:	e8 4f 01 00 00       	call   c0101582 <init_idt>
c0101433:	90                   	nop
c0101434:	c9                   	leave
c0101435:	c3                   	ret

c0101436 <init_gdt>:
c0101436:	55                   	push   %ebp
c0101437:	89 e5                	mov    %esp,%ebp
c0101439:	83 ec 08             	sub    $0x8,%esp
c010143c:	66 c7 05 48 c0 10 c0 	movw   $0x27,0xc010c048
c0101443:	27 00 
c0101445:	b8 20 c0 10 c0       	mov    $0xc010c020,%eax
c010144a:	a3 4a c0 10 c0       	mov    %eax,0xc010c04a
c010144f:	83 ec 0c             	sub    $0xc,%esp
c0101452:	6a 00                	push   $0x0
c0101454:	6a 00                	push   $0x0
c0101456:	6a 00                	push   $0x0
c0101458:	6a 00                	push   $0x0
c010145a:	6a 00                	push   $0x0
c010145c:	e8 83 00 00 00       	call   c01014e4 <gdt_set_descriptor>
c0101461:	83 c4 20             	add    $0x20,%esp
c0101464:	83 ec 0c             	sub    $0xc,%esp
c0101467:	68 cf 00 00 00       	push   $0xcf
c010146c:	68 9a 00 00 00       	push   $0x9a
c0101471:	6a ff                	push   $0xffffffff
c0101473:	6a 00                	push   $0x0
c0101475:	6a 01                	push   $0x1
c0101477:	e8 68 00 00 00       	call   c01014e4 <gdt_set_descriptor>
c010147c:	83 c4 20             	add    $0x20,%esp
c010147f:	83 ec 0c             	sub    $0xc,%esp
c0101482:	68 cf 00 00 00       	push   $0xcf
c0101487:	68 92 00 00 00       	push   $0x92
c010148c:	6a ff                	push   $0xffffffff
c010148e:	6a 00                	push   $0x0
c0101490:	6a 02                	push   $0x2
c0101492:	e8 4d 00 00 00       	call   c01014e4 <gdt_set_descriptor>
c0101497:	83 c4 20             	add    $0x20,%esp
c010149a:	83 ec 0c             	sub    $0xc,%esp
c010149d:	68 cf 00 00 00       	push   $0xcf
c01014a2:	68 fa 00 00 00       	push   $0xfa
c01014a7:	6a ff                	push   $0xffffffff
c01014a9:	6a 00                	push   $0x0
c01014ab:	6a 03                	push   $0x3
c01014ad:	e8 32 00 00 00       	call   c01014e4 <gdt_set_descriptor>
c01014b2:	83 c4 20             	add    $0x20,%esp
c01014b5:	83 ec 0c             	sub    $0xc,%esp
c01014b8:	68 cf 00 00 00       	push   $0xcf
c01014bd:	68 f2 00 00 00       	push   $0xf2
c01014c2:	6a ff                	push   $0xffffffff
c01014c4:	6a 00                	push   $0x0
c01014c6:	6a 04                	push   $0x4
c01014c8:	e8 17 00 00 00       	call   c01014e4 <gdt_set_descriptor>
c01014cd:	83 c4 20             	add    $0x20,%esp
c01014d0:	b8 48 c0 10 c0       	mov    $0xc010c048,%eax
c01014d5:	83 ec 0c             	sub    $0xc,%esp
c01014d8:	50                   	push   %eax
c01014d9:	e8 81 fc ff ff       	call   c010115f <load_gdt>
c01014de:	83 c4 10             	add    $0x10,%esp
c01014e1:	90                   	nop
c01014e2:	c9                   	leave
c01014e3:	c3                   	ret

c01014e4 <gdt_set_descriptor>:
c01014e4:	55                   	push   %ebp
c01014e5:	89 e5                	mov    %esp,%ebp
c01014e7:	83 ec 08             	sub    $0x8,%esp
c01014ea:	8b 55 14             	mov    0x14(%ebp),%edx
c01014ed:	8b 45 18             	mov    0x18(%ebp),%eax
c01014f0:	88 55 fc             	mov    %dl,-0x4(%ebp)
c01014f3:	88 45 f8             	mov    %al,-0x8(%ebp)
c01014f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014f9:	89 c2                	mov    %eax,%edx
c01014fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01014fe:	66 89 14 c5 22 c0 10 	mov    %dx,-0x3fef3fde(,%eax,8)
c0101505:	c0 
c0101506:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101509:	c1 e8 10             	shr    $0x10,%eax
c010150c:	89 c2                	mov    %eax,%edx
c010150e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101511:	88 14 c5 24 c0 10 c0 	mov    %dl,-0x3fef3fdc(,%eax,8)
c0101518:	8b 45 0c             	mov    0xc(%ebp),%eax
c010151b:	c1 e8 18             	shr    $0x18,%eax
c010151e:	89 c2                	mov    %eax,%edx
c0101520:	8b 45 08             	mov    0x8(%ebp),%eax
c0101523:	88 14 c5 27 c0 10 c0 	mov    %dl,-0x3fef3fd9(,%eax,8)
c010152a:	8b 45 10             	mov    0x10(%ebp),%eax
c010152d:	89 c2                	mov    %eax,%edx
c010152f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101532:	66 89 14 c5 20 c0 10 	mov    %dx,-0x3fef3fe0(,%eax,8)
c0101539:	c0 
c010153a:	8b 45 10             	mov    0x10(%ebp),%eax
c010153d:	c1 e8 10             	shr    $0x10,%eax
c0101540:	83 e0 0f             	and    $0xf,%eax
c0101543:	89 c2                	mov    %eax,%edx
c0101545:	8b 45 08             	mov    0x8(%ebp),%eax
c0101548:	88 14 c5 26 c0 10 c0 	mov    %dl,-0x3fef3fda(,%eax,8)
c010154f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101552:	0f b6 04 c5 26 c0 10 	movzbl -0x3fef3fda(,%eax,8),%eax
c0101559:	c0 
c010155a:	89 c2                	mov    %eax,%edx
c010155c:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0101560:	83 e0 f0             	and    $0xfffffff0,%eax
c0101563:	09 d0                	or     %edx,%eax
c0101565:	89 c2                	mov    %eax,%edx
c0101567:	8b 45 08             	mov    0x8(%ebp),%eax
c010156a:	88 14 c5 26 c0 10 c0 	mov    %dl,-0x3fef3fda(,%eax,8)
c0101571:	8b 45 08             	mov    0x8(%ebp),%eax
c0101574:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0101578:	88 14 c5 25 c0 10 c0 	mov    %dl,-0x3fef3fdb(,%eax,8)
c010157f:	90                   	nop
c0101580:	c9                   	leave
c0101581:	c3                   	ret

c0101582 <init_idt>:
c0101582:	55                   	push   %ebp
c0101583:	89 e5                	mov    %esp,%ebp
c0101585:	83 ec 08             	sub    $0x8,%esp
c0101588:	83 ec 0c             	sub    $0xc,%esp
c010158b:	68 69 30 10 c0       	push   $0xc0103069
c0101590:	e8 93 0e 00 00       	call   c0102428 <printf>
c0101595:	83 c4 10             	add    $0x10,%esp
c0101598:	66 c7 05 60 c8 10 c0 	movw   $0x7ff,0xc010c860
c010159f:	ff 07 
c01015a1:	b8 60 c0 10 c0       	mov    $0xc010c060,%eax
c01015a6:	a3 62 c8 10 c0       	mov    %eax,0xc010c862
c01015ab:	83 ec 04             	sub    $0x4,%esp
c01015ae:	68 00 08 00 00       	push   $0x800
c01015b3:	6a 00                	push   $0x0
c01015b5:	68 60 c0 10 c0       	push   $0xc010c060
c01015ba:	e8 b7 11 00 00       	call   c0102776 <memset>
c01015bf:	83 c4 10             	add    $0x10,%esp
c01015c2:	b8 c0 1b 10 c0       	mov    $0xc0101bc0,%eax
c01015c7:	68 8e 00 00 00       	push   $0x8e
c01015cc:	6a 08                	push   $0x8
c01015ce:	50                   	push   %eax
c01015cf:	6a 00                	push   $0x0
c01015d1:	e8 36 05 00 00       	call   c0101b0c <idt_set_gate>
c01015d6:	83 c4 10             	add    $0x10,%esp
c01015d9:	b8 c7 1b 10 c0       	mov    $0xc0101bc7,%eax
c01015de:	68 8e 00 00 00       	push   $0x8e
c01015e3:	6a 08                	push   $0x8
c01015e5:	50                   	push   %eax
c01015e6:	6a 01                	push   $0x1
c01015e8:	e8 1f 05 00 00       	call   c0101b0c <idt_set_gate>
c01015ed:	83 c4 10             	add    $0x10,%esp
c01015f0:	b8 ce 1b 10 c0       	mov    $0xc0101bce,%eax
c01015f5:	68 8e 00 00 00       	push   $0x8e
c01015fa:	6a 08                	push   $0x8
c01015fc:	50                   	push   %eax
c01015fd:	6a 02                	push   $0x2
c01015ff:	e8 08 05 00 00       	call   c0101b0c <idt_set_gate>
c0101604:	83 c4 10             	add    $0x10,%esp
c0101607:	b8 d5 1b 10 c0       	mov    $0xc0101bd5,%eax
c010160c:	68 8e 00 00 00       	push   $0x8e
c0101611:	6a 08                	push   $0x8
c0101613:	50                   	push   %eax
c0101614:	6a 03                	push   $0x3
c0101616:	e8 f1 04 00 00       	call   c0101b0c <idt_set_gate>
c010161b:	83 c4 10             	add    $0x10,%esp
c010161e:	b8 dc 1b 10 c0       	mov    $0xc0101bdc,%eax
c0101623:	68 8e 00 00 00       	push   $0x8e
c0101628:	6a 08                	push   $0x8
c010162a:	50                   	push   %eax
c010162b:	6a 04                	push   $0x4
c010162d:	e8 da 04 00 00       	call   c0101b0c <idt_set_gate>
c0101632:	83 c4 10             	add    $0x10,%esp
c0101635:	b8 e3 1b 10 c0       	mov    $0xc0101be3,%eax
c010163a:	68 8e 00 00 00       	push   $0x8e
c010163f:	6a 08                	push   $0x8
c0101641:	50                   	push   %eax
c0101642:	6a 05                	push   $0x5
c0101644:	e8 c3 04 00 00       	call   c0101b0c <idt_set_gate>
c0101649:	83 c4 10             	add    $0x10,%esp
c010164c:	b8 ea 1b 10 c0       	mov    $0xc0101bea,%eax
c0101651:	68 8e 00 00 00       	push   $0x8e
c0101656:	6a 08                	push   $0x8
c0101658:	50                   	push   %eax
c0101659:	6a 06                	push   $0x6
c010165b:	e8 ac 04 00 00       	call   c0101b0c <idt_set_gate>
c0101660:	83 c4 10             	add    $0x10,%esp
c0101663:	b8 f1 1b 10 c0       	mov    $0xc0101bf1,%eax
c0101668:	68 8e 00 00 00       	push   $0x8e
c010166d:	6a 08                	push   $0x8
c010166f:	50                   	push   %eax
c0101670:	6a 07                	push   $0x7
c0101672:	e8 95 04 00 00       	call   c0101b0c <idt_set_gate>
c0101677:	83 c4 10             	add    $0x10,%esp
c010167a:	b8 f6 1b 10 c0       	mov    $0xc0101bf6,%eax
c010167f:	68 8e 00 00 00       	push   $0x8e
c0101684:	6a 08                	push   $0x8
c0101686:	50                   	push   %eax
c0101687:	6a 08                	push   $0x8
c0101689:	e8 7e 04 00 00       	call   c0101b0c <idt_set_gate>
c010168e:	83 c4 10             	add    $0x10,%esp
c0101691:	b8 00 1c 10 c0       	mov    $0xc0101c00,%eax
c0101696:	68 8e 00 00 00       	push   $0x8e
c010169b:	6a 08                	push   $0x8
c010169d:	50                   	push   %eax
c010169e:	6a 09                	push   $0x9
c01016a0:	e8 67 04 00 00       	call   c0101b0c <idt_set_gate>
c01016a5:	83 c4 10             	add    $0x10,%esp
c01016a8:	b8 08 1c 10 c0       	mov    $0xc0101c08,%eax
c01016ad:	68 8e 00 00 00       	push   $0x8e
c01016b2:	6a 08                	push   $0x8
c01016b4:	50                   	push   %eax
c01016b5:	6a 0a                	push   $0xa
c01016b7:	e8 50 04 00 00       	call   c0101b0c <idt_set_gate>
c01016bc:	83 c4 10             	add    $0x10,%esp
c01016bf:	b8 10 1c 10 c0       	mov    $0xc0101c10,%eax
c01016c4:	68 8e 00 00 00       	push   $0x8e
c01016c9:	6a 08                	push   $0x8
c01016cb:	50                   	push   %eax
c01016cc:	6a 0b                	push   $0xb
c01016ce:	e8 39 04 00 00       	call   c0101b0c <idt_set_gate>
c01016d3:	83 c4 10             	add    $0x10,%esp
c01016d6:	b8 18 1c 10 c0       	mov    $0xc0101c18,%eax
c01016db:	68 8e 00 00 00       	push   $0x8e
c01016e0:	6a 08                	push   $0x8
c01016e2:	50                   	push   %eax
c01016e3:	6a 0c                	push   $0xc
c01016e5:	e8 22 04 00 00       	call   c0101b0c <idt_set_gate>
c01016ea:	83 c4 10             	add    $0x10,%esp
c01016ed:	b8 20 1c 10 c0       	mov    $0xc0101c20,%eax
c01016f2:	68 8e 00 00 00       	push   $0x8e
c01016f7:	6a 08                	push   $0x8
c01016f9:	50                   	push   %eax
c01016fa:	6a 0d                	push   $0xd
c01016fc:	e8 0b 04 00 00       	call   c0101b0c <idt_set_gate>
c0101701:	83 c4 10             	add    $0x10,%esp
c0101704:	b8 28 1c 10 c0       	mov    $0xc0101c28,%eax
c0101709:	68 8e 00 00 00       	push   $0x8e
c010170e:	6a 08                	push   $0x8
c0101710:	50                   	push   %eax
c0101711:	6a 0e                	push   $0xe
c0101713:	e8 f4 03 00 00       	call   c0101b0c <idt_set_gate>
c0101718:	83 c4 10             	add    $0x10,%esp
c010171b:	b8 32 1c 10 c0       	mov    $0xc0101c32,%eax
c0101720:	68 8e 00 00 00       	push   $0x8e
c0101725:	6a 08                	push   $0x8
c0101727:	50                   	push   %eax
c0101728:	6a 0f                	push   $0xf
c010172a:	e8 dd 03 00 00       	call   c0101b0c <idt_set_gate>
c010172f:	83 c4 10             	add    $0x10,%esp
c0101732:	b8 3c 1c 10 c0       	mov    $0xc0101c3c,%eax
c0101737:	68 8e 00 00 00       	push   $0x8e
c010173c:	6a 08                	push   $0x8
c010173e:	50                   	push   %eax
c010173f:	6a 10                	push   $0x10
c0101741:	e8 c6 03 00 00       	call   c0101b0c <idt_set_gate>
c0101746:	83 c4 10             	add    $0x10,%esp
c0101749:	b8 46 1c 10 c0       	mov    $0xc0101c46,%eax
c010174e:	68 8e 00 00 00       	push   $0x8e
c0101753:	6a 08                	push   $0x8
c0101755:	50                   	push   %eax
c0101756:	6a 11                	push   $0x11
c0101758:	e8 af 03 00 00       	call   c0101b0c <idt_set_gate>
c010175d:	83 c4 10             	add    $0x10,%esp
c0101760:	b8 50 1c 10 c0       	mov    $0xc0101c50,%eax
c0101765:	68 8e 00 00 00       	push   $0x8e
c010176a:	6a 08                	push   $0x8
c010176c:	50                   	push   %eax
c010176d:	6a 12                	push   $0x12
c010176f:	e8 98 03 00 00       	call   c0101b0c <idt_set_gate>
c0101774:	83 c4 10             	add    $0x10,%esp
c0101777:	b8 5a 1c 10 c0       	mov    $0xc0101c5a,%eax
c010177c:	68 8e 00 00 00       	push   $0x8e
c0101781:	6a 08                	push   $0x8
c0101783:	50                   	push   %eax
c0101784:	6a 13                	push   $0x13
c0101786:	e8 81 03 00 00       	call   c0101b0c <idt_set_gate>
c010178b:	83 c4 10             	add    $0x10,%esp
c010178e:	b8 64 1c 10 c0       	mov    $0xc0101c64,%eax
c0101793:	68 8e 00 00 00       	push   $0x8e
c0101798:	6a 08                	push   $0x8
c010179a:	50                   	push   %eax
c010179b:	6a 14                	push   $0x14
c010179d:	e8 6a 03 00 00       	call   c0101b0c <idt_set_gate>
c01017a2:	83 c4 10             	add    $0x10,%esp
c01017a5:	b8 6e 1c 10 c0       	mov    $0xc0101c6e,%eax
c01017aa:	68 8e 00 00 00       	push   $0x8e
c01017af:	6a 08                	push   $0x8
c01017b1:	50                   	push   %eax
c01017b2:	6a 15                	push   $0x15
c01017b4:	e8 53 03 00 00       	call   c0101b0c <idt_set_gate>
c01017b9:	83 c4 10             	add    $0x10,%esp
c01017bc:	b8 78 1c 10 c0       	mov    $0xc0101c78,%eax
c01017c1:	68 8e 00 00 00       	push   $0x8e
c01017c6:	6a 08                	push   $0x8
c01017c8:	50                   	push   %eax
c01017c9:	6a 16                	push   $0x16
c01017cb:	e8 3c 03 00 00       	call   c0101b0c <idt_set_gate>
c01017d0:	83 c4 10             	add    $0x10,%esp
c01017d3:	b8 82 1c 10 c0       	mov    $0xc0101c82,%eax
c01017d8:	68 8e 00 00 00       	push   $0x8e
c01017dd:	6a 08                	push   $0x8
c01017df:	50                   	push   %eax
c01017e0:	6a 17                	push   $0x17
c01017e2:	e8 25 03 00 00       	call   c0101b0c <idt_set_gate>
c01017e7:	83 c4 10             	add    $0x10,%esp
c01017ea:	b8 8c 1c 10 c0       	mov    $0xc0101c8c,%eax
c01017ef:	68 8e 00 00 00       	push   $0x8e
c01017f4:	6a 08                	push   $0x8
c01017f6:	50                   	push   %eax
c01017f7:	6a 18                	push   $0x18
c01017f9:	e8 0e 03 00 00       	call   c0101b0c <idt_set_gate>
c01017fe:	83 c4 10             	add    $0x10,%esp
c0101801:	b8 96 1c 10 c0       	mov    $0xc0101c96,%eax
c0101806:	68 8e 00 00 00       	push   $0x8e
c010180b:	6a 08                	push   $0x8
c010180d:	50                   	push   %eax
c010180e:	6a 19                	push   $0x19
c0101810:	e8 f7 02 00 00       	call   c0101b0c <idt_set_gate>
c0101815:	83 c4 10             	add    $0x10,%esp
c0101818:	b8 a0 1c 10 c0       	mov    $0xc0101ca0,%eax
c010181d:	68 8e 00 00 00       	push   $0x8e
c0101822:	6a 08                	push   $0x8
c0101824:	50                   	push   %eax
c0101825:	6a 1a                	push   $0x1a
c0101827:	e8 e0 02 00 00       	call   c0101b0c <idt_set_gate>
c010182c:	83 c4 10             	add    $0x10,%esp
c010182f:	b8 aa 1c 10 c0       	mov    $0xc0101caa,%eax
c0101834:	68 8e 00 00 00       	push   $0x8e
c0101839:	6a 08                	push   $0x8
c010183b:	50                   	push   %eax
c010183c:	6a 1b                	push   $0x1b
c010183e:	e8 c9 02 00 00       	call   c0101b0c <idt_set_gate>
c0101843:	83 c4 10             	add    $0x10,%esp
c0101846:	b8 b4 1c 10 c0       	mov    $0xc0101cb4,%eax
c010184b:	68 8e 00 00 00       	push   $0x8e
c0101850:	6a 08                	push   $0x8
c0101852:	50                   	push   %eax
c0101853:	6a 1c                	push   $0x1c
c0101855:	e8 b2 02 00 00       	call   c0101b0c <idt_set_gate>
c010185a:	83 c4 10             	add    $0x10,%esp
c010185d:	b8 be 1c 10 c0       	mov    $0xc0101cbe,%eax
c0101862:	68 8e 00 00 00       	push   $0x8e
c0101867:	6a 08                	push   $0x8
c0101869:	50                   	push   %eax
c010186a:	6a 1d                	push   $0x1d
c010186c:	e8 9b 02 00 00       	call   c0101b0c <idt_set_gate>
c0101871:	83 c4 10             	add    $0x10,%esp
c0101874:	b8 c8 1c 10 c0       	mov    $0xc0101cc8,%eax
c0101879:	68 8e 00 00 00       	push   $0x8e
c010187e:	6a 08                	push   $0x8
c0101880:	50                   	push   %eax
c0101881:	6a 1e                	push   $0x1e
c0101883:	e8 84 02 00 00       	call   c0101b0c <idt_set_gate>
c0101888:	83 c4 10             	add    $0x10,%esp
c010188b:	b8 d2 1c 10 c0       	mov    $0xc0101cd2,%eax
c0101890:	68 8e 00 00 00       	push   $0x8e
c0101895:	6a 08                	push   $0x8
c0101897:	50                   	push   %eax
c0101898:	6a 1f                	push   $0x1f
c010189a:	e8 6d 02 00 00       	call   c0101b0c <idt_set_gate>
c010189f:	83 c4 10             	add    $0x10,%esp
c01018a2:	b8 dc 1c 10 c0       	mov    $0xc0101cdc,%eax
c01018a7:	68 8e 00 00 00       	push   $0x8e
c01018ac:	6a 08                	push   $0x8
c01018ae:	50                   	push   %eax
c01018af:	6a 20                	push   $0x20
c01018b1:	e8 56 02 00 00       	call   c0101b0c <idt_set_gate>
c01018b6:	83 c4 10             	add    $0x10,%esp
c01018b9:	b8 e6 1c 10 c0       	mov    $0xc0101ce6,%eax
c01018be:	68 8e 00 00 00       	push   $0x8e
c01018c3:	6a 08                	push   $0x8
c01018c5:	50                   	push   %eax
c01018c6:	6a 21                	push   $0x21
c01018c8:	e8 3f 02 00 00       	call   c0101b0c <idt_set_gate>
c01018cd:	83 c4 10             	add    $0x10,%esp
c01018d0:	b8 f0 1c 10 c0       	mov    $0xc0101cf0,%eax
c01018d5:	68 8e 00 00 00       	push   $0x8e
c01018da:	6a 08                	push   $0x8
c01018dc:	50                   	push   %eax
c01018dd:	6a 22                	push   $0x22
c01018df:	e8 28 02 00 00       	call   c0101b0c <idt_set_gate>
c01018e4:	83 c4 10             	add    $0x10,%esp
c01018e7:	b8 fa 1c 10 c0       	mov    $0xc0101cfa,%eax
c01018ec:	68 8e 00 00 00       	push   $0x8e
c01018f1:	6a 08                	push   $0x8
c01018f3:	50                   	push   %eax
c01018f4:	6a 23                	push   $0x23
c01018f6:	e8 11 02 00 00       	call   c0101b0c <idt_set_gate>
c01018fb:	83 c4 10             	add    $0x10,%esp
c01018fe:	b8 04 1d 10 c0       	mov    $0xc0101d04,%eax
c0101903:	68 8e 00 00 00       	push   $0x8e
c0101908:	6a 08                	push   $0x8
c010190a:	50                   	push   %eax
c010190b:	6a 24                	push   $0x24
c010190d:	e8 fa 01 00 00       	call   c0101b0c <idt_set_gate>
c0101912:	83 c4 10             	add    $0x10,%esp
c0101915:	b8 0e 1d 10 c0       	mov    $0xc0101d0e,%eax
c010191a:	68 8e 00 00 00       	push   $0x8e
c010191f:	6a 08                	push   $0x8
c0101921:	50                   	push   %eax
c0101922:	6a 25                	push   $0x25
c0101924:	e8 e3 01 00 00       	call   c0101b0c <idt_set_gate>
c0101929:	83 c4 10             	add    $0x10,%esp
c010192c:	b8 18 1d 10 c0       	mov    $0xc0101d18,%eax
c0101931:	68 8e 00 00 00       	push   $0x8e
c0101936:	6a 08                	push   $0x8
c0101938:	50                   	push   %eax
c0101939:	6a 26                	push   $0x26
c010193b:	e8 cc 01 00 00       	call   c0101b0c <idt_set_gate>
c0101940:	83 c4 10             	add    $0x10,%esp
c0101943:	b8 22 1d 10 c0       	mov    $0xc0101d22,%eax
c0101948:	68 8e 00 00 00       	push   $0x8e
c010194d:	6a 08                	push   $0x8
c010194f:	50                   	push   %eax
c0101950:	6a 27                	push   $0x27
c0101952:	e8 b5 01 00 00       	call   c0101b0c <idt_set_gate>
c0101957:	83 c4 10             	add    $0x10,%esp
c010195a:	b8 2c 1d 10 c0       	mov    $0xc0101d2c,%eax
c010195f:	68 8e 00 00 00       	push   $0x8e
c0101964:	6a 08                	push   $0x8
c0101966:	50                   	push   %eax
c0101967:	6a 28                	push   $0x28
c0101969:	e8 9e 01 00 00       	call   c0101b0c <idt_set_gate>
c010196e:	83 c4 10             	add    $0x10,%esp
c0101971:	b8 36 1d 10 c0       	mov    $0xc0101d36,%eax
c0101976:	68 8e 00 00 00       	push   $0x8e
c010197b:	6a 08                	push   $0x8
c010197d:	50                   	push   %eax
c010197e:	6a 29                	push   $0x29
c0101980:	e8 87 01 00 00       	call   c0101b0c <idt_set_gate>
c0101985:	83 c4 10             	add    $0x10,%esp
c0101988:	b8 40 1d 10 c0       	mov    $0xc0101d40,%eax
c010198d:	68 8e 00 00 00       	push   $0x8e
c0101992:	6a 08                	push   $0x8
c0101994:	50                   	push   %eax
c0101995:	6a 2a                	push   $0x2a
c0101997:	e8 70 01 00 00       	call   c0101b0c <idt_set_gate>
c010199c:	83 c4 10             	add    $0x10,%esp
c010199f:	b8 4a 1d 10 c0       	mov    $0xc0101d4a,%eax
c01019a4:	68 8e 00 00 00       	push   $0x8e
c01019a9:	6a 08                	push   $0x8
c01019ab:	50                   	push   %eax
c01019ac:	6a 2b                	push   $0x2b
c01019ae:	e8 59 01 00 00       	call   c0101b0c <idt_set_gate>
c01019b3:	83 c4 10             	add    $0x10,%esp
c01019b6:	b8 54 1d 10 c0       	mov    $0xc0101d54,%eax
c01019bb:	68 8e 00 00 00       	push   $0x8e
c01019c0:	6a 08                	push   $0x8
c01019c2:	50                   	push   %eax
c01019c3:	6a 2c                	push   $0x2c
c01019c5:	e8 42 01 00 00       	call   c0101b0c <idt_set_gate>
c01019ca:	83 c4 10             	add    $0x10,%esp
c01019cd:	b8 5e 1d 10 c0       	mov    $0xc0101d5e,%eax
c01019d2:	68 8e 00 00 00       	push   $0x8e
c01019d7:	6a 08                	push   $0x8
c01019d9:	50                   	push   %eax
c01019da:	6a 2d                	push   $0x2d
c01019dc:	e8 2b 01 00 00       	call   c0101b0c <idt_set_gate>
c01019e1:	83 c4 10             	add    $0x10,%esp
c01019e4:	b8 68 1d 10 c0       	mov    $0xc0101d68,%eax
c01019e9:	68 8e 00 00 00       	push   $0x8e
c01019ee:	6a 08                	push   $0x8
c01019f0:	50                   	push   %eax
c01019f1:	6a 2e                	push   $0x2e
c01019f3:	e8 14 01 00 00       	call   c0101b0c <idt_set_gate>
c01019f8:	83 c4 10             	add    $0x10,%esp
c01019fb:	b8 72 1d 10 c0       	mov    $0xc0101d72,%eax
c0101a00:	68 8e 00 00 00       	push   $0x8e
c0101a05:	6a 08                	push   $0x8
c0101a07:	50                   	push   %eax
c0101a08:	6a 2f                	push   $0x2f
c0101a0a:	e8 fd 00 00 00       	call   c0101b0c <idt_set_gate>
c0101a0f:	83 c4 10             	add    $0x10,%esp
c0101a12:	b8 60 c8 10 c0       	mov    $0xc010c860,%eax
c0101a17:	83 ec 0c             	sub    $0xc,%esp
c0101a1a:	50                   	push   %eax
c0101a1b:	e8 5c f7 ff ff       	call   c010117c <load_idt>
c0101a20:	83 c4 10             	add    $0x10,%esp
c0101a23:	90                   	nop
c0101a24:	c9                   	leave
c0101a25:	c3                   	ret

c0101a26 <remap_pic>:
c0101a26:	55                   	push   %ebp
c0101a27:	89 e5                	mov    %esp,%ebp
c0101a29:	83 ec 08             	sub    $0x8,%esp
c0101a2c:	83 ec 0c             	sub    $0xc,%esp
c0101a2f:	68 73 30 10 c0       	push   $0xc0103073
c0101a34:	e8 ef 09 00 00       	call   c0102428 <printf>
c0101a39:	83 c4 10             	add    $0x10,%esp
c0101a3c:	83 ec 08             	sub    $0x8,%esp
c0101a3f:	6a 11                	push   $0x11
c0101a41:	6a 20                	push   $0x20
c0101a43:	e8 a2 f9 ff ff       	call   c01013ea <outb>
c0101a48:	83 c4 10             	add    $0x10,%esp
c0101a4b:	e8 b9 f9 ff ff       	call   c0101409 <io_wait>
c0101a50:	83 ec 08             	sub    $0x8,%esp
c0101a53:	6a 11                	push   $0x11
c0101a55:	68 a0 00 00 00       	push   $0xa0
c0101a5a:	e8 8b f9 ff ff       	call   c01013ea <outb>
c0101a5f:	83 c4 10             	add    $0x10,%esp
c0101a62:	e8 a2 f9 ff ff       	call   c0101409 <io_wait>
c0101a67:	83 ec 08             	sub    $0x8,%esp
c0101a6a:	6a 20                	push   $0x20
c0101a6c:	6a 21                	push   $0x21
c0101a6e:	e8 77 f9 ff ff       	call   c01013ea <outb>
c0101a73:	83 c4 10             	add    $0x10,%esp
c0101a76:	e8 8e f9 ff ff       	call   c0101409 <io_wait>
c0101a7b:	83 ec 08             	sub    $0x8,%esp
c0101a7e:	6a 28                	push   $0x28
c0101a80:	68 a1 00 00 00       	push   $0xa1
c0101a85:	e8 60 f9 ff ff       	call   c01013ea <outb>
c0101a8a:	83 c4 10             	add    $0x10,%esp
c0101a8d:	e8 77 f9 ff ff       	call   c0101409 <io_wait>
c0101a92:	83 ec 08             	sub    $0x8,%esp
c0101a95:	6a 04                	push   $0x4
c0101a97:	6a 21                	push   $0x21
c0101a99:	e8 4c f9 ff ff       	call   c01013ea <outb>
c0101a9e:	83 c4 10             	add    $0x10,%esp
c0101aa1:	e8 63 f9 ff ff       	call   c0101409 <io_wait>
c0101aa6:	83 ec 08             	sub    $0x8,%esp
c0101aa9:	6a 02                	push   $0x2
c0101aab:	68 a1 00 00 00       	push   $0xa1
c0101ab0:	e8 35 f9 ff ff       	call   c01013ea <outb>
c0101ab5:	83 c4 10             	add    $0x10,%esp
c0101ab8:	e8 4c f9 ff ff       	call   c0101409 <io_wait>
c0101abd:	83 ec 08             	sub    $0x8,%esp
c0101ac0:	6a 01                	push   $0x1
c0101ac2:	6a 21                	push   $0x21
c0101ac4:	e8 21 f9 ff ff       	call   c01013ea <outb>
c0101ac9:	83 c4 10             	add    $0x10,%esp
c0101acc:	e8 38 f9 ff ff       	call   c0101409 <io_wait>
c0101ad1:	83 ec 08             	sub    $0x8,%esp
c0101ad4:	6a 01                	push   $0x1
c0101ad6:	68 a1 00 00 00       	push   $0xa1
c0101adb:	e8 0a f9 ff ff       	call   c01013ea <outb>
c0101ae0:	83 c4 10             	add    $0x10,%esp
c0101ae3:	e8 21 f9 ff ff       	call   c0101409 <io_wait>
c0101ae8:	83 ec 08             	sub    $0x8,%esp
c0101aeb:	6a 00                	push   $0x0
c0101aed:	6a 21                	push   $0x21
c0101aef:	e8 f6 f8 ff ff       	call   c01013ea <outb>
c0101af4:	83 c4 10             	add    $0x10,%esp
c0101af7:	83 ec 08             	sub    $0x8,%esp
c0101afa:	6a 00                	push   $0x0
c0101afc:	68 a1 00 00 00       	push   $0xa1
c0101b01:	e8 e4 f8 ff ff       	call   c01013ea <outb>
c0101b06:	83 c4 10             	add    $0x10,%esp
c0101b09:	90                   	nop
c0101b0a:	c9                   	leave
c0101b0b:	c3                   	ret

c0101b0c <idt_set_gate>:
c0101b0c:	55                   	push   %ebp
c0101b0d:	89 e5                	mov    %esp,%ebp
c0101b0f:	83 ec 0c             	sub    $0xc,%esp
c0101b12:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101b15:	8b 55 10             	mov    0x10(%ebp),%edx
c0101b18:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b1b:	88 4d fc             	mov    %cl,-0x4(%ebp)
c0101b1e:	66 89 55 f8          	mov    %dx,-0x8(%ebp)
c0101b22:	88 45 f4             	mov    %al,-0xc(%ebp)
c0101b25:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0101b29:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101b2c:	66 89 14 c5 60 c0 10 	mov    %dx,-0x3fef3fa0(,%eax,8)
c0101b33:	c0 
c0101b34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b37:	c1 e8 10             	shr    $0x10,%eax
c0101b3a:	89 c2                	mov    %eax,%edx
c0101b3c:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0101b40:	66 89 14 c5 66 c0 10 	mov    %dx,-0x3fef3f9a(,%eax,8)
c0101b47:	c0 
c0101b48:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0101b4c:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
c0101b50:	66 89 14 c5 62 c0 10 	mov    %dx,-0x3fef3f9e(,%eax,8)
c0101b57:	c0 
c0101b58:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0101b5c:	c6 04 c5 64 c0 10 c0 	movb   $0x0,-0x3fef3f9c(,%eax,8)
c0101b63:	00 
c0101b64:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c0101b68:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
c0101b6c:	88 14 c5 65 c0 10 c0 	mov    %dl,-0x3fef3f9b(,%eax,8)
c0101b73:	90                   	nop
c0101b74:	c9                   	leave
c0101b75:	c3                   	ret

c0101b76 <isr_common_stub>:
c0101b76:	60                   	pusha
c0101b77:	66 8c d8             	mov    %ds,%ax
c0101b7a:	50                   	push   %eax
c0101b7b:	66 b8 10 00          	mov    $0x10,%ax
c0101b7f:	8e d8                	mov    %eax,%ds
c0101b81:	8e c0                	mov    %eax,%es
c0101b83:	8e e0                	mov    %eax,%fs
c0101b85:	8e e8                	mov    %eax,%gs
c0101b87:	e8 2c 02 00 00       	call   c0101db8 <isr_handler>
c0101b8c:	58                   	pop    %eax
c0101b8d:	8e d8                	mov    %eax,%ds
c0101b8f:	8e c0                	mov    %eax,%es
c0101b91:	8e e0                	mov    %eax,%fs
c0101b93:	8e e8                	mov    %eax,%gs
c0101b95:	61                   	popa
c0101b96:	83 c4 08             	add    $0x8,%esp
c0101b99:	fb                   	sti
c0101b9a:	cf                   	iret

c0101b9b <irq_common_stub>:
c0101b9b:	60                   	pusha
c0101b9c:	66 8c d8             	mov    %ds,%ax
c0101b9f:	50                   	push   %eax
c0101ba0:	66 b8 10 00          	mov    $0x10,%ax
c0101ba4:	8e d8                	mov    %eax,%ds
c0101ba6:	8e c0                	mov    %eax,%es
c0101ba8:	8e e0                	mov    %eax,%fs
c0101baa:	8e e8                	mov    %eax,%gs
c0101bac:	e8 48 02 00 00       	call   c0101df9 <irq_handler>
c0101bb1:	58                   	pop    %eax
c0101bb2:	8e d8                	mov    %eax,%ds
c0101bb4:	8e c0                	mov    %eax,%es
c0101bb6:	8e e0                	mov    %eax,%fs
c0101bb8:	8e e8                	mov    %eax,%gs
c0101bba:	61                   	popa
c0101bbb:	83 c4 08             	add    $0x8,%esp
c0101bbe:	fb                   	sti
c0101bbf:	cf                   	iret

c0101bc0 <isr0>:
c0101bc0:	fa                   	cli
c0101bc1:	6a 00                	push   $0x0
c0101bc3:	6a 00                	push   $0x0
c0101bc5:	eb af                	jmp    c0101b76 <isr_common_stub>

c0101bc7 <isr1>:
c0101bc7:	fa                   	cli
c0101bc8:	6a 00                	push   $0x0
c0101bca:	6a 01                	push   $0x1
c0101bcc:	eb a8                	jmp    c0101b76 <isr_common_stub>

c0101bce <isr2>:
c0101bce:	fa                   	cli
c0101bcf:	6a 00                	push   $0x0
c0101bd1:	6a 02                	push   $0x2
c0101bd3:	eb a1                	jmp    c0101b76 <isr_common_stub>

c0101bd5 <isr3>:
c0101bd5:	fa                   	cli
c0101bd6:	6a 00                	push   $0x0
c0101bd8:	6a 03                	push   $0x3
c0101bda:	eb 9a                	jmp    c0101b76 <isr_common_stub>

c0101bdc <isr4>:
c0101bdc:	fa                   	cli
c0101bdd:	6a 00                	push   $0x0
c0101bdf:	6a 04                	push   $0x4
c0101be1:	eb 93                	jmp    c0101b76 <isr_common_stub>

c0101be3 <isr5>:
c0101be3:	fa                   	cli
c0101be4:	6a 00                	push   $0x0
c0101be6:	6a 05                	push   $0x5
c0101be8:	eb 8c                	jmp    c0101b76 <isr_common_stub>

c0101bea <isr6>:
c0101bea:	fa                   	cli
c0101beb:	6a 00                	push   $0x0
c0101bed:	6a 06                	push   $0x6
c0101bef:	eb 85                	jmp    c0101b76 <isr_common_stub>

c0101bf1 <isr7>:
c0101bf1:	fa                   	cli
c0101bf2:	6a 07                	push   $0x7
c0101bf4:	eb 80                	jmp    c0101b76 <isr_common_stub>

c0101bf6 <isr8>:
c0101bf6:	fa                   	cli
c0101bf7:	6a 00                	push   $0x0
c0101bf9:	6a 08                	push   $0x8
c0101bfb:	e9 76 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c00 <isr9>:
c0101c00:	fa                   	cli
c0101c01:	6a 09                	push   $0x9
c0101c03:	e9 6e ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c08 <isr10>:
c0101c08:	fa                   	cli
c0101c09:	6a 0a                	push   $0xa
c0101c0b:	e9 66 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c10 <isr11>:
c0101c10:	fa                   	cli
c0101c11:	6a 0b                	push   $0xb
c0101c13:	e9 5e ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c18 <isr12>:
c0101c18:	fa                   	cli
c0101c19:	6a 0c                	push   $0xc
c0101c1b:	e9 56 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c20 <isr13>:
c0101c20:	fa                   	cli
c0101c21:	6a 0d                	push   $0xd
c0101c23:	e9 4e ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c28 <isr14>:
c0101c28:	fa                   	cli
c0101c29:	6a 00                	push   $0x0
c0101c2b:	6a 0e                	push   $0xe
c0101c2d:	e9 44 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c32 <isr15>:
c0101c32:	fa                   	cli
c0101c33:	6a 00                	push   $0x0
c0101c35:	6a 0f                	push   $0xf
c0101c37:	e9 3a ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c3c <isr16>:
c0101c3c:	fa                   	cli
c0101c3d:	6a 00                	push   $0x0
c0101c3f:	6a 10                	push   $0x10
c0101c41:	e9 30 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c46 <isr17>:
c0101c46:	fa                   	cli
c0101c47:	6a 00                	push   $0x0
c0101c49:	6a 11                	push   $0x11
c0101c4b:	e9 26 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c50 <isr18>:
c0101c50:	fa                   	cli
c0101c51:	6a 00                	push   $0x0
c0101c53:	6a 12                	push   $0x12
c0101c55:	e9 1c ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c5a <isr19>:
c0101c5a:	fa                   	cli
c0101c5b:	6a 00                	push   $0x0
c0101c5d:	6a 13                	push   $0x13
c0101c5f:	e9 12 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c64 <isr20>:
c0101c64:	fa                   	cli
c0101c65:	6a 00                	push   $0x0
c0101c67:	6a 14                	push   $0x14
c0101c69:	e9 08 ff ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c6e <isr21>:
c0101c6e:	fa                   	cli
c0101c6f:	6a 00                	push   $0x0
c0101c71:	6a 15                	push   $0x15
c0101c73:	e9 fe fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c78 <isr22>:
c0101c78:	fa                   	cli
c0101c79:	6a 00                	push   $0x0
c0101c7b:	6a 16                	push   $0x16
c0101c7d:	e9 f4 fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c82 <isr23>:
c0101c82:	fa                   	cli
c0101c83:	6a 00                	push   $0x0
c0101c85:	6a 17                	push   $0x17
c0101c87:	e9 ea fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c8c <isr24>:
c0101c8c:	fa                   	cli
c0101c8d:	6a 00                	push   $0x0
c0101c8f:	6a 18                	push   $0x18
c0101c91:	e9 e0 fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101c96 <isr25>:
c0101c96:	fa                   	cli
c0101c97:	6a 00                	push   $0x0
c0101c99:	6a 19                	push   $0x19
c0101c9b:	e9 d6 fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101ca0 <isr26>:
c0101ca0:	fa                   	cli
c0101ca1:	6a 00                	push   $0x0
c0101ca3:	6a 1a                	push   $0x1a
c0101ca5:	e9 cc fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101caa <isr27>:
c0101caa:	fa                   	cli
c0101cab:	6a 00                	push   $0x0
c0101cad:	6a 1b                	push   $0x1b
c0101caf:	e9 c2 fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101cb4 <isr28>:
c0101cb4:	fa                   	cli
c0101cb5:	6a 00                	push   $0x0
c0101cb7:	6a 1c                	push   $0x1c
c0101cb9:	e9 b8 fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101cbe <isr29>:
c0101cbe:	fa                   	cli
c0101cbf:	6a 00                	push   $0x0
c0101cc1:	6a 1d                	push   $0x1d
c0101cc3:	e9 ae fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101cc8 <isr30>:
c0101cc8:	fa                   	cli
c0101cc9:	6a 00                	push   $0x0
c0101ccb:	6a 1e                	push   $0x1e
c0101ccd:	e9 a4 fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101cd2 <isr31>:
c0101cd2:	fa                   	cli
c0101cd3:	6a 00                	push   $0x0
c0101cd5:	6a 1f                	push   $0x1f
c0101cd7:	e9 9a fe ff ff       	jmp    c0101b76 <isr_common_stub>

c0101cdc <irq0>:
c0101cdc:	fa                   	cli
c0101cdd:	6a 00                	push   $0x0
c0101cdf:	6a 20                	push   $0x20
c0101ce1:	e9 b5 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101ce6 <irq1>:
c0101ce6:	fa                   	cli
c0101ce7:	6a 00                	push   $0x0
c0101ce9:	6a 21                	push   $0x21
c0101ceb:	e9 ab fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101cf0 <irq2>:
c0101cf0:	fa                   	cli
c0101cf1:	6a 00                	push   $0x0
c0101cf3:	6a 22                	push   $0x22
c0101cf5:	e9 a1 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101cfa <irq3>:
c0101cfa:	fa                   	cli
c0101cfb:	6a 00                	push   $0x0
c0101cfd:	6a 23                	push   $0x23
c0101cff:	e9 97 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d04 <irq4>:
c0101d04:	fa                   	cli
c0101d05:	6a 00                	push   $0x0
c0101d07:	6a 24                	push   $0x24
c0101d09:	e9 8d fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d0e <irq5>:
c0101d0e:	fa                   	cli
c0101d0f:	6a 00                	push   $0x0
c0101d11:	6a 25                	push   $0x25
c0101d13:	e9 83 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d18 <irq6>:
c0101d18:	fa                   	cli
c0101d19:	6a 00                	push   $0x0
c0101d1b:	6a 26                	push   $0x26
c0101d1d:	e9 79 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d22 <irq7>:
c0101d22:	fa                   	cli
c0101d23:	6a 00                	push   $0x0
c0101d25:	6a 27                	push   $0x27
c0101d27:	e9 6f fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d2c <irq8>:
c0101d2c:	fa                   	cli
c0101d2d:	6a 00                	push   $0x0
c0101d2f:	6a 28                	push   $0x28
c0101d31:	e9 65 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d36 <irq9>:
c0101d36:	fa                   	cli
c0101d37:	6a 00                	push   $0x0
c0101d39:	6a 29                	push   $0x29
c0101d3b:	e9 5b fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d40 <irq10>:
c0101d40:	fa                   	cli
c0101d41:	6a 00                	push   $0x0
c0101d43:	6a 2a                	push   $0x2a
c0101d45:	e9 51 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d4a <irq11>:
c0101d4a:	fa                   	cli
c0101d4b:	6a 00                	push   $0x0
c0101d4d:	6a 2b                	push   $0x2b
c0101d4f:	e9 47 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d54 <irq12>:
c0101d54:	fa                   	cli
c0101d55:	6a 00                	push   $0x0
c0101d57:	6a 2c                	push   $0x2c
c0101d59:	e9 3d fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d5e <irq13>:
c0101d5e:	fa                   	cli
c0101d5f:	6a 00                	push   $0x0
c0101d61:	6a 2d                	push   $0x2d
c0101d63:	e9 33 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d68 <irq14>:
c0101d68:	fa                   	cli
c0101d69:	6a 00                	push   $0x0
c0101d6b:	6a 2e                	push   $0x2e
c0101d6d:	e9 29 fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d72 <irq15>:
c0101d72:	fa                   	cli
c0101d73:	6a 00                	push   $0x0
c0101d75:	6a 2f                	push   $0x2f
c0101d77:	e9 1f fe ff ff       	jmp    c0101b9b <irq_common_stub>

c0101d7c <outb>:
c0101d7c:	55                   	push   %ebp
c0101d7d:	89 e5                	mov    %esp,%ebp
c0101d7f:	83 ec 08             	sub    $0x8,%esp
c0101d82:	8b 55 08             	mov    0x8(%ebp),%edx
c0101d85:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d88:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c0101d8c:	88 45 f8             	mov    %al,-0x8(%ebp)
c0101d8f:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0101d93:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c0101d97:	ee                   	out    %al,(%dx)
c0101d98:	90                   	nop
c0101d99:	c9                   	leave
c0101d9a:	c3                   	ret

c0101d9b <inb>:
c0101d9b:	55                   	push   %ebp
c0101d9c:	89 e5                	mov    %esp,%ebp
c0101d9e:	83 ec 14             	sub    $0x14,%esp
c0101da1:	8b 45 08             	mov    0x8(%ebp),%eax
c0101da4:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c0101da8:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0101dac:	89 c2                	mov    %eax,%edx
c0101dae:	ec                   	in     (%dx),%al
c0101daf:	88 45 ff             	mov    %al,-0x1(%ebp)
c0101db2:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0101db6:	c9                   	leave
c0101db7:	c3                   	ret

c0101db8 <isr_handler>:
c0101db8:	55                   	push   %ebp
c0101db9:	89 e5                	mov    %esp,%ebp
c0101dbb:	83 ec 08             	sub    $0x8,%esp
c0101dbe:	83 ec 0c             	sub    $0xc,%esp
c0101dc1:	68 7e 30 10 c0       	push   $0xc010307e
c0101dc6:	e8 5d 06 00 00       	call   c0102428 <printf>
c0101dcb:	83 c4 10             	add    $0x10,%esp
c0101dce:	8b 45 2c             	mov    0x2c(%ebp),%eax
c0101dd1:	83 ec 08             	sub    $0x8,%esp
c0101dd4:	50                   	push   %eax
c0101dd5:	68 93 30 10 c0       	push   $0xc0103093
c0101dda:	e8 49 06 00 00       	call   c0102428 <printf>
c0101ddf:	83 c4 10             	add    $0x10,%esp
c0101de2:	8b 45 30             	mov    0x30(%ebp),%eax
c0101de5:	83 ec 08             	sub    $0x8,%esp
c0101de8:	50                   	push   %eax
c0101de9:	68 a5 30 10 c0       	push   $0xc01030a5
c0101dee:	e8 35 06 00 00       	call   c0102428 <printf>
c0101df3:	83 c4 10             	add    $0x10,%esp
c0101df6:	90                   	nop
c0101df7:	c9                   	leave
c0101df8:	c3                   	ret

c0101df9 <irq_handler>:
c0101df9:	55                   	push   %ebp
c0101dfa:	89 e5                	mov    %esp,%ebp
c0101dfc:	83 ec 18             	sub    $0x18,%esp
c0101dff:	83 ec 0c             	sub    $0xc,%esp
c0101e02:	68 bf 30 10 c0       	push   $0xc01030bf
c0101e07:	e8 1c 06 00 00       	call   c0102428 <printf>
c0101e0c:	83 c4 10             	add    $0x10,%esp
c0101e0f:	8b 45 2c             	mov    0x2c(%ebp),%eax
c0101e12:	83 f8 27             	cmp    $0x27,%eax
c0101e15:	76 12                	jbe    c0101e29 <irq_handler+0x30>
c0101e17:	83 ec 08             	sub    $0x8,%esp
c0101e1a:	6a 20                	push   $0x20
c0101e1c:	68 a0 00 00 00       	push   $0xa0
c0101e21:	e8 56 ff ff ff       	call   c0101d7c <outb>
c0101e26:	83 c4 10             	add    $0x10,%esp
c0101e29:	83 ec 08             	sub    $0x8,%esp
c0101e2c:	6a 20                	push   $0x20
c0101e2e:	6a 20                	push   $0x20
c0101e30:	e8 47 ff ff ff       	call   c0101d7c <outb>
c0101e35:	83 c4 10             	add    $0x10,%esp
c0101e38:	8b 45 2c             	mov    0x2c(%ebp),%eax
c0101e3b:	83 f8 20             	cmp    $0x20,%eax
c0101e3e:	75 12                	jne    c0101e52 <irq_handler+0x59>
c0101e40:	83 ec 0c             	sub    $0xc,%esp
c0101e43:	68 cc 30 10 c0       	push   $0xc01030cc
c0101e48:	e8 db 05 00 00       	call   c0102428 <printf>
c0101e4d:	83 c4 10             	add    $0x10,%esp
c0101e50:	eb 2d                	jmp    c0101e7f <irq_handler+0x86>
c0101e52:	8b 45 2c             	mov    0x2c(%ebp),%eax
c0101e55:	83 f8 21             	cmp    $0x21,%eax
c0101e58:	75 25                	jne    c0101e7f <irq_handler+0x86>
c0101e5a:	83 ec 0c             	sub    $0xc,%esp
c0101e5d:	6a 60                	push   $0x60
c0101e5f:	e8 37 ff ff ff       	call   c0101d9b <inb>
c0101e64:	83 c4 10             	add    $0x10,%esp
c0101e67:	88 45 f7             	mov    %al,-0x9(%ebp)
c0101e6a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0101e6e:	83 ec 08             	sub    $0x8,%esp
c0101e71:	50                   	push   %eax
c0101e72:	68 dd 30 10 c0       	push   $0xc01030dd
c0101e77:	e8 ac 05 00 00       	call   c0102428 <printf>
c0101e7c:	83 c4 10             	add    $0x10,%esp
c0101e7f:	90                   	nop
c0101e80:	c9                   	leave
c0101e81:	c3                   	ret

c0101e82 <vga_entry_color>:
c0101e82:	55                   	push   %ebp
c0101e83:	89 e5                	mov    %esp,%ebp
c0101e85:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101e88:	c1 e0 04             	shl    $0x4,%eax
c0101e8b:	89 c2                	mov    %eax,%edx
c0101e8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e90:	09 d0                	or     %edx,%eax
c0101e92:	5d                   	pop    %ebp
c0101e93:	c3                   	ret

c0101e94 <vga_entry>:
c0101e94:	55                   	push   %ebp
c0101e95:	89 e5                	mov    %esp,%ebp
c0101e97:	83 ec 08             	sub    $0x8,%esp
c0101e9a:	8b 55 08             	mov    0x8(%ebp),%edx
c0101e9d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ea0:	88 55 fc             	mov    %dl,-0x4(%ebp)
c0101ea3:	88 45 f8             	mov    %al,-0x8(%ebp)
c0101ea6:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0101eaa:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c0101eae:	c1 e0 08             	shl    $0x8,%eax
c0101eb1:	09 d0                	or     %edx,%eax
c0101eb3:	c9                   	leave
c0101eb4:	c3                   	ret

c0101eb5 <terminal_scroll>:
c0101eb5:	55                   	push   %ebp
c0101eb6:	89 e5                	mov    %esp,%ebp
c0101eb8:	53                   	push   %ebx
c0101eb9:	83 ec 20             	sub    $0x20,%esp
c0101ebc:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
c0101ec3:	eb 54                	jmp    c0101f19 <terminal_scroll+0x64>
c0101ec5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101ecc:	eb 3d                	jmp    c0101f0b <terminal_scroll+0x56>
c0101ece:	b8 50 00 00 00       	mov    $0x50,%eax
c0101ed3:	0f af 45 f8          	imul   -0x8(%ebp),%eax
c0101ed7:	89 c2                	mov    %eax,%edx
c0101ed9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101edc:	01 d0                	add    %edx,%eax
c0101ede:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101ee1:	a1 74 c8 10 c0       	mov    0xc010c874,%eax
c0101ee6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101ee9:	01 d2                	add    %edx,%edx
c0101eeb:	01 d0                	add    %edx,%eax
c0101eed:	8b 15 74 c8 10 c0    	mov    0xc010c874,%edx
c0101ef3:	bb 50 00 00 00       	mov    $0x50,%ebx
c0101ef8:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0101efb:	29 d9                	sub    %ebx,%ecx
c0101efd:	01 c9                	add    %ecx,%ecx
c0101eff:	01 ca                	add    %ecx,%edx
c0101f01:	0f b7 00             	movzwl (%eax),%eax
c0101f04:	66 89 02             	mov    %ax,(%edx)
c0101f07:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101f0b:	b8 50 00 00 00       	mov    $0x50,%eax
c0101f10:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101f13:	72 b9                	jb     c0101ece <terminal_scroll+0x19>
c0101f15:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0101f19:	b8 19 00 00 00       	mov    $0x19,%eax
c0101f1e:	39 45 f8             	cmp    %eax,-0x8(%ebp)
c0101f21:	72 a2                	jb     c0101ec5 <terminal_scroll+0x10>
c0101f23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101f2a:	eb 42                	jmp    c0101f6e <terminal_scroll+0xb9>
c0101f2c:	b8 19 00 00 00       	mov    $0x19,%eax
c0101f31:	83 e8 01             	sub    $0x1,%eax
c0101f34:	ba 50 00 00 00       	mov    $0x50,%edx
c0101f39:	0f af d0             	imul   %eax,%edx
c0101f3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f3f:	01 d0                	add    %edx,%eax
c0101f41:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101f44:	0f b6 05 70 c8 10 c0 	movzbl 0xc010c870,%eax
c0101f4b:	0f b6 c0             	movzbl %al,%eax
c0101f4e:	8b 15 74 c8 10 c0    	mov    0xc010c874,%edx
c0101f54:	8b 4d ec             	mov    -0x14(%ebp),%ecx
c0101f57:	01 c9                	add    %ecx,%ecx
c0101f59:	8d 1c 0a             	lea    (%edx,%ecx,1),%ebx
c0101f5c:	50                   	push   %eax
c0101f5d:	6a 20                	push   $0x20
c0101f5f:	e8 30 ff ff ff       	call   c0101e94 <vga_entry>
c0101f64:	83 c4 08             	add    $0x8,%esp
c0101f67:	66 89 03             	mov    %ax,(%ebx)
c0101f6a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f6e:	b8 50 00 00 00       	mov    $0x50,%eax
c0101f73:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0101f76:	72 b4                	jb     c0101f2c <terminal_scroll+0x77>
c0101f78:	b8 19 00 00 00       	mov    $0x19,%eax
c0101f7d:	83 e8 01             	sub    $0x1,%eax
c0101f80:	a3 68 c8 10 c0       	mov    %eax,0xc010c868
c0101f85:	90                   	nop
c0101f86:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101f89:	c9                   	leave
c0101f8a:	c3                   	ret

c0101f8b <terminal_initialize>:
c0101f8b:	55                   	push   %ebp
c0101f8c:	89 e5                	mov    %esp,%ebp
c0101f8e:	53                   	push   %ebx
c0101f8f:	83 ec 10             	sub    $0x10,%esp
c0101f92:	c7 05 68 c8 10 c0 00 	movl   $0x0,0xc010c868
c0101f99:	00 00 00 
c0101f9c:	c7 05 6c c8 10 c0 00 	movl   $0x0,0xc010c86c
c0101fa3:	00 00 00 
c0101fa6:	6a 0f                	push   $0xf
c0101fa8:	6a 00                	push   $0x0
c0101faa:	e8 d3 fe ff ff       	call   c0101e82 <vga_entry_color>
c0101faf:	83 c4 08             	add    $0x8,%esp
c0101fb2:	a2 70 c8 10 c0       	mov    %al,0xc010c870
c0101fb7:	b8 00 80 0b c0       	mov    $0xc00b8000,%eax
c0101fbc:	a3 74 c8 10 c0       	mov    %eax,0xc010c874
c0101fc1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0101fc8:	eb 54                	jmp    c010201e <terminal_initialize+0x93>
c0101fca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101fd1:	eb 3d                	jmp    c0102010 <terminal_initialize+0x85>
c0101fd3:	b8 50 00 00 00       	mov    $0x50,%eax
c0101fd8:	0f af 45 f8          	imul   -0x8(%ebp),%eax
c0101fdc:	89 c2                	mov    %eax,%edx
c0101fde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101fe1:	01 d0                	add    %edx,%eax
c0101fe3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101fe6:	0f b6 05 70 c8 10 c0 	movzbl 0xc010c870,%eax
c0101fed:	0f b6 c0             	movzbl %al,%eax
c0101ff0:	8b 15 74 c8 10 c0    	mov    0xc010c874,%edx
c0101ff6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0101ff9:	01 c9                	add    %ecx,%ecx
c0101ffb:	8d 1c 0a             	lea    (%edx,%ecx,1),%ebx
c0101ffe:	50                   	push   %eax
c0101fff:	6a 20                	push   $0x20
c0102001:	e8 8e fe ff ff       	call   c0101e94 <vga_entry>
c0102006:	83 c4 08             	add    $0x8,%esp
c0102009:	66 89 03             	mov    %ax,(%ebx)
c010200c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102010:	b8 50 00 00 00       	mov    $0x50,%eax
c0102015:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0102018:	72 b9                	jb     c0101fd3 <terminal_initialize+0x48>
c010201a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010201e:	b8 19 00 00 00       	mov    $0x19,%eax
c0102023:	39 45 f8             	cmp    %eax,-0x8(%ebp)
c0102026:	72 a2                	jb     c0101fca <terminal_initialize+0x3f>
c0102028:	90                   	nop
c0102029:	90                   	nop
c010202a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010202d:	c9                   	leave
c010202e:	c3                   	ret

c010202f <terminal_setcolor>:
c010202f:	55                   	push   %ebp
c0102030:	89 e5                	mov    %esp,%ebp
c0102032:	83 ec 04             	sub    $0x4,%esp
c0102035:	8b 45 08             	mov    0x8(%ebp),%eax
c0102038:	88 45 fc             	mov    %al,-0x4(%ebp)
c010203b:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
c010203f:	a2 70 c8 10 c0       	mov    %al,0xc010c870
c0102044:	90                   	nop
c0102045:	c9                   	leave
c0102046:	c3                   	ret

c0102047 <terminal_putentryat>:
c0102047:	55                   	push   %ebp
c0102048:	89 e5                	mov    %esp,%ebp
c010204a:	53                   	push   %ebx
c010204b:	83 ec 18             	sub    $0x18,%esp
c010204e:	8b 55 08             	mov    0x8(%ebp),%edx
c0102051:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102054:	88 55 e8             	mov    %dl,-0x18(%ebp)
c0102057:	88 45 e4             	mov    %al,-0x1c(%ebp)
c010205a:	b8 50 00 00 00       	mov    $0x50,%eax
c010205f:	0f af 45 14          	imul   0x14(%ebp),%eax
c0102063:	89 c2                	mov    %eax,%edx
c0102065:	8b 45 10             	mov    0x10(%ebp),%eax
c0102068:	01 d0                	add    %edx,%eax
c010206a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010206d:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0102071:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
c0102075:	8b 0d 74 c8 10 c0    	mov    0xc010c874,%ecx
c010207b:	8b 5d f8             	mov    -0x8(%ebp),%ebx
c010207e:	01 db                	add    %ebx,%ebx
c0102080:	01 cb                	add    %ecx,%ebx
c0102082:	52                   	push   %edx
c0102083:	50                   	push   %eax
c0102084:	e8 0b fe ff ff       	call   c0101e94 <vga_entry>
c0102089:	83 c4 08             	add    $0x8,%esp
c010208c:	66 89 03             	mov    %ax,(%ebx)
c010208f:	90                   	nop
c0102090:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102093:	c9                   	leave
c0102094:	c3                   	ret

c0102095 <terminal_putchar>:
c0102095:	55                   	push   %ebp
c0102096:	89 e5                	mov    %esp,%ebp
c0102098:	53                   	push   %ebx
c0102099:	83 ec 04             	sub    $0x4,%esp
c010209c:	8b 45 08             	mov    0x8(%ebp),%eax
c010209f:	88 45 f8             	mov    %al,-0x8(%ebp)
c01020a2:	80 7d f8 0a          	cmpb   $0xa,-0x8(%ebp)
c01020a6:	75 2c                	jne    c01020d4 <terminal_putchar+0x3f>
c01020a8:	c7 05 6c c8 10 c0 00 	movl   $0x0,0xc010c86c
c01020af:	00 00 00 
c01020b2:	a1 68 c8 10 c0       	mov    0xc010c868,%eax
c01020b7:	83 c0 01             	add    $0x1,%eax
c01020ba:	a3 68 c8 10 c0       	mov    %eax,0xc010c868
c01020bf:	a1 68 c8 10 c0       	mov    0xc010c868,%eax
c01020c4:	ba 19 00 00 00       	mov    $0x19,%edx
c01020c9:	39 d0                	cmp    %edx,%eax
c01020cb:	75 75                	jne    c0102142 <terminal_putchar+0xad>
c01020cd:	e8 e3 fd ff ff       	call   c0101eb5 <terminal_scroll>
c01020d2:	eb 6e                	jmp    c0102142 <terminal_putchar+0xad>
c01020d4:	8b 1d 68 c8 10 c0    	mov    0xc010c868,%ebx
c01020da:	8b 0d 6c c8 10 c0    	mov    0xc010c86c,%ecx
c01020e0:	0f b6 05 70 c8 10 c0 	movzbl 0xc010c870,%eax
c01020e7:	0f b6 d0             	movzbl %al,%edx
c01020ea:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c01020ee:	0f b6 c0             	movzbl %al,%eax
c01020f1:	53                   	push   %ebx
c01020f2:	51                   	push   %ecx
c01020f3:	52                   	push   %edx
c01020f4:	50                   	push   %eax
c01020f5:	e8 4d ff ff ff       	call   c0102047 <terminal_putentryat>
c01020fa:	83 c4 10             	add    $0x10,%esp
c01020fd:	a1 6c c8 10 c0       	mov    0xc010c86c,%eax
c0102102:	83 c0 01             	add    $0x1,%eax
c0102105:	a3 6c c8 10 c0       	mov    %eax,0xc010c86c
c010210a:	a1 6c c8 10 c0       	mov    0xc010c86c,%eax
c010210f:	ba 50 00 00 00       	mov    $0x50,%edx
c0102114:	39 d0                	cmp    %edx,%eax
c0102116:	75 2a                	jne    c0102142 <terminal_putchar+0xad>
c0102118:	c7 05 6c c8 10 c0 00 	movl   $0x0,0xc010c86c
c010211f:	00 00 00 
c0102122:	a1 68 c8 10 c0       	mov    0xc010c868,%eax
c0102127:	83 c0 01             	add    $0x1,%eax
c010212a:	a3 68 c8 10 c0       	mov    %eax,0xc010c868
c010212f:	a1 68 c8 10 c0       	mov    0xc010c868,%eax
c0102134:	ba 19 00 00 00       	mov    $0x19,%edx
c0102139:	39 d0                	cmp    %edx,%eax
c010213b:	75 05                	jne    c0102142 <terminal_putchar+0xad>
c010213d:	e8 73 fd ff ff       	call   c0101eb5 <terminal_scroll>
c0102142:	90                   	nop
c0102143:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102146:	c9                   	leave
c0102147:	c3                   	ret

c0102148 <terminal_write>:
c0102148:	55                   	push   %ebp
c0102149:	89 e5                	mov    %esp,%ebp
c010214b:	83 ec 10             	sub    $0x10,%esp
c010214e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102155:	eb 1b                	jmp    c0102172 <terminal_write+0x2a>
c0102157:	8b 55 08             	mov    0x8(%ebp),%edx
c010215a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010215d:	01 d0                	add    %edx,%eax
c010215f:	0f b6 00             	movzbl (%eax),%eax
c0102162:	0f be c0             	movsbl %al,%eax
c0102165:	50                   	push   %eax
c0102166:	e8 2a ff ff ff       	call   c0102095 <terminal_putchar>
c010216b:	83 c4 04             	add    $0x4,%esp
c010216e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102172:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102175:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0102178:	72 dd                	jb     c0102157 <terminal_write+0xf>
c010217a:	90                   	nop
c010217b:	90                   	nop
c010217c:	c9                   	leave
c010217d:	c3                   	ret

c010217e <terminal_writestring>:
c010217e:	55                   	push   %ebp
c010217f:	89 e5                	mov    %esp,%ebp
c0102181:	83 ec 08             	sub    $0x8,%esp
c0102184:	83 ec 0c             	sub    $0xc,%esp
c0102187:	ff 75 08             	push   0x8(%ebp)
c010218a:	e8 1a 06 00 00       	call   c01027a9 <strlen>
c010218f:	83 c4 10             	add    $0x10,%esp
c0102192:	83 ec 08             	sub    $0x8,%esp
c0102195:	50                   	push   %eax
c0102196:	ff 75 08             	push   0x8(%ebp)
c0102199:	e8 aa ff ff ff       	call   c0102148 <terminal_write>
c010219e:	83 c4 10             	add    $0x10,%esp
c01021a1:	90                   	nop
c01021a2:	c9                   	leave
c01021a3:	c3                   	ret

c01021a4 <outb>:
c01021a4:	55                   	push   %ebp
c01021a5:	89 e5                	mov    %esp,%ebp
c01021a7:	83 ec 08             	sub    $0x8,%esp
c01021aa:	8b 55 08             	mov    0x8(%ebp),%edx
c01021ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021b0:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
c01021b4:	88 45 f8             	mov    %al,-0x8(%ebp)
c01021b7:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
c01021bb:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
c01021bf:	ee                   	out    %al,(%dx)
c01021c0:	90                   	nop
c01021c1:	c9                   	leave
c01021c2:	c3                   	ret

c01021c3 <timer_callback>:
c01021c3:	55                   	push   %ebp
c01021c4:	89 e5                	mov    %esp,%ebp
c01021c6:	83 ec 08             	sub    $0x8,%esp
c01021c9:	a1 78 c8 10 c0       	mov    0xc010c878,%eax
c01021ce:	83 c0 01             	add    $0x1,%eax
c01021d1:	a3 78 c8 10 c0       	mov    %eax,0xc010c878
c01021d6:	a1 78 c8 10 c0       	mov    0xc010c878,%eax
c01021db:	83 ec 08             	sub    $0x8,%esp
c01021de:	50                   	push   %eax
c01021df:	68 fc 30 10 c0       	push   $0xc01030fc
c01021e4:	e8 3f 02 00 00       	call   c0102428 <printf>
c01021e9:	83 c4 10             	add    $0x10,%esp
c01021ec:	90                   	nop
c01021ed:	c9                   	leave
c01021ee:	c3                   	ret

c01021ef <init_timer>:
c01021ef:	55                   	push   %ebp
c01021f0:	89 e5                	mov    %esp,%ebp
c01021f2:	83 ec 18             	sub    $0x18,%esp
c01021f5:	83 ec 08             	sub    $0x8,%esp
c01021f8:	ff 75 08             	push   0x8(%ebp)
c01021fb:	68 06 31 10 c0       	push   $0xc0103106
c0102200:	e8 23 02 00 00       	call   c0102428 <printf>
c0102205:	83 c4 10             	add    $0x10,%esp
c0102208:	b8 dc 34 12 00       	mov    $0x1234dc,%eax
c010220d:	ba 00 00 00 00       	mov    $0x0,%edx
c0102212:	f7 75 08             	divl   0x8(%ebp)
c0102215:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102218:	83 ec 08             	sub    $0x8,%esp
c010221b:	6a 36                	push   $0x36
c010221d:	6a 43                	push   $0x43
c010221f:	e8 80 ff ff ff       	call   c01021a4 <outb>
c0102224:	83 c4 10             	add    $0x10,%esp
c0102227:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010222a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010222d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102230:	c1 e8 08             	shr    $0x8,%eax
c0102233:	88 45 f2             	mov    %al,-0xe(%ebp)
c0102236:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c010223a:	83 ec 08             	sub    $0x8,%esp
c010223d:	50                   	push   %eax
c010223e:	6a 40                	push   $0x40
c0102240:	e8 5f ff ff ff       	call   c01021a4 <outb>
c0102245:	83 c4 10             	add    $0x10,%esp
c0102248:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
c010224c:	83 ec 08             	sub    $0x8,%esp
c010224f:	50                   	push   %eax
c0102250:	6a 40                	push   $0x40
c0102252:	e8 4d ff ff ff       	call   c01021a4 <outb>
c0102257:	83 c4 10             	add    $0x10,%esp
c010225a:	90                   	nop
c010225b:	c9                   	leave
c010225c:	c3                   	ret

c010225d <kernel_init>:
c010225d:	55                   	push   %ebp
c010225e:	89 e5                	mov    %esp,%ebp
c0102260:	83 ec 08             	sub    $0x8,%esp
c0102263:	e8 23 fd ff ff       	call   c0101f8b <terminal_initialize>
c0102268:	e8 b1 f1 ff ff       	call   c010141e <init_descriptor_tables>
c010226d:	83 ec 08             	sub    $0x8,%esp
c0102270:	ff 75 0c             	push   0xc(%ebp)
c0102273:	ff 75 08             	push   0x8(%ebp)
c0102276:	e8 09 ef ff ff       	call   c0101184 <pfa_initialize>
c010227b:	83 c4 10             	add    $0x10,%esp
c010227e:	90                   	nop
c010227f:	c9                   	leave
c0102280:	c3                   	ret

c0102281 <kernel_main>:
c0102281:	55                   	push   %ebp
c0102282:	89 e5                	mov    %esp,%ebp
c0102284:	83 ec 08             	sub    $0x8,%esp
c0102287:	83 ec 0c             	sub    $0xc,%esp
c010228a:	68 16 31 10 c0       	push   $0xc0103116
c010228f:	e8 94 01 00 00       	call   c0102428 <printf>
c0102294:	83 c4 10             	add    $0x10,%esp
c0102297:	83 ec 08             	sub    $0x8,%esp
c010229a:	68 2d 31 10 c0       	push   $0xc010312d
c010229f:	68 39 31 10 c0       	push   $0xc0103139
c01022a4:	e8 7f 01 00 00       	call   c0102428 <printf>
c01022a9:	83 c4 10             	add    $0x10,%esp
c01022ac:	cd 20                	int    $0x20
c01022ae:	f4                   	hlt
c01022af:	eb fd                	jmp    c01022ae <kernel_main+0x2d>

c01022b1 <get_page_directory>:
c01022b1:	55                   	push   %ebp
c01022b2:	89 e5                	mov    %esp,%ebp
c01022b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01022b7:	5d                   	pop    %ebp
c01022b8:	c3                   	ret

c01022b9 <get_page_table>:
c01022b9:	55                   	push   %ebp
c01022ba:	89 e5                	mov    %esp,%ebp
c01022bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01022bf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01022c4:	5d                   	pop    %ebp
c01022c5:	c3                   	ret

c01022c6 <switch_page_directory>:
c01022c6:	55                   	push   %ebp
c01022c7:	89 e5                	mov    %esp,%ebp
c01022c9:	83 ec 10             	sub    $0x10,%esp
c01022cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01022cf:	a3 7c c8 10 c0       	mov    %eax,0xc010c87c
c01022d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01022d7:	0f 22 d8             	mov    %eax,%cr3
c01022da:	0f 20 c0             	mov    %cr0,%eax
c01022dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01022e0:	81 4d fc 00 00 00 80 	orl    $0x80000000,-0x4(%ebp)
c01022e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01022ea:	0f 22 c0             	mov    %eax,%cr0
c01022ed:	90                   	nop
c01022ee:	c9                   	leave
c01022ef:	c3                   	ret

c01022f0 <print_uint32_val>:
c01022f0:	55                   	push   %ebp
c01022f1:	89 e5                	mov    %esp,%ebp
c01022f3:	83 ec 08             	sub    $0x8,%esp
c01022f6:	83 ec 08             	sub    $0x8,%esp
c01022f9:	ff 75 08             	push   0x8(%ebp)
c01022fc:	68 3c 31 10 c0       	push   $0xc010313c
c0102301:	e8 22 01 00 00       	call   c0102428 <printf>
c0102306:	83 c4 10             	add    $0x10,%esp
c0102309:	90                   	nop
c010230a:	c9                   	leave
c010230b:	c3                   	ret

c010230c <print_label>:
c010230c:	55                   	push   %ebp
c010230d:	89 e5                	mov    %esp,%ebp
c010230f:	83 ec 08             	sub    $0x8,%esp
c0102312:	83 ec 0c             	sub    $0xc,%esp
c0102315:	68 4d 31 10 c0       	push   $0xc010314d
c010231a:	e8 09 01 00 00       	call   c0102428 <printf>
c010231f:	83 c4 10             	add    $0x10,%esp
c0102322:	90                   	nop
c0102323:	c9                   	leave
c0102324:	c3                   	ret

c0102325 <print>:
c0102325:	55                   	push   %ebp
c0102326:	89 e5                	mov    %esp,%ebp
c0102328:	83 ec 18             	sub    $0x18,%esp
c010232b:	8b 45 08             	mov    0x8(%ebp),%eax
c010232e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102331:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102338:	eb 2a                	jmp    c0102364 <print+0x3f>
c010233a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010233d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102340:	01 d0                	add    %edx,%eax
c0102342:	0f b6 00             	movzbl (%eax),%eax
c0102345:	0f b6 c0             	movzbl %al,%eax
c0102348:	83 ec 0c             	sub    $0xc,%esp
c010234b:	50                   	push   %eax
c010234c:	e8 ea 03 00 00       	call   c010273b <putchar>
c0102351:	83 c4 10             	add    $0x10,%esp
c0102354:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102357:	75 07                	jne    c0102360 <print+0x3b>
c0102359:	b8 00 00 00 00       	mov    $0x0,%eax
c010235e:	eb 11                	jmp    c0102371 <print+0x4c>
c0102360:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102364:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102367:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010236a:	72 ce                	jb     c010233a <print+0x15>
c010236c:	b8 01 00 00 00       	mov    $0x1,%eax
c0102371:	c9                   	leave
c0102372:	c3                   	ret

c0102373 <fill_buffer>:
c0102373:	55                   	push   %ebp
c0102374:	89 e5                	mov    %esp,%ebp
c0102376:	83 ec 20             	sub    $0x20,%esp
c0102379:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102380:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0102383:	8b 45 08             	mov    0x8(%ebp),%eax
c0102386:	ba 00 00 00 00       	mov    $0x0,%edx
c010238b:	f7 f1                	div    %ecx
c010238d:	89 d0                	mov    %edx,%eax
c010238f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102392:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
c0102396:	7f 0a                	jg     c01023a2 <fill_buffer+0x2f>
c0102398:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010239b:	83 c0 30             	add    $0x30,%eax
c010239e:	89 c1                	mov    %eax,%ecx
c01023a0:	eb 08                	jmp    c01023aa <fill_buffer+0x37>
c01023a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023a5:	83 c0 57             	add    $0x57,%eax
c01023a8:	89 c1                	mov    %eax,%ecx
c01023aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01023ad:	8d 50 01             	lea    0x1(%eax),%edx
c01023b0:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01023b3:	8b 55 0c             	mov    0xc(%ebp),%edx
c01023b6:	01 d0                	add    %edx,%eax
c01023b8:	88 08                	mov    %cl,(%eax)
c01023ba:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01023bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01023c0:	ba 00 00 00 00       	mov    $0x0,%edx
c01023c5:	f7 f1                	div    %ecx
c01023c7:	89 45 08             	mov    %eax,0x8(%ebp)
c01023ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01023ce:	75 b0                	jne    c0102380 <fill_buffer+0xd>
c01023d0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01023d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01023da:	83 e8 01             	sub    $0x1,%eax
c01023dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01023e0:	eb 39                	jmp    c010241b <fill_buffer+0xa8>
c01023e2:	8b 55 0c             	mov    0xc(%ebp),%edx
c01023e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01023e8:	01 d0                	add    %edx,%eax
c01023ea:	0f b6 00             	movzbl (%eax),%eax
c01023ed:	88 45 ef             	mov    %al,-0x11(%ebp)
c01023f0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01023f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023f6:	01 d0                	add    %edx,%eax
c01023f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c01023fb:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01023fe:	01 ca                	add    %ecx,%edx
c0102400:	0f b6 00             	movzbl (%eax),%eax
c0102403:	88 02                	mov    %al,(%edx)
c0102405:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102408:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010240b:	01 c2                	add    %eax,%edx
c010240d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0102411:	88 02                	mov    %al,(%edx)
c0102413:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102417:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010241b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010241e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0102421:	72 bf                	jb     c01023e2 <fill_buffer+0x6f>
c0102423:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102426:	c9                   	leave
c0102427:	c3                   	ret

c0102428 <printf>:
c0102428:	55                   	push   %ebp
c0102429:	89 e5                	mov    %esp,%ebp
c010242b:	83 ec 58             	sub    $0x58,%esp
c010242e:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102431:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102434:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010243b:	e9 e8 02 00 00       	jmp    c0102728 <printf+0x300>
c0102440:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
c0102445:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0102448:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010244b:	8b 45 08             	mov    0x8(%ebp),%eax
c010244e:	0f b6 00             	movzbl (%eax),%eax
c0102451:	3c 25                	cmp    $0x25,%al
c0102453:	75 11                	jne    c0102466 <printf+0x3e>
c0102455:	8b 45 08             	mov    0x8(%ebp),%eax
c0102458:	83 c0 01             	add    $0x1,%eax
c010245b:	0f b6 00             	movzbl (%eax),%eax
c010245e:	3c 25                	cmp    $0x25,%al
c0102460:	0f 85 83 00 00 00    	jne    c01024e9 <printf+0xc1>
c0102466:	8b 45 08             	mov    0x8(%ebp),%eax
c0102469:	0f b6 00             	movzbl (%eax),%eax
c010246c:	3c 25                	cmp    $0x25,%al
c010246e:	75 04                	jne    c0102474 <printf+0x4c>
c0102470:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102474:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010247b:	eb 04                	jmp    c0102481 <printf+0x59>
c010247d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102481:	8b 55 08             	mov    0x8(%ebp),%edx
c0102484:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102487:	01 d0                	add    %edx,%eax
c0102489:	0f b6 00             	movzbl (%eax),%eax
c010248c:	84 c0                	test   %al,%al
c010248e:	74 0f                	je     c010249f <printf+0x77>
c0102490:	8b 55 08             	mov    0x8(%ebp),%edx
c0102493:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102496:	01 d0                	add    %edx,%eax
c0102498:	0f b6 00             	movzbl (%eax),%eax
c010249b:	3c 25                	cmp    $0x25,%al
c010249d:	75 de                	jne    c010247d <printf+0x55>
c010249f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024a2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01024a5:	73 0a                	jae    c01024b1 <printf+0x89>
c01024a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01024ac:	e9 88 02 00 00       	jmp    c0102739 <printf+0x311>
c01024b1:	83 ec 08             	sub    $0x8,%esp
c01024b4:	ff 75 f0             	push   -0x10(%ebp)
c01024b7:	ff 75 08             	push   0x8(%ebp)
c01024ba:	e8 66 fe ff ff       	call   c0102325 <print>
c01024bf:	83 c4 10             	add    $0x10,%esp
c01024c2:	83 f0 01             	xor    $0x1,%eax
c01024c5:	84 c0                	test   %al,%al
c01024c7:	74 0a                	je     c01024d3 <printf+0xab>
c01024c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01024ce:	e9 66 02 00 00       	jmp    c0102739 <printf+0x311>
c01024d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024d6:	01 45 08             	add    %eax,0x8(%ebp)
c01024d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01024dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024df:	01 d0                	add    %edx,%eax
c01024e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01024e4:	e9 3f 02 00 00       	jmp    c0102728 <printf+0x300>
c01024e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ec:	8d 50 01             	lea    0x1(%eax),%edx
c01024ef:	89 55 08             	mov    %edx,0x8(%ebp)
c01024f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01024f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01024f8:	0f b6 00             	movzbl (%eax),%eax
c01024fb:	3c 63                	cmp    $0x63,%al
c01024fd:	75 4d                	jne    c010254c <printf+0x124>
c01024ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102503:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102506:	8d 50 04             	lea    0x4(%eax),%edx
c0102509:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010250c:	8b 00                	mov    (%eax),%eax
c010250e:	88 45 c7             	mov    %al,-0x39(%ebp)
c0102511:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0102515:	75 0a                	jne    c0102521 <printf+0xf9>
c0102517:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010251c:	e9 18 02 00 00       	jmp    c0102739 <printf+0x311>
c0102521:	83 ec 08             	sub    $0x8,%esp
c0102524:	6a 01                	push   $0x1
c0102526:	8d 45 c7             	lea    -0x39(%ebp),%eax
c0102529:	50                   	push   %eax
c010252a:	e8 f6 fd ff ff       	call   c0102325 <print>
c010252f:	83 c4 10             	add    $0x10,%esp
c0102532:	83 f0 01             	xor    $0x1,%eax
c0102535:	84 c0                	test   %al,%al
c0102537:	74 0a                	je     c0102543 <printf+0x11b>
c0102539:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010253e:	e9 f6 01 00 00       	jmp    c0102739 <printf+0x311>
c0102543:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102547:	e9 dc 01 00 00       	jmp    c0102728 <printf+0x300>
c010254c:	8b 45 08             	mov    0x8(%ebp),%eax
c010254f:	0f b6 00             	movzbl (%eax),%eax
c0102552:	3c 73                	cmp    $0x73,%al
c0102554:	75 67                	jne    c01025bd <printf+0x195>
c0102556:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010255a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010255d:	8d 50 04             	lea    0x4(%eax),%edx
c0102560:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0102563:	8b 00                	mov    (%eax),%eax
c0102565:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102568:	83 ec 0c             	sub    $0xc,%esp
c010256b:	ff 75 d0             	push   -0x30(%ebp)
c010256e:	e8 36 02 00 00       	call   c01027a9 <strlen>
c0102573:	83 c4 10             	add    $0x10,%esp
c0102576:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102579:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010257c:	3b 45 cc             	cmp    -0x34(%ebp),%eax
c010257f:	73 0a                	jae    c010258b <printf+0x163>
c0102581:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102586:	e9 ae 01 00 00       	jmp    c0102739 <printf+0x311>
c010258b:	83 ec 08             	sub    $0x8,%esp
c010258e:	ff 75 cc             	push   -0x34(%ebp)
c0102591:	ff 75 d0             	push   -0x30(%ebp)
c0102594:	e8 8c fd ff ff       	call   c0102325 <print>
c0102599:	83 c4 10             	add    $0x10,%esp
c010259c:	83 f0 01             	xor    $0x1,%eax
c010259f:	84 c0                	test   %al,%al
c01025a1:	74 0a                	je     c01025ad <printf+0x185>
c01025a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01025a8:	e9 8c 01 00 00       	jmp    c0102739 <printf+0x311>
c01025ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01025b0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01025b3:	01 d0                	add    %edx,%eax
c01025b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01025b8:	e9 6b 01 00 00       	jmp    c0102728 <printf+0x300>
c01025bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01025c0:	0f b6 00             	movzbl (%eax),%eax
c01025c3:	3c 75                	cmp    $0x75,%al
c01025c5:	75 6e                	jne    c0102635 <printf+0x20d>
c01025c7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01025cb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01025ce:	8d 50 04             	lea    0x4(%eax),%edx
c01025d1:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01025d4:	8b 00                	mov    (%eax),%eax
c01025d6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01025d9:	83 ec 04             	sub    $0x4,%esp
c01025dc:	6a 0a                	push   $0xa
c01025de:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01025e1:	50                   	push   %eax
c01025e2:	ff 75 d8             	push   -0x28(%ebp)
c01025e5:	e8 89 fd ff ff       	call   c0102373 <fill_buffer>
c01025ea:	83 c4 10             	add    $0x10,%esp
c01025ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01025f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01025f3:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c01025f6:	73 0a                	jae    c0102602 <printf+0x1da>
c01025f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01025fd:	e9 37 01 00 00       	jmp    c0102739 <printf+0x311>
c0102602:	83 ec 08             	sub    $0x8,%esp
c0102605:	ff 75 d4             	push   -0x2c(%ebp)
c0102608:	8d 45 bd             	lea    -0x43(%ebp),%eax
c010260b:	50                   	push   %eax
c010260c:	e8 14 fd ff ff       	call   c0102325 <print>
c0102611:	83 c4 10             	add    $0x10,%esp
c0102614:	83 f0 01             	xor    $0x1,%eax
c0102617:	84 c0                	test   %al,%al
c0102619:	74 0a                	je     c0102625 <printf+0x1fd>
c010261b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102620:	e9 14 01 00 00       	jmp    c0102739 <printf+0x311>
c0102625:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102628:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010262b:	01 d0                	add    %edx,%eax
c010262d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102630:	e9 f3 00 00 00       	jmp    c0102728 <printf+0x300>
c0102635:	8b 45 08             	mov    0x8(%ebp),%eax
c0102638:	0f b6 00             	movzbl (%eax),%eax
c010263b:	3c 78                	cmp    $0x78,%al
c010263d:	0f 85 8f 00 00 00    	jne    c01026d2 <printf+0x2aa>
c0102643:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0102647:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010264a:	8d 50 04             	lea    0x4(%eax),%edx
c010264d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0102650:	8b 00                	mov    (%eax),%eax
c0102652:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102655:	83 ec 04             	sub    $0x4,%esp
c0102658:	6a 10                	push   $0x10
c010265a:	8d 45 b3             	lea    -0x4d(%ebp),%eax
c010265d:	50                   	push   %eax
c010265e:	ff 75 e0             	push   -0x20(%ebp)
c0102661:	e8 0d fd ff ff       	call   c0102373 <fill_buffer>
c0102666:	83 c4 10             	add    $0x10,%esp
c0102669:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010266c:	83 ec 08             	sub    $0x8,%esp
c010266f:	6a 02                	push   $0x2
c0102671:	68 56 31 10 c0       	push   $0xc0103156
c0102676:	e8 aa fc ff ff       	call   c0102325 <print>
c010267b:	83 c4 10             	add    $0x10,%esp
c010267e:	83 f0 01             	xor    $0x1,%eax
c0102681:	84 c0                	test   %al,%al
c0102683:	74 0a                	je     c010268f <printf+0x267>
c0102685:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010268a:	e9 aa 00 00 00       	jmp    c0102739 <printf+0x311>
c010268f:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0102693:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102696:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102699:	73 0a                	jae    c01026a5 <printf+0x27d>
c010269b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01026a0:	e9 94 00 00 00       	jmp    c0102739 <printf+0x311>
c01026a5:	83 ec 08             	sub    $0x8,%esp
c01026a8:	ff 75 dc             	push   -0x24(%ebp)
c01026ab:	8d 45 b3             	lea    -0x4d(%ebp),%eax
c01026ae:	50                   	push   %eax
c01026af:	e8 71 fc ff ff       	call   c0102325 <print>
c01026b4:	83 c4 10             	add    $0x10,%esp
c01026b7:	83 f0 01             	xor    $0x1,%eax
c01026ba:	84 c0                	test   %al,%al
c01026bc:	74 07                	je     c01026c5 <printf+0x29d>
c01026be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01026c3:	eb 74                	jmp    c0102739 <printf+0x311>
c01026c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01026c8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01026cb:	01 d0                	add    %edx,%eax
c01026cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01026d0:	eb 56                	jmp    c0102728 <printf+0x300>
c01026d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026d5:	89 45 08             	mov    %eax,0x8(%ebp)
c01026d8:	83 ec 0c             	sub    $0xc,%esp
c01026db:	ff 75 08             	push   0x8(%ebp)
c01026de:	e8 c6 00 00 00       	call   c01027a9 <strlen>
c01026e3:	83 c4 10             	add    $0x10,%esp
c01026e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01026e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01026ec:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
c01026ef:	73 07                	jae    c01026f8 <printf+0x2d0>
c01026f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01026f6:	eb 41                	jmp    c0102739 <printf+0x311>
c01026f8:	83 ec 08             	sub    $0x8,%esp
c01026fb:	ff 75 e4             	push   -0x1c(%ebp)
c01026fe:	ff 75 08             	push   0x8(%ebp)
c0102701:	e8 1f fc ff ff       	call   c0102325 <print>
c0102706:	83 c4 10             	add    $0x10,%esp
c0102709:	83 f0 01             	xor    $0x1,%eax
c010270c:	84 c0                	test   %al,%al
c010270e:	74 07                	je     c0102717 <printf+0x2ef>
c0102710:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102715:	eb 22                	jmp    c0102739 <printf+0x311>
c0102717:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010271a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010271d:	01 d0                	add    %edx,%eax
c010271f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102722:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102725:	01 45 08             	add    %eax,0x8(%ebp)
c0102728:	8b 45 08             	mov    0x8(%ebp),%eax
c010272b:	0f b6 00             	movzbl (%eax),%eax
c010272e:	84 c0                	test   %al,%al
c0102730:	0f 85 0a fd ff ff    	jne    c0102440 <printf+0x18>
c0102736:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102739:	c9                   	leave
c010273a:	c3                   	ret

c010273b <putchar>:
c010273b:	55                   	push   %ebp
c010273c:	89 e5                	mov    %esp,%ebp
c010273e:	83 ec 18             	sub    $0x18,%esp
c0102741:	8b 45 08             	mov    0x8(%ebp),%eax
c0102744:	88 45 f7             	mov    %al,-0x9(%ebp)
c0102747:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
c010274b:	83 ec 0c             	sub    $0xc,%esp
c010274e:	50                   	push   %eax
c010274f:	e8 41 f9 ff ff       	call   c0102095 <terminal_putchar>
c0102754:	83 c4 10             	add    $0x10,%esp
c0102757:	8b 45 08             	mov    0x8(%ebp),%eax
c010275a:	c9                   	leave
c010275b:	c3                   	ret

c010275c <abort>:
c010275c:	55                   	push   %ebp
c010275d:	89 e5                	mov    %esp,%ebp
c010275f:	83 ec 08             	sub    $0x8,%esp
c0102762:	83 ec 0c             	sub    $0xc,%esp
c0102765:	68 59 31 10 c0       	push   $0xc0103159
c010276a:	e8 b9 fc ff ff       	call   c0102428 <printf>
c010276f:	83 c4 10             	add    $0x10,%esp
c0102772:	f4                   	hlt
c0102773:	90                   	nop
c0102774:	eb fd                	jmp    c0102773 <abort+0x17>

c0102776 <memset>:
c0102776:	55                   	push   %ebp
c0102777:	89 e5                	mov    %esp,%ebp
c0102779:	83 ec 10             	sub    $0x10,%esp
c010277c:	8b 45 08             	mov    0x8(%ebp),%eax
c010277f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102782:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102789:	eb 11                	jmp    c010279c <memset+0x26>
c010278b:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010278e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102791:	01 d0                	add    %edx,%eax
c0102793:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102796:	88 10                	mov    %dl,(%eax)
c0102798:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010279c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010279f:	3b 45 10             	cmp    0x10(%ebp),%eax
c01027a2:	72 e7                	jb     c010278b <memset+0x15>
c01027a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01027a7:	c9                   	leave
c01027a8:	c3                   	ret

c01027a9 <strlen>:
c01027a9:	55                   	push   %ebp
c01027aa:	89 e5                	mov    %esp,%ebp
c01027ac:	83 ec 10             	sub    $0x10,%esp
c01027af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01027b6:	eb 04                	jmp    c01027bc <strlen+0x13>
c01027b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01027bc:	8b 55 08             	mov    0x8(%ebp),%edx
c01027bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01027c2:	01 d0                	add    %edx,%eax
c01027c4:	0f b6 00             	movzbl (%eax),%eax
c01027c7:	84 c0                	test   %al,%al
c01027c9:	75 ed                	jne    c01027b8 <strlen+0xf>
c01027cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01027ce:	c9                   	leave
c01027cf:	c3                   	ret

c01027d0 <__do_global_ctors_aux>:
c01027d0:	a1 08 40 10 c0       	mov    0xc0104008,%eax
c01027d5:	83 f8 ff             	cmp    $0xffffffff,%eax
c01027d8:	74 2e                	je     c0102808 <__do_global_ctors_aux+0x38>
c01027da:	55                   	push   %ebp
c01027db:	89 e5                	mov    %esp,%ebp
c01027dd:	53                   	push   %ebx
c01027de:	bb 08 40 10 c0       	mov    $0xc0104008,%ebx
c01027e3:	83 ec 04             	sub    $0x4,%esp
c01027e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
c01027ed:	00 
c01027ee:	66 90                	xchg   %ax,%ax
c01027f0:	ff d0                	call   *%eax
c01027f2:	8b 43 fc             	mov    -0x4(%ebx),%eax
c01027f5:	83 eb 04             	sub    $0x4,%ebx
c01027f8:	83 f8 ff             	cmp    $0xffffffff,%eax
c01027fb:	75 f3                	jne    c01027f0 <__do_global_ctors_aux+0x20>
c01027fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102800:	c9                   	leave
c0102801:	c3                   	ret
c0102802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102808:	c3                   	ret

Disassembly of section .init:

c0102809 <_init>:
c0102809:	55                   	push   %ebp
c010280a:	89 e5                	mov    %esp,%ebp
c010280c:	e8 ef e8 ff ff       	call   c0101100 <frame_dummy>
c0102811:	e8 ba ff ff ff       	call   c01027d0 <__do_global_ctors_aux>
c0102816:	5d                   	pop    %ebp
c0102817:	c3                   	ret

Disassembly of section .fini:

c0102818 <_fini>:
c0102818:	55                   	push   %ebp
c0102819:	89 e5                	mov    %esp,%ebp
c010281b:	e8 60 e8 ff ff       	call   c0101080 <__do_global_dtors_aux>
c0102820:	5d                   	pop    %ebp
c0102821:	c3                   	ret
