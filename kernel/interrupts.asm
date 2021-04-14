global _idt_load

_idt_load:
	[extern _idtp]
	lidt [_idtp]
	ret
