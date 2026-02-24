Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014B36654E
	for <workflows@vger.kernel.org>; Tue, 24 Feb 2026 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924234; cv=none; b=i593OFmkDQeAR3c9L8aboJta3Mmdda5KWHe6fsUrEfdOwyyerhASpDUisXB2E2Ba+dZGibpkT2nqwNuhnJKFiQtE+WamSuNpvmfBWHtZfAzHBWCrQQig5vBMmr15/e9lzWBsJy0G84md+IVnP9Hxrl/enHYdElIQyCh9laT0wTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924234; c=relaxed/simple;
	bh=c6lTnbEsUhvqm5E0OTv3lhpmaUzOiFsoE3QUr8rmWWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mpnjj6CAc8GMD+J85GWEB+O9b/GGxx9f767u9FpoaF95HlHZ9XLswZ+TQn2tE9aVpgn0Z5IYTUYbQhUKmIaSFI/UZFrkIm+ojX6eYHR9I33KTXycTFxBcQn6HOMUufFX4JQDAHl8Cmoz02CaUZfHeFu93+kf9UxHBFsPYHOWaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dWJ/DG0g; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dWJ/DG0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771924224; x=1772183424;
	bh=JTNnUecjMCgQWBRNlhXYFdQDFTHMCliRoDTga/EjldQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dWJ/DG0ges2MMFucvXvKldpYQHiwd65GFh8Q6JRt5eF3NOOU2JD331ajDFkHdp88+
	 hzR1BK+OWCqjd/baSJAa85olpO9ZsK2yejzT4bRbfeFFhkkkKpybSiDqoZ6qJ0JOjh
	 sBCtHk9CwQW+kFn0C6YSy/BsVilAZcVjiH3FshE+nwZZvdZz2ZUYr3Ru34BWBkPHYN
	 HTdmSAoBfY2j3sL7T1E7sSClNeueilHuF7LsPBHTpFaLFHyr27DUaw359kywacQHjM
	 IlEeFxrgkE7B3iNtww37e/y9froeZNQoF9UOem/fQ2gI4KAnS5Kn5BP2dRfpiQdBRv
	 3WqHEUOqbKa5A==
Date: Tue, 24 Feb 2026 09:10:18 +0000
To: Dave Hansen <dave.hansen@intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org
Subject: Re: [PATCH v10 13/13] x86/kasan: Make software tag-based kasan available
Message-ID: <aZ1qOpMc9PohArcL@wieczorr-mobl1.localdomain>
In-Reply-To: <f25c328f-4ce7-4494-a200-af4ba928e724@intel.com>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <8fd6275f980b90c62ddcb58cfbc78796c9fa7740.1770232424.git.m.wieczorretman@pm.me> <f25c328f-4ce7-4494-a200-af4ba928e724@intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 263b095a4846ac376e793435bbda706f4f4065b0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-02-23 at 12:52:03 -0800, Dave Hansen wrote:
>...
>> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x=
86/x86_64/mm.rst
>> index a6cf05d51bd8..7e2e4c5fa661 100644
>> --- a/Documentation/arch/x86/x86_64/mm.rst
>> +++ b/Documentation/arch/x86/x86_64/mm.rst
>> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unu=
sed hole
>>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual=
 memory map (vmemmap_base)
>>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unu=
sed hole
>> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN s=
hadow memory
>> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN s=
hadow memory (generic mode)
>> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN s=
hadow memory (software tag-based mode)
>>    __________________|____________|__________________|_________|________=
____________________________________________________
>>                                                                |
>>                                                                | Identic=
al layout to the 56-bit one from here on:
>> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unu=
sed hole
>>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual=
 memory map (vmemmap_base)
>>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unu=
sed hole
>> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN s=
hadow memory
>> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN s=
hadow memory (generic mode)
>> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN s=
hadow memory (software tag-based mode)
>>    __________________|____________|__________________|_________|________=
____________________________________________________
>
>I think the idea of these is that you can run through, find *one* range
>and know what a given address maps to. This adds overlapping ranges.
>Could you make it clear that part of the area is "generic mode" only and
>the other part is for generic mode and for "software tag-based mode"?

Boris suggested adding a footnote to clarify these are alternative ranges [=
1].
Perhaps I can add a star '*' next to these two so it can notify someone to =
look for
the footnote?

[1] https://lore.kernel.org/all/20260113161047.GNaWZuh21aoxqtTNXS@fat_crate=
.local/

>
>> @@ -176,5 +178,9 @@ Be very careful vs. KASLR when changing anything her=
e. The KASLR address
>>  range must not overlap with anything except the KASAN shadow area, whic=
h is
>>  correct as KASAN disables KASLR.
>>
>> +The 'KASAN shadow memory (generic mode)/(software tag-based mode)' rang=
es are
>> +mutually exclusive and depend on which KASAN setting is chosen:
>> +CONFIG_KASAN_GENERIC or CONFIG_KASAN_SW_TAGS.
>> +
>>  For both 4- and 5-level layouts, the KSTACK_ERASE_POISON value in the l=
ast 2MB
>>  hole: ffffffffffff4111
>> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools=
/kasan.rst
>> index 64dbf8b308bd..03b508ebe673 100644
>> --- a/Documentation/dev-tools/kasan.rst
>> +++ b/Documentation/dev-tools/kasan.rst
>> @@ -22,8 +22,8 @@ architectures, but it has significant performance and =
memory overheads.
>>
>>  Software Tag-Based KASAN or SW_TAGS KASAN, enabled with CONFIG_KASAN_SW=
_TAGS,
>>  can be used for both debugging and dogfood testing, similar to userspac=
e HWASan.
>> -This mode is only supported for arm64, but its moderate memory overhead=
 allows
>> -using it for testing on memory-restricted devices with real workloads.
>> +This mode is only supported for arm64 and x86, but its moderate memory =
overhead
>> +allows using it for testing on memory-restricted devices with real work=
loads.
>>
>>  Hardware Tag-Based KASAN or HW_TAGS KASAN, enabled with CONFIG_KASAN_HW=
_TAGS,
>>  is the mode intended to be used as an in-field memory bug detector or a=
s a
>> @@ -351,10 +351,12 @@ Software Tag-Based KASAN
>>  Software Tag-Based KASAN uses a software memory tagging approach to che=
cking
>>  access validity. It is currently only implemented for the arm64 archite=
cture.
>>
>> -Software Tag-Based KASAN uses the Top Byte Ignore (TBI) feature of arm6=
4 CPUs
>> -to store a pointer tag in the top byte of kernel pointers. It uses shad=
ow memory
>> -to store memory tags associated with each 16-byte memory cell (therefor=
e, it
>> -dedicates 1/16th of the kernel memory for shadow memory).
>> +Software Tag-Based KASAN uses the Top Byte Ignore (TBI) feature of arm6=
4 CPUs to
>> +store a pointer tag in the top byte of kernel pointers. Analogously to =
TBI on
>> +x86 CPUs Linear Address Masking (LAM) feature is used and the pointer t=
ag is
>> +stored in four bits of the kernel pointer's top byte. Software Tag-Base=
d mode
>> +uses shadow memory to store memory tags associated with each 16-byte me=
mory cell
>> +(therefore, it dedicates 1/16th of the kernel memory for shadow memory)=
.
>
>This is going to get really cumbersome really fast if all the
>architectures doing this add their marketing terms in here.
>
>=09Software Tag-Based KASAN uses the hardware CPU features* to
>=09repurpose space inside kernel pointers to store pointer tags.
>=09...
>
>and then _elsewhere_ you can describe the two implementations.

Okay, I'll rewrite that.

>
>>  On each memory allocation, Software Tag-Based KASAN generates a random =
tag, tags
>>  the allocated memory with this tag, and embeds the same tag into the re=
turned
>> @@ -370,12 +372,14 @@ Software Tag-Based KASAN also has two instrumentat=
ion modes (outline, which
>>  emits callbacks to check memory accesses; and inline, which performs th=
e shadow
>>  memory checks inline). With outline instrumentation mode, a bug report =
is
>>  printed from the function that performs the access check. With inline
>> -instrumentation, a ``brk`` instruction is emitted by the compiler, and =
a
>> -dedicated ``brk`` handler is used to print bug reports.
>> -
>> -Software Tag-Based KASAN uses 0xFF as a match-all pointer tag (accesses=
 through
>> -pointers with the 0xFF pointer tag are not checked). The value 0xFE is =
currently
>> -reserved to tag freed memory regions.
>> +instrumentation, arm64's implementation uses the ``brk`` instruction em=
itted by
>> +the compiler, and a dedicated ``brk`` handler is used to print bug repo=
rts. On
>> +x86 inline mode doesn't work yet due to missing compiler support.
>> +
>> +For arm64 Software Tag-Based KASAN uses 0xFF as a match-all pointer tag
>> +(accesses through pointers with the 0xFF pointer tag are not checked). =
The value
>> +0xFE is currently reserved to tag freed memory regions. On x86 the same=
 tags
>> +take on 0xF and 0xE respectively.
>
>I think this would be more clear with a table or list of features and
>supported architectures.

That is a good idea, I'll work on that

>
>>  Hardware Tag-Based KASAN
>>  ~~~~~~~~~~~~~~~~~~~~~~~~
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 80527299f859..877668cd5deb 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -67,6 +67,7 @@ config X86
>>  =09select ARCH_CLOCKSOURCE_INIT
>>  =09select ARCH_CONFIGURES_CPU_MITIGATIONS
>>  =09select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>> +=09select ARCH_DISABLE_KASAN_INLINE=09if X86_64 && KASAN_SW_TAGS
>>  =09select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE && M=
IGRATION
>>  =09select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>>  =09select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>> @@ -196,6 +197,8 @@ config X86
>>  =09select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>  =09select HAVE_ARCH_KASAN=09=09=09if X86_64
>>  =09select HAVE_ARCH_KASAN_VMALLOC=09=09if X86_64
>> +=09select HAVE_ARCH_KASAN_SW_TAGS=09=09if ADDRESS_MASKING && CC_IS_CLAN=
G
>> +=09select ARCH_NEEDS_DEFER_KASAN=09=09if ADDRESS_MASKING
>>  =09select HAVE_ARCH_KFENCE
>>  =09select HAVE_ARCH_KMSAN=09=09=09if X86_64
>>  =09select HAVE_ARCH_KGDB
>> @@ -410,6 +413,7 @@ config AUDIT_ARCH
>>  config KASAN_SHADOW_OFFSET
>>  =09hex
>>  =09depends on KASAN
>> +=09default 0xeffffc0000000000 if KASAN_SW_TAGS
>>  =09default 0xdffffc0000000000
>
>Please separate this from the documentation.

Okay, I'll split the documentation part into a separate patch.

>
>>  config HAVE_INTEL_TXT
>> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/=
misc.h
>> index fd855e32c9b9..ba70036c2abd 100644
>> --- a/arch/x86/boot/compressed/misc.h
>> +++ b/arch/x86/boot/compressed/misc.h
>> @@ -13,6 +13,7 @@
>>  #undef CONFIG_PARAVIRT_SPINLOCKS
>>  #undef CONFIG_KASAN
>>  #undef CONFIG_KASAN_GENERIC
>> +#undef CONFIG_KASAN_SW_TAGS
>>
>>  #define __NO_FORTIFY
>>
>> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
>> index 90c18e30848f..53ab7de16517 100644
>> --- a/arch/x86/include/asm/kasan.h
>> +++ b/arch/x86/include/asm/kasan.h
>> @@ -6,7 +6,12 @@
>>  #include <linux/kasan-tags.h>
>>  #include <linux/types.h>
>>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> +
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define KASAN_SHADOW_SCALE_SHIFT 4
>> +#else
>>  #define KASAN_SHADOW_SCALE_SHIFT 3
>> +#endif
>>
>>  /*
>>   * Compiler uses shadow offset assuming that addresses start
>> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
>> index 7f5c11328ec1..8cbb8ec32061 100644
>> --- a/arch/x86/mm/kasan_init_64.c
>> +++ b/arch/x86/mm/kasan_init_64.c
>> @@ -465,4 +465,9 @@ void __init kasan_init(void)
>>
>>  =09init_task.kasan_depth =3D 0;
>>  =09kasan_init_generic();
>> +
>> +=09if (cpu_feature_enabled(X86_FEATURE_LAM))
>> +=09=09kasan_init_sw_tags();
>> +=09else
>> +=09=09pr_info("KernelAddressSanitizer not initialized (sw-tags): hardwa=
re doesn't support LAM\n");
>>  }
>> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
>> index a4bb610a7a6f..d13ea8da7bfd 100644
>> --- a/lib/Kconfig.kasan
>> +++ b/lib/Kconfig.kasan
>> @@ -112,7 +112,8 @@ config KASAN_SW_TAGS
>>
>>  =09  Requires GCC 11+ or Clang.
>>
>> -=09  Supported only on arm64 CPUs and relies on Top Byte Ignore.
>> +=09  Supported on arm64 CPUs that support Top Byte Ignore and on x86 CP=
Us
>> +=09  that support Linear Address Masking.
>
>Can this read more like:
>
>=09Supported on:
>=09=09arm64: CPUs with Top Byte Ignore
>=09=09x86:   CPUs with Linear Address Masking.
>
>please?

Sure, I'll change it.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

